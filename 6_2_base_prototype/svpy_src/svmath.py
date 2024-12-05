#> svmath.py
#   - svpy plugin for math operations
from __future__ import annotations

__all__ = [
    "Fixed",
    "to_bits",
    "Vec2",
    "cos",
    "sin",
    "Struct"
]

from math import floor
from svpy import svwrite, svwritel

# Fixed point value class
class Fixed:
    fixed_counter = 0
    opnet_count = 0

    def __init__(self, integer_bits: int, precision_bits: int, name: str = None):
        if name == None:
            name = f"fixed_{Fixed.fixed_counter}"
            Fixed.fixed_counter += 1

        self.bits = integer_bits + precision_bits
        self.integer_bits = integer_bits
        self.precision = precision_bits
        self.name = name

    # Declares the variable in system verilog
    # Can be specified whether it's an output or input
    def declare(self, mode : None | str = None, signed: bool = True):    # Mode == "output", "input", or None
        sign_text = ""
        if signed:
            sign_text = " signed"
        
        if mode == None:
            svwritel(f"logic{sign_text} [{self.bits - 1} : 0] {self.name};")
        else:
            svwrite(f"{mode} logic{sign_text} [{self.bits - 1} : 0] {self.name}")
        
    # Assignment basically acts like the = operator, but instead of the python variable being changed, the assignment is reflected in SV
    def assign(self, other: Fixed | int | float):
        if type(other) is Fixed:
            difference = self.precision - other.precision

            # Other gets bit shifted by difference
            if difference > 0:
                svwritel(f"assign {self.name} = {other.name} << {difference};")
            elif difference < 0:
                svwritel(f"assign {self.name} = {other.name} >> {-difference};")
            else:
                svwritel(f"assign {self.name} = {other.name};")
        
        else:
            svwritel(f"assign {self.name} = {to_bits(other, self.integer_bits, self.precision)};")            


    def __add__(self, other: Fixed | int | float) -> Fixed:
        # Create new net representing the result of the addition
        #   - Integer part is maximum of operands
        #   - Precision is minimum of operands
        if other is Fixed:
            other_int_bits = other.integer_bits
            other_precision = other.precision
        else:
            other_int_bits = self.integer_bits
            other_precision = self.precision

        result = Fixed(max(self.integer_bits, other_int_bits), min(self.precision, other_precision), f"opnet_{Fixed.opnet_count}")
        result.declare()
        Fixed.opnet_count += 1


        # Case 1: Fixed + Fixed
        if type(other) is Fixed:
            difference = self.precision - other.precision
            if difference > 0:
                svwritel(f"assign {result.name} = {self.name}[{self.bits - 1} : {difference}] + {other.name};")
            elif difference < 0:
                svwritel(f"assign {result.name} = {self.name} + {other.name}[{other.bits - 1} : {-difference}];")
            else:
                svwritel(f"assign {result.name} = {self.name} + {other.name};")

        # Case 2: Fixed + int/float
        if type(other) is int or type(other) is float:
            svwritel(f"assign {result.name} = {self.name} + {to_bits(other, self.integer_bits, self.precision)};")

        return result

    def __sub__(self, other: Fixed | int | float) -> Fixed:
        # Create new net representing the result of the subtraction
        #   - Integer part is maximum of operands
        #   - Precision is minimum of operands
        if other is Fixed:
            other_int_bits = other.integer_bits
            other_precision = other.precision
        else:
            other_int_bits = self.integer_bits
            other_precision = self.precision

        result = Fixed(max(self.integer_bits, other_int_bits), min(self.precision, other_precision), f"opnet_{Fixed.opnet_count}")
        result.declare()
        Fixed.opnet_count += 1


        # Case 1: Fixed + Fixed
        if type(other) is Fixed:
            difference = self.precision - other.precision
            if difference > 0:
                svwritel(f"assign {result.name} = {self.name}[{self.bits - 1} : {difference}] - {other.name};")
            elif difference < 0:
                svwritel(f"assign {result.name} = {self.name} - {other.name}[{other.bits - 1} : {-difference}];")
            else:
                svwritel(f"assign {result.name} = {self.name} - {other.name};")

        # Case 2: Fixed + int/float
        if type(other) is int or type(other) is float:
            svwritel(f"assign {result.name} = {self.name} - {to_bits(other, self.integer_bits, self.precision)};")

        return result
    
    def __mul__(self, other: Fixed) -> Fixed:
        if type(other) is Fixed:
            result = Fixed(self.integer_bits + other.integer_bits, self.precision + other.precision, f"opnet_{Fixed.opnet_count}")
            result.declare()
            Fixed.opnet_count += 1

            svwritel(f"assign {result.name} = {self.name} * {other.name};")

        else:
            result = Fixed(2 * self.integer_bits, 2 * self.precision, f"opnet_{Fixed.opnet_count}")
            result.declare()
            Fixed.opnet_count += 1

            svwritel(f"assign {result.name} = {self.name} * {to_bits(other, self.integer_bits, self.precision)};")

        return result
    
    def __neg__(self):
        result = Fixed(self.integer_bits, self.precision,  f"opnet_{Fixed.opnet_count}")
        result.declare()
        Fixed.opnet_count += 1

        svwrite(f"assign {result.name} = {self.name} * {to_bits(-1, self.integer_bits, 0)};\n")

        return result

    def __str__(self):
        return self.name

