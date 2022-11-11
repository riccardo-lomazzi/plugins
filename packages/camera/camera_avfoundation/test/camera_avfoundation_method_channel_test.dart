import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:camera_avfoundation/camera_avfoundation_method_channel.dart';

void main() {
  MethodChannelCameraAvfoundation platform = MethodChannelCameraAvfoundation();
  const MethodChannel channel = MethodChannel('camera_avfoundation');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
