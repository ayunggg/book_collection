// ignore_for_file: prefer_const_constructors

import 'package:book_collection/cubit/page_cubit.dart';
import 'package:book_collection/pages/detail_page.dart';
import 'package:book_collection/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/custom_button.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header(int index) {
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
                  index = 0;
                  context.read<PageCubit>().setPage(index);
                },
                child: CustomButton(
                  height: 40,
                  width: 100,
                  title: 'Profile',
                ),
              ),
            ),
            Container(
              child: InkWell(
                onTap: () {
                  index = 1;
                  context.read<PageCubit>().setPage(index);
                },
                child: CustomButton(
                  height: 40,
                  width: 100,
                  title: 'Detail',
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buildContent(int index) {
      switch (index) {
        case 0:
          return ProfilePage();
        case 1:
          return DetailPage();
        default:
          return ProfilePage();
      }
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
            body: SafeArea(
                child: Stack(
          children: [
            header(currentIndex),
            buildContent(currentIndex),
          ],
        )));
      },
    );
  }
}
