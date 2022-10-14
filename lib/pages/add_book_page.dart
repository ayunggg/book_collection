// ignore_for_file: prefer_const_constructors

import 'package:book_collection/pages/main_page.dart';
import 'package:book_collection/theme.dart';
import 'package:book_collection/widget/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddBookPage extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController codeBook = TextEditingController();
  TextEditingController isbn = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController category = TextEditingController();
  AddBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference book = firebaseFirestore.collection('books');

    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 80),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 160,
              child: Column(
                children: [
                  TextField(
                    style: kRegular.copyWith(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(hintText: 'Masukkan Kode Buku'),
                    controller: codeBook,
                  ),
                  TextField(
                    style: kRegular.copyWith(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    controller: isbn,
                    decoration:
                        InputDecoration(hintText: 'Masukkan Nomor ISBN'),
                  ),
                  TextField(
                    style: kRegular.copyWith(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    controller: title,
                    decoration:
                        InputDecoration(hintText: 'Masukkan Judul Buku'),
                  ),
                  TextField(
                    style: kRegular.copyWith(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    controller: description,
                    decoration:
                        InputDecoration(hintText: 'Masukkan Deskripsi Singkat'),
                  ),
                  TextField(
                    style: kRegular.copyWith(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    controller: price,
                    decoration:
                        InputDecoration(hintText: 'Masukkan Harga Buku'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            InkWell(
                onTap: () {
                  book.add({
                    'code_book': codeBook.text,
                    'isbn': isbn.text,
                    'title': title.text,
                    'description': description.text,
                    'price': int.tryParse(price.text),
                  });

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                      (route) => false);
                },
                child: CustomButton(
                  height: 40,
                  width: 100,
                  title: 'Add Book',
                ))
          ],
        ),
      ),
    ));
  }
}
