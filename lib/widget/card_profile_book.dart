// ignore_for_file: prefer_const_constructors

import 'package:book_collection/theme.dart';
import 'package:book_collection/widget/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/book_model.dart';
import '../pages/main_page.dart';

class CardProfileBook extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  final Book book;
  CardProfileBook({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference books = firebaseFirestore.collection('books');
    return Container(
      padding: EdgeInsets.all(24),
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
                  controller: title,
                  decoration: InputDecoration(hintText: book.title),
                ),
                SizedBox(
                  height: 4,
                ),
                TextField(
                  style: kRegular.copyWith(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  controller: description,
                  decoration: InputDecoration(hintText: book.description),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
          ),
          InkWell(
            onTap: () {
              books.doc(book.id).update({
                'title': title.text,
                'description': description.text,
              });
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                  (route) => false);
            },
            child: CustomButton(
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
