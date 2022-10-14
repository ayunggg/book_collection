// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:book_collection/pages/edit_page.dart';
import 'package:book_collection/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/book_model.dart';

class CardBook extends StatelessWidget {
  final Book book;
  CardBook({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference books = firebaseFirestore.collection('books');
    return Container(
      height: 120,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                style: kMedium.copyWith(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                book.description,
                style: kMedium.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPage(),
                    ),
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/edit_icon.png',
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  books.doc(book.id).delete();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/icon_delete.png',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
