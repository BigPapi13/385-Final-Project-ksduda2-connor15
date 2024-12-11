#> structs.py
#   Implements net-cluster data structures used by this project

from svmath import *

#> OBB
#   - Oriented bounding box
#   - Used for the physics objects

OBB = Struct("OBB", [
    Fixed(8, 0, "width"),
    Fixed(8, 0, "height"),
    Vec2(8, 24, "pos"),
    Vec2(6, 26, "vel"),
    Fixed(4, 7, "angle"),
    Fixed(4, 7, "omega")
])


#> Juice
#   - Bundle of processed OBB data
#   - Nice and juicy
Juice = Struct("Juice", [
    Vec2(2, 14, "u"),
    Vec2(2, 14, "v"),

    Vec2(8, 14, "Point0"),
    Vec2(8, 14, "Point1"),
    Vec2(8, 14, "Point2"),
    Vec2(8, 14, "Point3"),
    Fixed(OBB.width.integer_bits - 1, 0, "halfWidth"),
    Fixed(OBB.height.integer_bits - 1, 0, "halfHeight")
])

#> JOBB
#   - Juiced Oriented Bounding Box
#   - Contains an OBB's data and its juice
JOBB = Struct("JOBB", [
    OBB,
    Juice
])

#> Contact
#   - Describes a contact in a collision
#   - Components are the normal vector and the contact point location
Contact = Struct("Contact", [
    
])