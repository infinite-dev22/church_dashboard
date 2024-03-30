import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:church_dashboard/data_source/models/person_model.dart';
import 'package:church_dashboard/data_source/repositories/person_repo.dart';

part 'people_event.dart';
part 'people_state.dart';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {
  PeopleBloc() : super(const PeopleState()) {
    on<GetPeople>(_mapGetPeopleEventToState);
    on<DeletePeople>(_mapDeletePeopleEventToState);
    on<SelectPeople>(_mapSelectPeopleEventToState);
  }

  _mapGetPeopleEventToState(
      GetPeople event, Emitter<PeopleState> emit) async {
    emit(state.copyWith(status: PeopleStatus.loading));
    await PersonRepo.fetchAll().then((people) {
      emit(state.copyWith(status: PeopleStatus.success, people: people));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: PeopleStatus.error));
    });
  }

  _mapDeletePeopleEventToState(
      DeletePeople event, Emitter<PeopleState> emit) {
    emit(state.copyWith(status: PeopleStatus.loading));
    try {
      emit(state.copyWith(status: PeopleStatus.success));
    } catch (e) {
      emit(state.copyWith(status: PeopleStatus.error));
    }
  }

  _mapSelectPeopleEventToState(
      SelectPeople event, Emitter<PeopleState> emit) {
    emit(state.copyWith(status: PeopleStatus.loading));
    try {
      emit(state.copyWith(status: PeopleStatus.success, person: event.person));
    } catch (e) {
      emit(state.copyWith(status: PeopleStatus.error));
    }
  }

  @override
  void onChange(Change<PeopleState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(PeopleEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<PeopleEvent, PeopleState> transition) {
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
