import 'package:audio_fairy_tales/blocs/bloc_navigations/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc_navigations/navigation_event.dart';

class NavigateToPage {
  NavigateToPage._();
  static NavigateToPage? _instance;

  static NavigateToPage? get instance {
    _instance ??= NavigateToPage._();
    return _instance;
  }

  void navigate(
    BuildContext context, {
    required int index,
    required int currentIndex,
    required String route,
  }) {
    Navigator.pop(context);

    if (index != currentIndex) {
      context.read<NavigationBloc>().add(
            NavigateMenu(
              menuIndex: index,
              route: route,
            ),
          );
    }
  }
}
