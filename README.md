# Myrmex2ROS 

## Install dependencies: 

It's recommended to clone and build these repos in their own repo that is used solely for dependencies and kept seperate from packages under development.

* forks of [urdf](https://github.com/ubi-agni/urdf) [urdfdom](https://github.com/ubi-agni/urdfdom) and [urdfdom headers](https://github.com/ubi-agni/urdfdom_headers) - adds parsing for sensor tag
* [tactile_filters](https://github.com/ubi-agni/tactile_filters)
* [tactile_toolbox](https://github.com/ubi-agni/tactile_toolbox) - messages and other tools 
* [agni_serial_protocol](https://github.com/ubi-agni/agni_serial_protocol) - sensor drivers
* [agni_robots](https://github.com/ubi-agni/agni_robots) - myrmex robot description files


## Sensor hardware configuration

Create `sudo vim /etc/udev/rules.d/99-myrmex.rules` and insert

```{bash}
SUBSYSTEM=="usb", ATTRS{idVendor}=="04d8", ATTRS{idProduct}=="000a", ATTRS{product}=="TactileModuleV2-B002", GROUP="dialout", SYMLINK+="myrmex02"
SUBSYSTEM=="usb", ATTRS{idVendor}=="04d8", ATTRS{idProduct}=="000a", ATTRS{product}=="TactileModuleV2-B003", GROUP="dialout", SYMLINK+="myrmex03"
SUBSYSTEM=="usb", ATTRS{idVendor}=="04d8", ATTRS{idProduct}=="000a", ATTRS{product}=="TactileModuleV2-B012", GROUP="dialout", SYMLINK+="myrmex12"
SUBSYSTEM=="usb", ATTRS{idVendor}=="04d8", ATTRS{idProduct}=="000a", ATTRS{product}=="TactileModuleV2-B013", GROUP="dialout", SYMLINK+="myrmex13"
```

OR (USB-port specific):

```{bash}
SUBSYSTEMS=="usb", KERNELS=="3-4:1.0", GROUP="dialout", SYMLINK+="myrmexR"
SUBSYSTEMS=="usb", KERNELS=="3-5:1.0", GROUP="dialout", SYMLINK+="myrmexL"
```

where `KERNELS` can be obtained through `udevadm info -a /dev/ttyACM0`.

Reload udev rules using `sudo udevadm control --reload-rules && udevadm trigger`
