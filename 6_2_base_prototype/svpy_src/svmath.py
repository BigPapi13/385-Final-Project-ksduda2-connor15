#> svmath.py
#   - svpy plugin for math operations
from __future__ import annotations

__all__ = [
    "Fixed",
    "to_bits",
    "Vec2",
    "cos",
    "sin",
    "Struct",
    "resize",
    "always_comb",
    "always_ff",
    "begin_comb",
    "end_comb",
    "begin_ff",
    "end_ff"
]

from math import floor
from svpy import *
from copy import deepcopy
from contextlib import contextmanager
import svpy

## GLOBALS
context_type = "NORMAL"     # "NORMAL" | "COMB" | "FF"
operation_queue = []
operation_declare_queue = []

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
        global context_type
        if context_type == "NORMAL":
            if type(other) is Fixed:
                difference = self.precision - other.precision

                # Other gets bit shifted by difference
                if difference > 0:
                    svwritel(f"assign {self.name} = {other.name} << {difference};")
                elif difference < 0:
                    svwritel(f"assign {self.name} = {other.name} >>> {-difference};")
                else:
                    svwritel(f"assign {self.name} = {other.name};")
            
            else:
                svwritel(f"assign {self.name} = {to_bits(other, self.integer_bits, self.precision)};")            

        elif context_type == "COMB":
            self.comb_assign(other)
        
        elif context_type == "FF":
            self.ff_assign(other)

        else:
            raise ValueError("context_type is in invalid state")

    def comb_assign(self, other: Fixed | int | float):
        if type(other) is Fixed:
            difference = self.precision - other.precision

            # Other gets bit shifted by difference
            if difference > 0:
                svwritel(f"{self.name} = {other.name} << {difference};")
            elif difference < 0:
                svwritel(f"{self.name} = {other.name} >>> {-difference};")
            else:
                svwritel(f"{self.name} = {other.name};")
        
        else:
            svwritel(f"{self.name} = {to_bits(other, self.integer_bits, self.precision)};")

    def ff_assign(self, other: Fixed | int | float):
        if type(other) is Fixed:
            difference = self.precision - other.precision

            # Other gets bit shifted by difference
            if difference > 0:
                svwritel(f"{self.name} <= {other.name} << {difference};")
            elif difference < 0:
                svwritel(f"{self.name} <= {other.name} >>> {-difference};")
            else:
                svwritel(f"{self.name} <= {other.name};")
        
        else:
            svwritel(f"{self.name} <= {to_bits(other, self.integer_bits, self.precision)};")

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

        result = Fixed(max(self.integer_bits, other_int_bits), max(self.precision, other_precision), f"opnet_{Fixed.opnet_count}")
        Fixed.opnet_count += 1

        # Case 1: Fixed + Fixed
        if type(other) is Fixed:
            difference = self.precision - other.precision
            if difference > 0:
                write_operation(result, f"{result.name} = ({self.name} >>> {difference}) + {other.name};")
            elif difference < 0:
                write_operation(result, f"{result.name} = {self.name} + ({other.name} >>> {-difference});")
            else:
                write_operation(result, f"{result.name} = {self.name} + {other.name};")

        # Case 2: Fixed + int/float
        if type(other) is int or type(other) is float:
            write_operation(result, f"{result.name} = {self.name} + {to_bits(other, self.integer_bits, self.precision)};")

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

        result = Fixed(max(self.integer_bits, other_int_bits), max(self.precision, other_precision), f"opnet_{Fixed.opnet_count}")
        Fixed.opnet_count += 1


        # Case 1: Fixed + Fixed
        if type(other) is Fixed:
            difference = self.precision - other.precision
            if difference > 0:
                write_operation(result, f"{result.name} = ({self.name} >>> {difference}) - {other.name};")
            elif difference < 0:
                write_operation(result, f"{result.name} = {self.name} - ({other.name} >>> {-difference});")
            else:
                write_operation(result, f"{result.name} = {self.name} - {other.name};")

        # Case 2: Fixed + int/float
        if type(other) is int or type(other) is float:
            write_operation(result, f"{result.name} = {self.name} - {to_bits(other, self.integer_bits, self.precision)};")

        return result
    
    def __mul__(self, other: Fixed) -> Fixed:
        if type(other) is Fixed:
            result = Fixed(self.integer_bits + other.integer_bits, self.precision + other.precision, f"opnet_{Fixed.opnet_count}")
            Fixed.opnet_count += 1

            write_operation(result, f"{result.name} = {self.name} * {other.name};")

        else:
            result = Fixed(2 * self.integer_bits, 2 * self.precision, f"opnet_{Fixed.opnet_count}")
            Fixed.opnet_count += 1

            write_operation(result, f"{result.name} = {self.name} * {to_bits(other, self.integer_bits, self.precision)};")

        return result
    
    def __neg__(self):
        result = Fixed(self.integer_bits, self.precision,  f"opnet_{Fixed.opnet_count}")
        Fixed.opnet_count += 1

        global context_type
        write_operation(result, f"{result.name} = ~({self.name}) + 1'b1;\n")

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
        self.integer_bits = integer_bits
        self.precision = precision_bits
        self.name = name

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

    def __add__(self, other: Vec2 | list | tuple) -> ExpressionVec2:
        return ExpressionVec2(self.x + other[0], self.y + other[1])

    def __sub__(self, other: Vec2 | list | tuple) -> ExpressionVec2:
        return ExpressionVec2(self.x - other[0], self.y - other[1])
    
    def __neg__(self) -> ExpressionVec2:
        return ExpressionVec2(-self.x, -self.y)

    def Dot(self, other: Vec2 | list | tuple) -> Fixed:
        return (self.x * other[0]) + (self.y * other[1])
    
    ## To-do: Scalar multiplication

    def SetName(self, name):
        self.name = name
        self.x.name = f"{name}_x"
        self.y.name = f"{name}_y"


