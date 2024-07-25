import 'package:flutter/material.dart';
import 'package:practise/api/modeldata.dart';
import 'package:practise/service/firebase/push_notification.dart';

class NewsProvider extends ChangeNotifier {
  final Api api = Api();
  List<Articles> articles = [];
  final PushNotification _pushNotification = PushNotification();
  bool isButtonPressed = false;
  bool isLoading = false;

  NewsProvider() {
    _pushNotification.getFcmToken();
    _pushNotification.initialize();
    fetchArticle();
  }

  Future<void> fetchArticle() async {
  isLoading = true;
  notifyListeners();

  try {
    final fetchedArticles = await api.fetchNews();
    if (fetchedArticles != null) {
      articles = fetchedArticles;
      print('Fetched articles: ${articles.map((a) => a.title).toList()}');
    } else {
      articles = [];
    }
  } catch (e) {
    print('Error fetching articles: $e');
  } finally {
    isLoading = false;
    notifyListeners();
  }
}


  void isBooMarked() {
    isButtonPressed = !isButtonPressed;
    notifyListeners();
  }




}
