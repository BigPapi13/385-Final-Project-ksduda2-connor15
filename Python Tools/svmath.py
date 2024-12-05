#> svmath.py
#   - svpy plugin for math operations

__all__ = [
    "to_bits"
]

from math import floor

def to_bits(value, bits=16, precision=0):
    value = value * (2**precision)

    output = ""

    value = floor(value)
    for i in range(bits):
        output = (str(value % 2)) + output
        value = floor(value / 2)

    return f"{bits}'b" + output

