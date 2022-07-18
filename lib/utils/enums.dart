import '../core/navigation/navigator.dart';

enum DeviceType { ac, smartTv, cctv, refridgerator, microwave, light }

extension DeviceTypeExtension on DeviceType {
  String get name {
    switch (this) {
      case DeviceType.ac:
        return 'AC';
      case DeviceType.smartTv:
        return 'Smart TV';
      case DeviceType.cctv:
        return 'CCTV';
      case DeviceType.refridgerator:
        return 'Refridgerator';
      case DeviceType.microwave:
        return 'Microwave';
      case DeviceType.light:
        return 'Light';
      default:
        return 'Unknown';
    }
  }

  String? get icon {
    switch (this) {
      case DeviceType.ac:
        return 'assets/icons/ac.png';
      case DeviceType.smartTv:
        return 'assets/icons/tv.png';
      case DeviceType.cctv:
        return 'assets/icons/cctv.png';
      case DeviceType.refridgerator:
        return 'assets/icons/fridge.png';
      case DeviceType.microwave:
        return 'assets/icons/oven.png';
      case DeviceType.light:
        return 'assets/icons/light.png';
      default:
        return null;
    }
  }

  String get routeName {
    switch (this) {
      case DeviceType.ac:
        return acRoute;
      case DeviceType.smartTv:
        return smartTvRoute;
      case DeviceType.cctv:
        return cctvRoute;
      case DeviceType.refridgerator:
        return refridgeratorRoute;
      case DeviceType.microwave:
        return microwaveRoute;
      case DeviceType.light:
        return lightRoute;
      default:
        return '/unknown';
    }
  }
}
