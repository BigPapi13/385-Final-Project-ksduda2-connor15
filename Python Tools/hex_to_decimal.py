
while(True):
    val = input("Insert hex number here: ")
    val = int(val, 16)
    if val & 0x8000 == 0x8000:
        val = val - (0x8000 * 2)
    print(val / 2**5)
    print()