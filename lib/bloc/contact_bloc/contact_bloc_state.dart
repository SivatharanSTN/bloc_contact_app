import 'package:flutter/cupertino.dart';

import '../../contact_model.dart';

@immutable
abstract class ContactState {
  const ContactState();
}

class ContactInitial extends ContactState {
  const ContactInitial();
}

class ContactLoading extends ContactState {
  const ContactLoading();
}

class ContactLoaded extends ContactState {
  final ContactListModel contactListModel;
  const ContactLoaded(this.contactListModel);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContactLoaded && other.contactListModel == contactListModel;
  }

  List<Object> get props => [ContactListModel];
  @override
  int get hashCode => contactListModel.hashCode;
}

class ContactError extends ContactState {
  final ContactListModel contactListModel;
  const ContactError(this.contactListModel);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContactLoaded && other.contactListModel == contactListModel;
  }

  List<Object> get props => [contactListModel];
  @override
  int get hashCode => contactListModel.hashCode;
}
