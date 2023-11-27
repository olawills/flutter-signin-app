import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension RouteNavigator on BuildContext {
  Future<T?> pushNextPage<T extends Object?>(String child) async {
    return GoRouter.of(this).pushNamed(child);
  }

  void goToNamedNextPage(String name, {Object? extra}) {
    return GoRouter.of(this).goNamed(name, extra: extra);
  }
}
