import 'package:flutter/material.dart';
import 'package:s_rocks_music/Model/model.dart';
import 'package:s_rocks_music/Repository/repo.dart';

class Viewmodel extends ChangeNotifier {
  final Repo _repo = Repo();

  List<Model> _services = [];
  List<Model> get services => _services;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Viewmodel() {
    fetchServices();
  }

  Future<void> fetchServices() async {
    _isLoading = true;
    notifyListeners();

    _services = await _repo.fetchServices();

    _isLoading = false;
    notifyListeners();
  }
}
