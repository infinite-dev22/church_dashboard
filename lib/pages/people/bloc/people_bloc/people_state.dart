part of 'people_bloc.dart';

enum PeopleStatus { initial, success, error, loading, selected, noData }

extension PeopleStatusX on PeopleStatus {
  bool get isInitial => this == PeopleStatus.initial;

  bool get isSuccess => this == PeopleStatus.success;

  bool get isError => this == PeopleStatus.error;

  bool get isLoading => this == PeopleStatus.loading;

  bool get isSelected => this == PeopleStatus.selected;
}

@immutable
class PeopleState extends Equatable {
  final List<PersonModel>? people;
  final PersonModel? person;
  final PeopleStatus status;
  final int? idSelected;

  const PeopleState({
    List<PersonModel>? people,
    this.person,
    this.status = PeopleStatus.initial,
    this.idSelected = 0,
  }) : people = people ?? const [];

  @override
  List<Object?> get props => [people,person, status, idSelected];

  PeopleState copyWith({
    List<PersonModel>? people,
    PersonModel? person,
    PeopleStatus? status,
    int? idSelected,
  }) {
    return PeopleState(
      people: people ?? this.people,
      person: person ?? this.person,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}
