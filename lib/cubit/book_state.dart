// ignore_for_file: must_be_immutable

part of 'book_cubit.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookSuccess extends BookState {
  List<Book> book;

  BookSuccess(this.book);

  @override
  // TODO: implement props
  List<Object> get props => [book];
}

class BookFailed extends BookState {
  String error;

  BookFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
