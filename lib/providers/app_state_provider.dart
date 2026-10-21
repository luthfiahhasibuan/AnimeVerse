import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/cupertino.dart';

import '../models/anime.dart';
import '../data/dummy_data.dart';

class AppStateProvider extends ChangeNotifier {
  //data
  List<Anime> _favorites = [];
  //kunci penyimpanan
  static const String _storageKey = 'favorite_anime_list';
  //constructiro: otomatis memuat favorit saat provider dibuat
  AppStateProvider() {
    _loadFavorites();
  }
  //getter
  List<Anime> get favorites => _favorites;

  //state baru: genre yang dipilih (default 'all')
  String _selectedGenre = "All";

  //getter baru
  String get selectedGenre => _selectedGenre;

  //method baru: mengubah genre yang dipilih
  void setSelectedGenre(String genre) {
    _selectedGenre = genre;
    notifyListeners(); //beri tahu HomeScreen & GenreList
  }

  //helper
  bool isFavorite(String id) {
    return _favorites.any((anime) => anime.id == id);
  }

  void toggleFavorite(Anime anime) {
    if (isFavorite(anime.id)) {
      removeFavorite(anime.id);
    } else {
      addFavorite(anime);
    }
  }

  void addFavorite(Anime anime) {
    if (!isFavorite(anime.id)) {
      _favorites.add(anime);
      _saveFavorites();
      notifyListeners();
    }
  }

  void removeFavorite(String id) {
    _favorites.removeWhere((anime) => anime.id == id);
    _saveFavorites();
    notifyListeners();
  }

  List<Anime> getFilteredAnimeForHome() {
    List<Anime> result = DummyData.animeList;

    if (_selectedGenre != "All") {
      result = result.where((anime) {
        final genres = anime.genre.split(',').map((g) => g.trim()).toList();
        return genres.contains(_selectedGenre);
      }).toList();
    }
    return result;
  }

  //simpan data favorit ke SharedPreferences
  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      //1. list <anime> : list<MAp<Sring, dynamic>>
      final List<Map<String, dynamic>> favoritesJson = _favorites
          .map((anime) => anime.toJson())
          .toList();

      //2. List<Map> -> String JSON, lalu simpan
      await prefs.setString(_storageKey, jsonEncode(favoritesJson));
    } catch (e) {
      debugPrint('Error saving favorites: $e');
    }
  }

  //muat daftar favorit dair share preferences
  Future<void> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      //1. baca string JSON
      final String? favoritesJson = prefs.getString(_storageKey);

      if (favoritesJson != null) {
        //2. String JSON -> List<dynamic>
        final List<dynamic> decoded = jsonDecode(favoritesJson);

        //3. List<dynamic> -> List<Anime>
        _favorites = decoded
            .map((item) => Anime.fromJson(item as Map<String, dynamic>))
            .toList();

        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error loading favorites: $e');
    }
  }
}
