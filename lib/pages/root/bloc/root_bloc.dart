import 'package:bloc/bloc.dart';
import 'package:church_dashboard/pages/root/widgets/screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'root_event.dart';
part 'root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  RootBloc() : super(const RootState()) {
    on<SwitchScreenEvent>(_mapSwitchScreenEventToState);
  }

  _mapSwitchScreenEventToState(
      SwitchScreenEvent event, Emitter<RootState> emit) {
    emit(state.copyWith(status: RootStatus.changing));
    emit(
      state.copyWith(
        status: RootStatus.changed,
        idSelected: event.selectedIndex,
      ),
    );
  }

  @override
  void onChange(Change<RootState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(RootEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<RootEvent, RootState> transition) {
    super.onTransition(transition);
    if (kDebugMode) {
      print("Transition: $transition");
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    if (kDebugMode) {
      print("Error: $error");
      print("StackTrace: $stackTrace");
    }
  }
}
