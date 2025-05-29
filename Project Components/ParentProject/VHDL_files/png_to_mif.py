from PIL import Image

def png_to_rgb444_mif(png_path, mif_path, target_size=(32, 32)):
    img = Image.open(png_path).convert('RGB')  # Force RGB mode
    img = img.resize(target_size)

    pixels = list(img.getdata())
    depth = len(pixels)

    with open(mif_path, 'w') as f:
        f.write("WIDTH=12;\n")
        f.write(f"DEPTH={depth};\n")
        f.write("ADDRESS_RADIX=UNS;\n")
        f.write("DATA_RADIX=HEX;\n")
        f.write("CONTENT BEGIN\n")
        for addr, (r, g, b) in enumerate(pixels):
            r4 = r >> 4  # 8-bit → 4-bit
            g4 = g >> 4
            b4 = b >> 4
            rgb444 = (r4 << 8) | (g4 << 4) | b4
            f.write(f"    {addr} : {rgb444:03X};\n")
        f.write("END;\n")

    print(f"✅ RGB444 MIF generated: {mif_path}")

# Example usage
if __name__ == "__main__":
    png_to_rgb444_mif("mainCharacter.png", "mc_sprite.mif", target_size=(32, 32))