class ExpressionVec2(Vec2):
    def __init__(self, x: Fixed, y: Fixed):
        self.x = x
        self.y = y

# System verilog sine (note: using an internally defined sine method using ROM - USE SPARINGLY)
sine_counter = 0
def sin(theta: Fixed) -> Fixed:
    # Generate cosine module
    global sine_counter
    result = Fixed(2, 14, f"sin_{sine_counter}")
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
    if 2**(integer_bits - 1) <= value:
        print(f"Warning: {value} cannot be represented with {integer_bits} integer bits and {precision_bits} precision bits")
    
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
    def __init__(self, name, nets: list = []):
        self.name = name
        self.name_counter = 0
        self.nets = []

        for net in nets:
            # Allows for compound structs
            if isinstance(net, Struct):
                for subnet in net.nets:
                    self.nets.append(subnet)
            else:
                self.nets.append(net)
            setattr(self, net.name, net)

    # Adds a net. Use either a Fixed object or one of the compound data types building on Fixed
    def add_net(self, net):
        self.nets.append(net)

    def declare(self, mode: str = None):
        for i in range(len(self.nets)):
            net = self.nets[i]
            net.declare(mode)

            if i != len(self.nets) - 1 and mode != None:
                svwrite(",\n")

    def __call__(self, name: str = None):
        if name == None:
            name = f"{self.name}_inst_{self.name_counter}"
        self.name_counter += 1

        return StructInst(name, self.nets)

    def assign(self, other: StructInst):
        for i in range(len(self.nets)):
            self.nets[i].assign(other.nets[i])

    # Connects ports within a module declaration, i.e. .net(other_net)
    def module_assign(self, other: StructInst):
        for i in range(len(self.nets)):
            if isinstance(self.nets[i], Vec2):
                svwrite(f".{self.nets[i].x}({other.nets[i].x}),\n.{self.nets[i].y}({other.nets[i].y})")
            else:
                svwrite(f".{self.nets[i]}({other.nets[i]})")
            
            if i != len(self.nets) - 1:
                svwrite(",\n")

#Instance of a struct
class StructInst(Struct):
    def __init__(self, name: str, nets: list):
        self.name = name
        self.nets = deepcopy(nets)
        for net in self.nets:
            setattr(self, net.name, net)
            net.name = f"{name}_{net.name}"
            if isinstance(net, Vec2):
                net.SetName(net.name)

# Resizes the value provided to have the same precision as size_provider
def resize(value: int | float | Fixed | Vec2, size_provider: Fixed | Vec2):
    if type(value) is int or type(value) is float:
        return to_bits(value, size_provider.integer_bits, size_provider.precision)
    
    elif isinstance(value, Fixed):
        difference = value.precision - size_provider.precision
        return ShiftedFixed(size_provider.integer_bits, size_provider.precision, value.name, shift=difference)

class ShiftedFixed(Fixed):
    def __init__(self, integer_bits: int, precision_bits: int, name: str = None, shift: int = 0):
        super().__init__(integer_bits, precision_bits, name)
        self.shift = shift  # Shift represents number of bits to right shift

    def __str__(self):
        if self.shift > 0:
            return f"({self.name} >>> {self.shift})"
        
        elif self.shift < 0:
            return f"({self.name} << {-self.shift})" 
        
        return f"{self.name}"
    
# CONTEXT MANAGEMENT
#   - Different kinds of assignments are needed in different contexts
#   - Using this helps us track the current context


@contextmanager
def always_comb():
    global context_type 
    context_type = "COMB"
    svwritel("always_comb begin")
    yield
    svwritel("end")
    context_type = "NORMAL"

@contextmanager
def always_ff(clk):
    global context_type 
    context_type = "FF"
    svwritel("always_ff @(posedge {clk}) begin")
    yield
    end_ff()

def begin_comb():
    global context_type 
    context_type = "COMB"
    svwritel("always_comb begin")

def end_comb():
    end_ff()

def begin_ff(clk):
    global context_type 
    context_type = "FF"
    svwritel("always_ff @(posedge {clk}) begin")

def end_ff():
    global context_type
    svwritel("end")
    context_type = "NORMAL"

    global operation_queue
    global operation_declare_queue
    for result in operation_declare_queue:
        result.declare()
    for op in operation_queue:
        svwrite(f"assign {op}")

    operation_queue = []
    operation_declare_queue = []


# Writes an operation
#   - If in an always comb block, remove "assign" from beginning
#   - If in an always_ff block, queue for after its finished
#   - If outside a block, just perform assignment
def write_operation(result, operation: str):
    global operation_queue
    global operation_declare_queue
    global context_type
    
    if svpy.inline_state == True:
        svqueue(write_operation, result, operation)
        return


    if context_type == "NORMAL":
        result.declare()
        svwritel(f"assign {operation}")
    elif context_type == "COMB":
        operation_declare_queue.append(result)
        svwritel(operation)
    elif context_type == "FF":
        operation_queue.append(operation)