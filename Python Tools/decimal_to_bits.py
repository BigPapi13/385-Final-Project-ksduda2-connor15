from math import floor


while(True):
    val = float(input("Enter decimal value here: ")) * (2**5)

    output = ""

    val = floor(val)
    for i in range(16):
        output = (str(val % 2)) + output
        val = floor(val / 2)

    print("16'b" + output)
    print()
