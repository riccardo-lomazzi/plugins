import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'camera_avfoundation_platform_interface.dart';

/// An implementation of [CameraAvfoundationPlatform] that uses method channels.
class MethodChannelCameraAvfoundation extends CameraAvfoundationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('camera_avfoundation');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
