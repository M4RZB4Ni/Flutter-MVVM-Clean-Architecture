import 'dart:async';
import 'package:communere/app/base/result_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class BaseController extends GetxController with WidgetsBindingObserver {
  late StreamSubscription<InternetConnectionStatus> _connectionListener;

  final _pageStateController = const ResultState.idle().obs;

  ResultState get pageState => _pageStateController.value;

  ResultState updatePageState(final ResultState state) =>
      _pageStateController(state);

  ResultState showLoading() => updatePageState(const ResultState.loading());

  ResultState resetPageState() => updatePageState(const ResultState.idle());

  ResultState hideLoading() => resetPageState();

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);

    _connectionListener =
        InternetConnectionChecker().onStatusChange.listen((final status) {
          //realDebugPrint('status of override-->$status');
          switch (status) {
            case InternetConnectionStatus.connected:
              updatePageState(const ResultState.idle());
              break;
            case InternetConnectionStatus.disconnected:
              updatePageState(const ResultState.lostConnection());
              break;
          }
        });
    super.onInit();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    _connectionListener.cancel();
    super.dispose();
  }
}
