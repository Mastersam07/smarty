import '../../../../utils/enums.dart';

class Device {
  String? name;
  DeviceType type;
  bool active;
  String room;

  Device(
      {this.name,
      required this.type,
      required this.active,
      required this.room});
}

List<Device> devices = [
  Device(
    name: 'AC',
    type: DeviceType.ac,
    active: true,
    room: 'Living Room',
  ),
  Device(
    name: 'Smart TV',
    type: DeviceType.smartTv,
    active: true,
    room: 'Living Room',
  ),
  Device(
    name: 'CCTV',
    type: DeviceType.cctv,
    active: true,
    room: 'Living Room',
  ),
  Device(
    name: 'Refridgerator',
    type: DeviceType.refridgerator,
    active: true,
    room: 'Living Room',
  ),
  Device(
    name: 'Microwave',
    type: DeviceType.microwave,
    active: true,
    room: 'Living Room',
  ),
  Device(
    name: 'Light',
    type: DeviceType.light,
    active: true,
    room: 'Living Room',
  ),
];
