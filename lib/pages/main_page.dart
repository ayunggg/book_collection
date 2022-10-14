// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:book_collection/cubit/book_cubit.dart';
import 'package:book_collection/pages/add_book_page.dart';
import 'package:book_collection/theme.dart';
import 'package:book_collection/widget/card_book.dart';
import 'package:book_collection/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/book_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    context.read<BookCubit>().fetchBook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.all(
          24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddBookPage()));
                  },
                  child: CustomButton(
                    height: 40,
                    width: 100,
                    title: 'Add',
                  )),
            ),
            Container(
              child: CustomButton(
                height: 40,
                width: 100,
                title: 'Delete All',
              ),
            ),
          ],
        ),
      );
    }

    Widget emptyTransaction() {
      return Container(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 14,
            ),
            Text(
              'Daftar Buku',
              style: kMedium.copyWith(
                fontSize: 14,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              height: 46,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Anda tidak memiliki Data Buku',
                    style: kMedium.copyWith(
                      fontSize: 14,
                      color: kGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget body(List<Book> book) {
      return Container(
        margin: EdgeInsets.all(24),
        child: Column(
          children: book.map((e) {
            return CardBook(
              book: e,
            );
          }).toList(),
        ),
      );
    }

    return BlocConsumer<BookCubit, BookState>(
      listener: (context, state) {
        if (state is BookFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is BookSuccess) {
          return Scaffold(
            body: ListView(
              children: [header(), body(state.book),],
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
