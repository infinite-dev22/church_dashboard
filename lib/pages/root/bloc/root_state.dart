part of 'root_bloc.dart';

enum RootStatus {
  initial,
  changing,
  changed,
}

extension RootStatusX on RootStatus {
  bool get isInitial => this == RootStatus.initial;

  bool get isChanging => this == RootStatus.changing;

  bool get isChanged => this == RootStatus.changed;
}

@immutable
class RootState extends Equatable {
  final List<Screen>? screens;
  final RootStatus status;
  final int idSelected;

  const RootState({
    this.screens,
    this.status = RootStatus.changed,
    this.idSelected = 0,
  });

  @override
  List<Object?> get props =>
      [screens, status, idSelected];

  RootState copyWith({
    List<Screen>? screens,
    RootStatus? status,
    int? idSelected,
  }) {
    return RootState(
      screens: screens ?? this.screens,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}
