import 'package:bloc/bloc.dart';
import 'package:church_dashboard/data_source/models/count_model.dart';
import 'package:church_dashboard/data_source/repositories/person_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState()) {
    on<GetCountAll>(_mapGetCountAllEventToState);
    on<GetCountAllByDateJoined>(_mapGetCountAllByDateJoinedEventToState);
    on<GetCountAllInactive>(_mapGetCountAllInactiveEventToState);
    on<GetCountAllNew>(_mapGetCountAllNewEventToState);
  }

  _mapGetCountAllEventToState(
      GetCountAll event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(status: DashboardStatus.loading));
    await PersonRepo.countAll().then((count) {
      emit(state.copyWith(status: DashboardStatus.success, count: count));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: DashboardStatus.error));
    });
  }

  _mapGetCountAllByDateJoinedEventToState(
      GetCountAllByDateJoined event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(status: DashboardStatus.loading));
    await PersonRepo.countAllByDateJoined().then((groupedCount) {
      emit(state.copyWith(
          status: DashboardStatus.success, groupedCount: groupedCount));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: DashboardStatus.error));
    });
  }

  _mapGetCountAllInactiveEventToState(
      GetCountAllInactive event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(status: DashboardStatus.loading));
    await PersonRepo.countAll().then((inactiveCount) {
      emit(state.copyWith(
          status: DashboardStatus.success, inactiveCount: inactiveCount));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: DashboardStatus.error));
    });
  }

  _mapGetCountAllNewEventToState(
      GetCountAllNew event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(status: DashboardStatus.loading));
    await PersonRepo.countAll().then((newCount) {
      emit(state.copyWith(status: DashboardStatus.success, newCount: newCount));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: DashboardStatus.error));
    });
  }

  @override
  void onChange(Change<DashboardState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(DashboardEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<DashboardEvent, DashboardState> transition) {
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
