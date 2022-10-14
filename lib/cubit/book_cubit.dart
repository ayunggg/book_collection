import 'package:bloc/bloc.dart';
import 'package:book_collection/service/book_service.dart';
import 'package:equatable/equatable.dart';

import '../model/book_model.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());

  void fetchBook() async {
    try {
      emit(BookLoading());

      List<Book> book = await BookService().fetchBook();

      emit(BookSuccess(book));
    } catch (e) {
      emit(BookFailed(e.toString()));
    }
  }
}
