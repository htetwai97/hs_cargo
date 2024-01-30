import 'package:flutter/foundation.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/data_layer/model/hs_cargo_repo.dart';
import 'package:hs_cargo_customer_app/data_layer/model/hs_cargo_repo_impl.dart';
import 'package:hs_cargo_customer_app/network/response/get_way_plans_response.dart';

class WayListBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final HSCargoRepo _cargoRepo = HSCargoRepoImpl();

  /// Api call States
  bool isLoading = false;
  // bool isInUseLoading = false;
  bool isSuccess = false;
  bool isInUseSuccess = false;

  /// Screen states
  List<WayPlanData>? wayList;

  WayListBloc() {
    _loading();
    _cargoRepo.getWayPlansList().then((response) {
      wayList = response.data;
      _notifySafely();
      _success();
    }).onError((error, stackTrace) {
      Functions.toast(msg: "Fail to get way list", status: false);
      _fail();
    });
  }

  /// Api call situations
  void _loading() {
    isLoading = true;
    isSuccess = false;
    _notifySafely();
  }

  void _success() {
    isLoading = false;
    isSuccess = true;
    _notifySafely();
  }

  void _fail() {
    isLoading = false;
    isSuccess = false;
    _notifySafely();
  }

  // void _inUseLoading() {
  //   isInUseLoading = true;
  //   isInUseSuccess = false;
  //   _notifySafely();
  // }
  //
  // void _inUseSuccess() {
  //   isInUseLoading = false;
  //   isInUseSuccess = true;
  //   _notifySafely();
  // }
  //
  // void _inUseFailed() {
  //   isInUseLoading = false;
  //   isInUseSuccess = false;
  //   _notifySafely();
  // }

  void _notifySafely() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }
}
