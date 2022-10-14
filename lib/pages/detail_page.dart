// ignore_for_file: prefer_const_constructors

import 'package:book_collection/cubit/book_cubit.dart';
import 'package:book_collection/widget/card_detail_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/book_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(List<Book> book) {
      return Column(
        children: book.map((e) {
          return CardDetailBook(book: e);
        }).toList(),
      );
    }

    return BlocConsumer<BookCubit, BookState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is BookFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is BookSuccess) {
          return SizedBox(
            child: Center(
              child: buildContent(state.book),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
