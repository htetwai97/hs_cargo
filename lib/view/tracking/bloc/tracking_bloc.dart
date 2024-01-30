import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/data_layer/model/hs_cargo_repo.dart';
import 'package:hs_cargo_customer_app/data_layer/model/hs_cargo_repo_impl.dart';
import 'package:hs_cargo_customer_app/data_layer/vos/tracking_data_vo.dart';

class TrackingBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final HSCargoRepo _cargoRepo = HSCargoRepoImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  List<TrackingDataVO>? parcelList = [];
  TextEditingController controller = TextEditingController();
  // String? token;
  // String? phoneNumber;

  TrackingBloc();

  Future onSearch() async {
    _showLoading();
    return await _searchByToken(controller.text).then((value) {
      _hideLoading();
    }).onError((error, stackTrace) async {
      await _searchByPhoneNo(controller.text).then((value) {
        _hideLoading();
      }).onError((error, stackTrace) {
        Functions.toast(msg: "Incorrect token or phone number");
      });
    });
  }

  Future _searchByToken(String token) async {
    await _cargoRepo.postTrackPackage(token, null).then((response) {
      parcelList = response.data;
      _notifySafely();
    }).onError((error, stackTrace) {
      Functions.toast(msg: "Dio Error token", status: false);
    });
    if (parcelList != null && parcelList?.length != 0) {
      return Future.value();
    } else {
      return Future.error("error");
    }
  }

  Future _searchByPhoneNo(String phoneNo) async {
    await _cargoRepo.postTrackPackage(null, phoneNo).then((response) {
      parcelList = response.data;
      _notifySafely();
    }).onError((error, stackTrace) {
      Functions.toast(msg: "Dio Error phone", status: false);
    });
    if (parcelList != null && parcelList?.length != 0) {
      return Future.value();
    } else {
      return Future.error("error");
    }
  }

  /// loading situations
  void _showLoading() {
    isLoading = true;
    _notifySafely();
  }

  void _hideLoading() {
    isLoading = false;
    _notifySafely();
  }

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