class Vec2:
    vec_counter = 0

    def __init__(self, integer_bits: int, precision_bits: int, name: str = None):
        if name == None:
            name = f"vec_{Vec2.vec_counter}"
            Vec2.vec_counter += 1

        self.x = Fixed(integer_bits, precision_bits, f"{name}_x")
        self.y = Fixed(integer_bits, precision_bits, f"{name}_y")

    def declare(self, mode : None | str = None, signed: bool = True):    # Mode == "output", "input", or None
        if mode == None:
            self.x.declare(mode, signed)
            self.y.declare(mode, signed)
        else:
            self.x.declare(mode, signed)
            svwrite(", ")
            self.y.declare(mode, signed)


    def assign(self, other: Vec2 | list | tuple):
        self.x.assign(other[0])
        self.y.assign(other[1])

    def __getitem__(self, key) -> Fixed:
        if key == 0:
            return self.x
        if key == 1:
            return self.y
        
        raise ValueError("Index must be 0 or 1")
    
    def __setitem__(self, key, value):
        self[key].assign(value)
        return self

    def __add__(self, other: Vec2 | list | tuple) -> Vec2:
        return ExpressionVec2(self.x + other[0], self.y + other[1])

    def __sub__(self, other: Vec2 | list | tuple) -> Vec2:
        return ExpressionVec2(self.x - other[0], self.y - other[1])
    
    def Dot(self, other: Vec2 | list | tuple) -> Fixed:
        return (self.x * other[0]) + (self.y * other[1])
    

class ExpressionVec2(Vec2):
    def __init__(self, x: Fixed, y: Fixed):
        self.x = x
        self.y = y

# System verilog sine (note: using an internally defined sine method using ROM - USE SPARINGLY)
sine_counter = 0
def sin(theta: Fixed) -> Fixed:
    # Generate cosine module
    global sine_counter
    result = Fixed(2, 14, f"cos_{sine_counter}")
    result.declare()
    svwritel(f"sin sin_inst_{sine_counter}(.theta({theta.name}), .out({result.name}));")
    sine_counter += 1

    return result

# System verilog cosine (note: using an internally defined cosine method using ROM - USE SPARINGLY)
cosine_counter = 0
def cos(theta: Fixed) -> Fixed:
    # Generate cosine module
    global cosine_counter
    result = Fixed(2, 14, f"cos_{cosine_counter}")
    result.declare()
    svwritel(f"cos cos_inst_{cosine_counter}(.theta({theta.name}), .out({result.name}));")
    cosine_counter += 1

    return result

def to_bits(value, integer_bits=16, precision_bits=0):
    bits = integer_bits + precision_bits
    
    value = value * (2**precision_bits)

    output = ""

    value = floor(value)
    for i in range(bits):
        output = (str(value % 2)) + output
        value = floor(value / 2)

    return f"{bits}'b" + output


# Cluster of nets
class Struct:
    def __init__(self, name, inputs: list = [], outputs: list = []):
        self.name = name
        self.name_counter = 0
        self.inputs = inputs
        self.outputs = outputs

    # Adds a net. Use either a Fixed object or one of the compound data types building on Fixed
    def add_net(self, net):
        self.add_input(net)     # Unspecified nets are just treated as inputs by default
    
    def add_input(self, net):
        self.inputs.append(net)

    def add_output(self, net):
        self.outputs.append(net)

    # Declaration modes:
    #   - Unspecified: Declares everything as signed logic
    #   - "module": Declares everything as inputs/outputs
    def declare(self, mode: str = None):
        if mode == "module":
            last_index = len(self.inputs) + len(self.outputs)- 1

            # Write input nets
            for i in range(len(self.inputs)):
                net = self.inputs[i]
                net.declare("input")
                if i != last_index - 1:
                    svwrite(",\n")
            
            # Write output nets
            for i in range(len(self.outputs)):
                net = self.outputs[i]
                net.declare("output")
                if i != last_index - 1:
                    svwrite(",\n")

        else:
            for net in self.nets():
                net.declare()

    def inst(self, name: str = None):
        if name == None:
            name = f"{self.name}_inst_{self.name_counter}"
        self.name_counter += 1

        return StructInst(name, self.name, self.nets())

    def nets(self):
        out = self.inputs
        for net in self.outputs:
            out.append(net)
        return out
        
    def assign(self, other: StructInst):
        for i in range(len(self.nets())):
            if isinstance(self.nets()[i], Vec2):
                svwrite(f".{self.nets()[i].x},\n.{self.nets()[i].x}")
            else:
                svwrite(f".{self.nets()[i]}")
            
            if i != len(self.nets()) - 1:
                svwrite(",\n")

class StructInst:
    def __init__(self, name: str, nets: list):
        self.name = name
        self.nets = nets

        for net in nets:
            setattr(self, net.name, net)

    def assign(self, other: StructInst):
        for i in range(len(self.nets)):
            self.nets[i].assign(other.nets[i])