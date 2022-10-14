// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:book_collection/widget/card_profile_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/book_cubit.dart';
import '../model/book_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<BookCubit>().fetchBook();
    super.initState();
  }

  Widget buildContent(List<Book> book) {
    return Column(
      children: book.map((e) {
        return CardProfileBook(book: e);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [buildContent(state.book)],
              ),
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
