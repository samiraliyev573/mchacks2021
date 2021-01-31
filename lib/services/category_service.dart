import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryService {
  getLatestCategoryTopics(String categoryName) {
    return FirebaseFirestore.instance
        .collection('topics')
        .where('category', isEqualTo: categoryName)
        .get();
  }
}
