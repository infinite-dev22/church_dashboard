import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:church_dashboard/data_source/models/person_model.dart';
import 'package:church_dashboard/data_source/repositories/person_repo.dart';

part 'person_add_form_event.dart';
part 'person_add_form_state.dart';

class PersonFormBloc extends Bloc<PersonFormEvent, PersonFormState> {
  PersonFormBloc() : super(const PersonFormState()) {
    on<GetFormPerson>(_mapGetClientEventToState);
    on<PostPerson>(_mapPostClientAddFormEventToState);
    on<PutPerson>(_mapPutClientAddFormEventToState);
  }

  _mapGetClientEventToState(GetFormPerson event, Emitter<PersonFormState> emit) async {
    emit(state.copyWith(status: PersonFormStatus.loading));
    await PersonRepo.fetch(event.personId).then((person) {
      emit(state.copyWith(status: PersonFormStatus.success, person: person));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: PersonFormStatus.error));
    });
  }

  _mapPostClientAddFormEventToState(
      PostPerson event, Emitter<PersonFormState> emit) async {
    emit(state.copyWith(status: PersonFormStatus.loading));
    await PersonRepo.post(event.person).whenComplete(() {
      emit(state.copyWith(status: PersonFormStatus.posted));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: PersonFormStatus.error));
    });
  }

  _mapPutClientAddFormEventToState(
      PutPerson event, Emitter<PersonFormState> emit) async {
    emit(state.copyWith(status: PersonFormStatus.loading));
    await PersonRepo.put(event.person, event.idSelected).then((person) {
      emit(state.copyWith(status: PersonFormStatus.success, person: person));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: PersonFormStatus.error));
    });
  }

  @override
  void onChange(Change<PersonFormState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(PersonFormEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(
      Transition<PersonFormEvent, PersonFormState> transition) {
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
