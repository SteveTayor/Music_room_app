import 'package:flutter/foundation.dart';
import '../models/music_service.dart';
import '../repository/music_service_repository.dart';

class MusicServiceViewModel extends ChangeNotifier {
  final MusicServiceRepository _repository;

  MusicServiceViewModel(this._repository);

  List<MusicService> _services = [];
  bool _isLoading = false;
  String? _error;

  List<MusicService> get services => _services;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadServices() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _services = await _repository.getMusicServices();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
