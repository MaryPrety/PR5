// lib/providers/favorite_provider.dart
import 'package:flutter/material.dart';
import '../models/manga_item.dart';

class FavoriteProvider with ChangeNotifier {
  List<MangaItem> _favoriteItems = [];

  List<MangaItem> get favoriteItems => _favoriteItems;

  void addToFavorites(MangaItem item) {
    _favoriteItems.add(item);
    notifyListeners();
  }

  void removeFromFavorites(MangaItem item) {
    _favoriteItems.remove(item);
    notifyListeners();
  }
}