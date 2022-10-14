// ignore_for_file: prefer_const_constructors

import 'package:book_collection/theme.dart';
import 'package:book_collection/widget/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/book_model.dart';
import '../pages/main_page.dart';

class CardDetailBook extends StatelessWidget {
  final Book book;
  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController codeBook = TextEditingController();
  TextEditingController isbn = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController category = TextEditingController();
  CardDetailBook({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference books = firebaseFirestore.collection('books');
    return Container(
      padding: const EdgeInsets.all(24),
      width: MediaQuery.of(context).size.width - 24,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  style: kRegular.copyWith(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  controller: codeBook,
                  decoration: InputDecoration(hintText: book.codeBook),
                ),
                const SizedBox(
                  height: 4,
                ),
                TextField(
                  style: kRegular.copyWith(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  controller: price,
                  decoration: InputDecoration(hintText: book.price.toString()),
                ),
                TextField(
                  style: kRegular.copyWith(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  controller: isbn,
                  decoration: InputDecoration(hintText: book.isbn),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          InkWell(
            onTap: () {
              books.doc(book.id).update({
                'code_book': codeBook.text,
                'price': int.tryParse(price.text),
                'isbn': isbn.text,
              });
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainPage()),
                  (route) => false);
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text(
                    'Berhasil Update Data Buku',
                  ),
                ),
              );
            },
            child: const CustomButton(
              height: 40,
              width: 100,
              title: 'Save',
            ),
          )
        ],
      ),
    );
  }
}
