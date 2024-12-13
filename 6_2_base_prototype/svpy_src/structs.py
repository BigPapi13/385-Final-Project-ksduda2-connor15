#> structs.py
#   Implements net-cluster data structures used by this project

from svmath import *

#> OBB
#   - Oriented bounding box
#   - Used for the physics objects

OBB = Struct("OBB", [
    Fixed(8, 0, "width", signed=True),
    Fixed(8, 0, "height", signed=True),
    Fixed(16, 0, "inertia", signed=True),
    Fixed(3, 14, "inv_mass", signed=True),
    Fixed(2, 23, "inv_inertia", signed=True),
    Vec2(8, 16, "pos"),
    Vec2(5, 19, "vel"),
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
#   - Components are the normal vector, contact point location, and penetration depth
Contact = Struct("Contact", [
    Vec2(2, 14, "normal"),
    Vec2(8, 14, "location"),
    Fixed(8, 16, "penetration"),
])

#> Impulse
#   - Data required to resolve a contact
#   - Contains the change in velocity, the change in position, and the change in angular velocity
Impulse = Struct("Impulse", [
    Vec2(5, 19, "impulse"),
    Vec2(6, 16, "nudge"),
    Fixed(4, 7, "rotational_impulse")
])