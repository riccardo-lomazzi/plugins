// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:file_selector_platform_interface/file_selector_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:image_picker_windows/image_picker_windows.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'image_picker_windows_test.mocks.dart';

@GenerateMocks(<Type>[FileSelectorPlatform])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Returns the captured type groups from a mock call result, assuming that
  // exactly one call was made and only the type groups were captured.
  List<XTypeGroup> capturedTypeGroups(VerificationResult result) {
    return result.captured.single as List<XTypeGroup>;
  }

  group('$ImagePickerWindows()', () {
    final ImagePickerWindows plugin = ImagePickerWindows();
    late MockFileSelectorPlatform mockFileSelectorPlatform;

    setUp(() {
      mockFileSelectorPlatform = MockFileSelectorPlatform();

      when(mockFileSelectorPlatform.openFile(
              acceptedTypeGroups: anyNamed('acceptedTypeGroups')))
          .thenAnswer((_) async => null);

      when(mockFileSelectorPlatform.openFiles(
              acceptedTypeGroups: anyNamed('acceptedTypeGroups')))
          .thenAnswer((_) async => List<XFile>.empty());

      ImagePickerWindows.fileSelector = mockFileSelectorPlatform;
    });

    test('registered instance', () {
      ImagePickerWindows.registerWith();
      expect(ImagePickerPlatform.instance, isA<ImagePickerWindows>());
    });

    group('images', () {
      test('pickImage passes the accepted type groups correctly', () async {
        await plugin.pickImage(source: ImageSource.gallery);

        final VerificationResult result = verify(
            mockFileSelectorPlatform.openFile(
                acceptedTypeGroups: captureAnyNamed('acceptedTypeGroups')));
        expect(capturedTypeGroups(result)[0].extensions,
            ImagePickerWindows.imageFormats);
      });

      test('pickImage throws UnimplementedError when source is camera',
          () async {
        expect(() async => plugin.pickImage(source: ImageSource.camera),
            throwsA(isA<UnimplementedError>()));
      });

      test('getImage passes the accepted type groups correctly', () async {
        await plugin.getImage(source: ImageSource.gallery);

        final VerificationResult result = verify(
            mockFileSelectorPlatform.openFile(
                acceptedTypeGroups: captureAnyNamed('acceptedTypeGroups')));
        expect(capturedTypeGroups(result)[0].extensions,
            ImagePickerWindows.imageFormats);
      });

      test('getImage throws UnimplementedError when source is camera',
          () async {
        expect(() async => plugin.getImage(source: ImageSource.camera),
            throwsA(isA<UnimplementedError>()));
      });

      test('getMultiImage passes the accepted type groups correctly', () async {
        await plugin.getMultiImage();

        final VerificationResult result = verify(
            mockFileSelectorPlatform.openFiles(
                acceptedTypeGroups: captureAnyNamed('acceptedTypeGroups')));
        expect(capturedTypeGroups(result)[0].extensions,
            ImagePickerWindows.imageFormats);
      });
    });
    group('videos', () {
      test('pickVideo passes the accepted type groups correctly', () async {
        await plugin.pickVideo(source: ImageSource.gallery);

        final VerificationResult result = verify(
            mockFileSelectorPlatform.openFile(
                acceptedTypeGroups: captureAnyNamed('acceptedTypeGroups')));
        expect(capturedTypeGroups(result)[0].extensions,
            ImagePickerWindows.videoFormats);
      });

      test('pickVideo throws UnimplementedError when source is camera',
          () async {
        expect(() async => plugin.pickVideo(source: ImageSource.camera),
            throwsA(isA<UnimplementedError>()));
      });

      test('getVideo passes the accepted type groups correctly', () async {
        await plugin.getVideo(source: ImageSource.gallery);

        final VerificationResult result = verify(
            mockFileSelectorPlatform.openFile(
                acceptedTypeGroups: captureAnyNamed('acceptedTypeGroups')));
        expect(capturedTypeGroups(result)[0].extensions,
            ImagePickerWindows.videoFormats);
      });

      test('getVideo throws UnimplementedError when source is camera',
          () async {
        expect(() async => plugin.getVideo(source: ImageSource.camera),
            throwsA(isA<UnimplementedError>()));
      });
    });
  });
}
