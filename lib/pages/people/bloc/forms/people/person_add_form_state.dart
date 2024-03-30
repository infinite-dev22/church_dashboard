part of 'person_add_form_bloc.dart';

enum PersonFormStatus {
  initial,
  success,
  error,
  loading,
  selected,
  noData,
  individual,
  company
}

extension PersonFormStatusX on PersonFormStatus {
  bool get isInitial => this == PersonFormStatus.initial;

  bool get isSuccess => this == PersonFormStatus.success;

  bool get isError => this == PersonFormStatus.error;

  bool get isLoading => this == PersonFormStatus.loading;

  bool get isSelected => this == PersonFormStatus.selected;

  bool get showIndividual => this == PersonFormStatus.initial;

  bool get showCompany => this == PersonFormStatus.company;
}

//
@immutable
class PersonFormState extends Equatable {
  final PersonModel? person;
  final PersonFormStatus status;
  final int? idSelected;

  const PersonFormState({
    this.person,
    this.status = PersonFormStatus.initial,
    this.idSelected,
  });

  @override
  List<Object?> get props => [person, status, idSelected];

  // Copy state.
  PersonFormState copyWith({
    PersonModel? person,
    PersonFormStatus? status,
    int? idSelected,
  }) {
    return PersonFormState(
      person: person ?? this.person,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}
