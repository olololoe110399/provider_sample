import 'package:flutter/material.dart';
import 'package:sample/models/movie.dart';
import 'package:sample/models/product.dart';
import 'package:dartx/dartx.dart';
import 'package:sample/models/user.dart';
import 'package:sample/repository/repository.dart';

class Store extends ChangeNotifier {
  final _repository = Repository();
  List<Product> _products = [];
  final List<Product> _favorites = [];
  final List<Movie> _movies = [];
  Product? _active;
  User? _user;

  Store() {
    _products = [
      Product(1, "Blue Tee", 2500.00, 0, "blue.png", "xdfasf"),
      Product(2, "Red Tee", 2500.00, 0, "red.png", 'dsfsdfdfdfd'),
      Product(3, "Green Tee", 2500.00, 0, "green.png", 'asdsdfsf'),
    ];
    notifyListeners();
  }

  List<Product> get products => _products;
  List<Product> get favorites => _favorites;
  List<Movie> get movies => _movies;
  Product? get activeProduct => _active;
  User? get getUser => _user;

  setActiveProduct(Product product) {
    _active = product;
  }

  clearCart() {
    for (Product p in _products) {
      p.quantity = 0;
    }
    _favorites.clear();
    notifyListeners();
  }

  addItemToFavorite(Product product) {
    Product? found = _favorites.firstOrNullWhere((p) => p.id == product.id);
    if (found != null) {
      found.quantity += 1;
    } else {
      _favorites.add(product);
      product.quantity += 1;
    }
    notifyListeners();
  }

  removeItemFromFavorite(Product product) {
    Product? found = _favorites.firstOrNullWhere((p) => p.id == product.id);
    if (found != null && found.quantity == 1) {
      product.quantity = 0;
      _favorites.remove(product);
    }
    if (found != null && found.quantity > 1) {
      found.quantity -= 1;
    }
    notifyListeners();
  }

  int getCartQuantity() {
    int total = 0;
    for (Product p in _favorites) {
      total += p.quantity;
    }
    return total;
  }

  double getCartTotal() {
    double price = 0;
    for (Product p in _favorites) {
      price += (p.price * p.quantity);
    }
    return price;
  }

  saveUser(User user) {
    _user = user;
  }

  Future<void> fetchMoviesPopular() async {
    _movies.clear();
    final newMovies = await _repository.fetchMoviesPopular();
    _movies.addAll(newMovies);
    notifyListeners();
  }

  Future<List<Movie>> fetchMoviesByCategoryFuture(Category category) {
    return _repository.fetchMoviesByCategory(category);
  }
}
