part of 'person_add_form_bloc.dart';

@immutable
abstract class PersonFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetFormPerson extends PersonFormEvent {
  GetFormPerson(this.personId);

  final int personId;

  @override
  List<Object?> get props => [personId];
}

class PutPerson extends PersonFormEvent {
  PutPerson(this.person, this.idSelected);

  final int idSelected;
  final PersonModel person;

  @override
  List<Object?> get props => [
        person,
        idSelected,
      ];
}

class PostPerson extends PersonFormEvent {
  PostPerson(this.person);

  final PersonModel person;

  @override
  List<Object?> get props => [person];
}

class Success extends PersonFormEvent {}

class SetIndividual extends PersonFormEvent {}

class SetCompany extends PersonFormEvent {}
