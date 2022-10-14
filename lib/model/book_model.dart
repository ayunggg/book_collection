import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String id;
  final String codeBook;
  final String isbn;
  final String title;
  final String description;
  final int price;

  const Book({
    required this.id,
    required this.codeBook,
    required this.isbn,
    required this.title,
    required this.description,
    required this.price,
  });

  factory Book.fromJson(String id, Map<String, dynamic> json) => Book(
        id: id,
        codeBook: json['code_book'],
        isbn: json['isbn'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        codeBook,
        isbn,
        title,
        description,
        price,
      ];
}
