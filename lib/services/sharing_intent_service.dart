import 'dart:async';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class SharingIntentService {
  final log = getLogger('SharingIntentService');
  final List<SharedMediaFile> _sharedFiles = [];
  final StreamController<List<SharedMediaFile>> _mediaStreamController =
      StreamController.broadcast();

  StreamSubscription? _intentSub;

  Stream<List<SharedMediaFile>> get sharedMediaStream =>
      _mediaStreamController.stream;

  Future<void> init() async {
    // Listen to stream while app is in memory
    _intentSub = ReceiveSharingIntent.instance.getMediaStream().listen((value) {
      _sharedFiles
        ..clear()
        ..addAll(value);
      log.d("Shared files: $_sharedFiles");
      _mediaStreamController.add(List.from(_sharedFiles));
    }, onError: (err) {
      log.e("getIntentDataStream error: $err");
    });

    // Handle media when app is closed
    final initialMedia = await ReceiveSharingIntent.instance.getInitialMedia();
    _sharedFiles
      ..clear()
      ..addAll(initialMedia);
    log.d("Initial shared files: $_sharedFiles");
    _mediaStreamController.add(List.from(_sharedFiles));
    ReceiveSharingIntent.instance.reset();
  }

  void dispose() {
    _intentSub?.cancel();
    _mediaStreamController.close();
  }
}
