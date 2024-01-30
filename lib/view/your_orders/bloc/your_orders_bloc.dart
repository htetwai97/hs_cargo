import 'package:flutter/foundation.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/data_layer/model/hs_cargo_repo.dart';
import 'package:hs_cargo_customer_app/data_layer/model/hs_cargo_repo_impl.dart';
import 'package:hs_cargo_customer_app/data_layer/vos/tracking_data_vo.dart';
import 'package:hs_cargo_customer_app/persistence/share_preference/share_preference_constants.dart';

class YourOrdersBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final HSCargoRepo _cargoRepo = HSCargoRepoImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  List<TrackingDataVO>? parcelList = [];
  YourOrdersBloc() {
    _showLoading();
    _cargoRepo.getStringList(PHONES).then((phoneNoList) async {
      if (phoneNoList.length != 0) {
        for (String phNo in phoneNoList) {
          await _cargoRepo.postTrackPackage(null, phNo).then((value) {
            Iterable<TrackingDataVO> list = value.data ?? [];
            for (var obj in list) {
              if (!parcelList!.contains(obj)) {
                parcelList!.add(obj);
                if (parcelList!.length > 1 && parcelList != null) {
                  parcelList!.sort((a, b) {
                    var aa = b.id ?? 0;
                    var bb = a.id ?? 1;
                    return aa.compareTo(bb);
                  });
                  _notifySafely();
                }
              }
            }
          }).onError((error, stackTrace) {
            _hideLoading();
            Functions.toast(msg: "Dio error", status: false);
            debugPrint("Error==> $error\nStacktrace==> $stackTrace");
          });
        }
        Functions.toast(msg: parcelList?.length.toString(), status: true);
        _hideLoading();
      } else {
        Functions.toast(msg: "Ph no List empty", status: false);
        _hideLoading();
      }
    }).onError((error, stackTrace) {
      Functions.toast(msg: "Cache error", status: false);
      debugPrint("Error==> $error\nStacktrace==> $stackTrace");
    });
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
