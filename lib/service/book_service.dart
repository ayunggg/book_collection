import 'package:book_collection/model/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('books');

  Future<List<Book>> fetchBook() async {
    try {
      QuerySnapshot result = await _collectionReference.get();

      List<Book> book = result.docs.map((e) {
        return Book.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return book;
    } catch (e) {
      rethrow;
    }
  }
}
