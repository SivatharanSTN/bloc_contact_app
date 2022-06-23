import 'package:contactapp/bloc/contact_bloc/contact_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Providers {
  Providers._();

  static final providers = [
    BlocProvider<ContactBloc>(
      create: (context) => ContactBloc(),
    ),
  ];
}
