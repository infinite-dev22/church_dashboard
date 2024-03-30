part of 'root_bloc.dart';

abstract class RootEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const RootEvent();
}

class SwitchScreenEvent extends RootEvent {
  final int selectedIndex;

  @override
  List<Object?> get props => [
    selectedIndex,
  ];

  const SwitchScreenEvent(this.selectedIndex);
}
