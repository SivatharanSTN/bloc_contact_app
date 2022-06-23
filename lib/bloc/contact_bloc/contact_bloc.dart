// ignore_for_file: prefer_const_constructors

import 'package:contactapp/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../contact_model.dart';
import 'contact_bloc_event.dart';
import 'contact_bloc_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(const ContactInitial()) {
    on<FetchContact>(_mapFetchContactToState);
  }
  late ContactListModel contactListModel;

  ContactState get initialState => const ContactInitial();

  // Stream<ContactState> mapEventToState(
  //   ContactEvent event,
  // ) async* {
  //   if (event is FetchContact) {
  //     if (state is ContactLoaded) {
  //       yield state;
  //     } else {
  //       // yield* _mapFetchContactToState(event);
  //     }
  //   } else if (event is RefreshHome) {
  //     yield* _mapRefreshContactToState(event);
  //   }
  // }

  void _mapFetchContactToState(
      FetchContact event, Emitter<ContactState> emit) async {
    if (state is ContactLoaded) {
      emit(ContactLoaded(contactListModel));
    } else {
      emit(ContactLoading());
      contactListModel = await Service.getData();
      try {
        if (contactListModel.errorModel.isError) {
          emit(ContactError(contactListModel));
        } else {
          emit(ContactLoaded(contactListModel));
        }
      } catch (e) {
        contactListModel.errorModel.isError = true;
        emit(ContactError(contactListModel));
      }
    }
  }

  Stream<ContactState> _mapRefreshContactToState(RefreshHome event) async* {
    yield ContactLoading();
    contactListModel = await Service.getData();
    try {
      yield !contactListModel.errorModel.isError
          ? ContactLoaded(contactListModel)
          : ContactError(contactListModel);
    } catch (e) {
      contactListModel.errorModel.isError = true;

      yield ContactError(contactListModel);
    }
  }
}
