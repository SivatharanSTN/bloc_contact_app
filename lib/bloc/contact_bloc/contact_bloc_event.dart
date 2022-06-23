import 'package:flutter/cupertino.dart';

@immutable
abstract class ContactEvent {}

class FetchContact extends ContactEvent {
  FetchContact();
}

class RefreshHome extends ContactEvent {
  RefreshHome();
}
