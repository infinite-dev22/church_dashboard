part of 'people_bloc.dart';

@immutable
abstract class PeopleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetPeople extends PeopleEvent {}

class DeletePeople extends PeopleEvent {
  DeletePeople(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectPeople extends PeopleEvent {
  SelectPeople(this.person);

  final PersonModel person;

  @override
  List<Object?> get props => [person];
}

class Success extends PeopleEvent {}
