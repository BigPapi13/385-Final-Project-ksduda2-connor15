# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\kobes\OneDrive\Desktop\School\Fall_2024\ECE385\Vivado\lab6_2\lab6_2_sdk\mb_usb_hdmi_top\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\kobes\OneDrive\Desktop\School\Fall_2024\ECE385\Vivado\lab6_2\lab6_2_sdk\mb_usb_hdmi_top\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {mb_usb_hdmi_top}\
-hw {C:\Users\kobes\OneDrive\Desktop\School\Fall_2024\ECE385\Vivado\lab6_2\mb_usb_hdmi_top.xsa}\
-out {C:/Users/kobes/OneDrive/Desktop/School/Fall_2024/ECE385/Vivado/lab6_2/lab6_2_sdk}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {mb_usb_hdmi_top}
platform generate -quick
platform generate
platform config -updatehw {C:/Users/kobes/OneDrive/Desktop/School/Fall_2024/ECE385/Vivado/lab6_2/mb_usb_hdmi_top.xsa}
platform generate -domains 
platform generate
platform generate
platform generate
platform generate
platform generate
