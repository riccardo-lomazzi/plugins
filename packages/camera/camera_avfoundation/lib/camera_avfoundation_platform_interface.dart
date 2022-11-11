import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'camera_avfoundation_method_channel.dart';

abstract class CameraAvfoundationPlatform extends PlatformInterface {
  /// Constructs a CameraAvfoundationPlatform.
  CameraAvfoundationPlatform() : super(token: _token);

  static final Object _token = Object();

  static CameraAvfoundationPlatform _instance = MethodChannelCameraAvfoundation();

  /// The default instance of [CameraAvfoundationPlatform] to use.
  ///
  /// Defaults to [MethodChannelCameraAvfoundation].
  static CameraAvfoundationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraAvfoundationPlatform] when
  /// they register themselves.
  static set instance(CameraAvfoundationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
