#> structs.py
#   Implements net-cluster data structures used by this project

from svmath import *

#> OBB
#   - Oriented bounding box
#   - Used for the physics objects

OBB_outputs = [
    Fixed(8, 0, "widthA"),
    Fixed(8, 0, "heightA"),
    Vec2(7, 25, "posA"),
    Vec2(6, 26, "velA"),
    Vec2(2, 14, "uA"),
    Vec2(2, 14, "vA"),

    Fixed(8, 0, "widthB"),
    Fixed(8, 0, "heightB"),
    Vec2(7, 25, "posB"),
    Vec2(6, 26, "velB"),
    Vec2(2, 14, "uB"),
    Vec2(2, 14, "vB")
]

OBB = Struct("OBB", [], OBB_outputs)