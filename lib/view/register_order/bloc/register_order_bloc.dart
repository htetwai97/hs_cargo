import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/data_layer/model/hs_cargo_repo.dart';
import 'package:hs_cargo_customer_app/data_layer/model/hs_cargo_repo_impl.dart';
import 'package:hs_cargo_customer_app/data_layer/vos/location_vo.dart';
import 'package:hs_cargo_customer_app/data_layer/vos/order_register_vo.dart';
import 'package:hs_cargo_customer_app/data_layer/vos/price_by_kg_vo.dart';
import 'package:hs_cargo_customer_app/data_layer/vos/township_and_charges_vo.dart';
import 'package:hs_cargo_customer_app/persistence/share_preference/share_preference_constants.dart';

class RegisterOrderBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final HSCargoRepo _cargoRepo = HSCargoRepoImpl();

  /// Api call States
  bool isLoading = false;
  bool isInUseLoading = false;
  bool isSuccess = false;
  bool isInUseSuccess = false;

  /// Screen states
  List<LocationVO>? locationVO;
  List<String> locationList = [];
  List<PriceByKgVO>? priceByKGVOList;
  bool isSubmitUnlock = false;
  String receivePoint = "";
  int receivePointID = 0;
  int dropOffPointID = 0;
  String receiveDate = "";
  String pickUpDate = "";
  String dropOffPoint = "";
  String weightType = "";
  int packageID = 0;
  int perKgCharge = 0;
  int charge = 0;
  String pickUpValue = "No";
  List<TownshipAndChargesVO>? townshipVOList = [];
  List<String> townshipList = [];
  PriceByKgVO? priceByKgVO;
  bool isPickupSectionAvailable = false;

  int pickupFlag = 0;
  int? townshipChargesId;
  TownshipAndChargesVO? townshipVo;
  int total = 0;

  /// text controllers
  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerPhoneController = TextEditingController();
  TextEditingController customerAddressController = TextEditingController();
  TextEditingController tokenController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController chargesController = TextEditingController();
  TextEditingController townshipChargeController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController pickupAddressController = TextEditingController();
  TextEditingController pickupTimeController = TextEditingController();
  TextEditingController totalChargeController = TextEditingController();

  /// form keys
  final customerNameFormKey = GlobalKey<FormState>();
  final customerPhoneFormKey = GlobalKey<FormState>();
  final customerAddressFormKey = GlobalKey<FormState>();
  final remarkFormKey = GlobalKey<FormState>();
  final quantityFormKey = GlobalKey<FormState>();
  final weightFormKey = GlobalKey<FormState>();
  final contactNoFormKey = GlobalKey<FormState>();
  final pickupAddressFormKey = GlobalKey<FormState>();
  final pickupTimeFormKey = GlobalKey<FormState>();

  /// validates
  bool _customerNameV = false;
  bool _customerPhoneV = false;
  bool _customerAddressV = false;
  bool _remarkV = false;
  bool _quantityV = false;
  bool _weightV = false;
  bool _contactNoV = false;
  bool _pickupAddressV = false;
  bool _pickupTimeV = false;

  RegisterOrderBloc() {
    _loading();
    _cargoRepo.getLocations().then((response) {
      locationVO = response.data;
      if (locationVO != null && locationVO?.length != 0) {
        for (int i = 0; i < locationVO!.length; i++) {
          locationVO![i].id = i + 1;
          _notifySafely();
        }
      }
      locationList = response.data?.map((e) => e.name ?? "").toList() ?? [];
      _notifySafely();
      _cargoRepo.getPriceByKg().then((value) {
        priceByKGVOList = value.data;
        _notifySafely();
        _cargoRepo.getTownshipCharges().then((value) {
          townshipVOList = value.data;
          townshipList = townshipVOList
                  ?.map((element) => element.townshipName ?? "")
                  .toList() ??
              [];
          _success();
        }).onError((error, stackTrace) {
          debugPrint(
              "Error ==> ${error.toString()}\nStackTrace ==> ${stackTrace.toString()}");
          _fail();
          Functions.toast(
              msg: "Township and prices are unavailable", status: false);
        });
      }).onError((error, stackTrace) {
        debugPrint(
            "Error ==> ${error.toString()}\nStackTrace ==> ${stackTrace.toString()}");
        _fail();
        Functions.toast(msg: "Prices are unavailable", status: false);
      });
    }).onError((error, stackTrace) {
      debugPrint(
          "Error ==> ${error.toString()}\nStackTrace ==> ${stackTrace.toString()}");
      _fail();
      Functions.toast(msg: "Location points are unavailable", status: false);
    });
  }

  Future onTapSubmit() async {
    if (isSubmitUnlock && !isInUseLoading) {
      isInUseLoading = true;
      var order = OrderRegisterVO();
      order.customerName = customerNameController.text;
      order.customerPhone = customerPhoneController.text;
      order.customerAddress = customerAddressController.text;
      order.receivePoint = receivePointID;
      order.receiveDate = receiveDate;
      order.dropoffPoint = dropOffPointID;
      order.token = tokenController.text;
      order.trackingNo = tokenController.text;
      order.remark = remarkController.text;
      order.customerDate = null;
      order.myawadyDate = null;
      order.packageId = packageID;
      order.parcelQuantity = int.tryParse(quantityController.text);
      order.totalWeight = int.tryParse(weightController.text);
      order.perKgCharges = perKgCharge;
      order.totalCharges = charge;
      order.pickupFlag = pickupFlag;
      order.townshipChargesId = townshipChargesId;
      order.pickupAddress = pickupAddressController.text;
      order.pickupContact = contactNumberController.text;
      order.pickupPhone = contactNumberController.text;
      order.pickupCharges = townshipVo?.charges;
      order.totalCharges = total;
      order.pickupDate = pickUpDate;
      order.pickupTime = pickupTimeController.text;
      var order1 = order.toJson();
      debugPrint(order1.toString());
      _notifySafely();
      await _cargoRepo.postOrder(order).then((value) async {
        var initialList = await _cargoRepo.getStringList(PHONES);
        var list = initialList.toSet().toList();
        list.toSet().toList();
        list.add(customerPhoneController.text);
        await _cargoRepo.saveStringList(PHONES, list);
        isInUseLoading = false;
        isInUseSuccess = true;
        _notifySafely();
      }).onError((error, stackTrace) {
        debugPrint(error.toString());
        debugPrint(stackTrace.toString());
        isInUseLoading = false;
        isInUseSuccess = false;
        _notifySafely();
      });
      if (isInUseSuccess) {
        Functions.toast(msg: "Order successful", status: true);
        return Future.value();
      } else {
        Functions.toast(msg: "Order process failed", status: false);
        return Future.error("error");
      }
    } else {
      Functions.toast(msg: "Fields required", status: false);
      return Future.error("error");
    }
  }

  void _calculatePrice() {
    if (dropOffPoint != "" &&
        receivePoint != "" &&
        weightController.text != "" &&
        weightType != "" &&
        quantityController.text != "") {
      var qty = int.tryParse(quantityController.text);
      var weightInt = int.tryParse(weightController.text);
      var list = priceByKGVOList?.where((element) {
        if (weightInt != null &&
            element.maxKg != null &&
            element.minKg != null) {
          return element.fromCityName == receivePoint &&
              element.toCityName == dropOffPoint &&
              weightInt <= element.maxKg! &&
              weightInt >= element.minKg!;
        } else {
          return false;
        }
      }).toList();
      if (list != null && list.length != 0) {
        list.take(1);
        priceByKgVO = list.elementAt(0);
        if (qty != null &&
            priceByKgVO != null &&
            priceByKgVO!.perKgPrice != null) {
          perKgCharge = priceByKgVO!.perKgPrice!;
          charge = qty * priceByKgVO!.perKgPrice!;
          chargesController.text = "$charge ${priceByKgVO!.currency}";
          packageID = priceByKgVO!.packageID ?? 0;
          _validateFirstSection();
          _notifySafely();
        }
      }
    }
  }

  void onChooseReceivePoint(String location) {
    receivePoint = location;
    var list =
        locationVO?.where((element) => element.name == location).toList();
    if (list != null && list.length != 0) {
      list.take(1);
      var location = list.elementAt(0);
      receivePointID = location.id ?? 0;
      _notifySafely();
    }
    _notifySafely();
    _calculatePrice();
  }

  void onChooseDropOffPoint(String location) {
    dropOffPoint = location;
    var list =
        locationVO?.where((element) => element.name == location).toList();
    if (list != null && list.length != 0) {
      list.take(1);
      var location = list.elementAt(0);
      dropOffPointID = location.id ?? 0;
      _notifySafely();
    }
    _notifySafely();
    _calculatePrice();
  }

  void onChooseReceiveDate(DateTime dateTime) {
    receiveDate = dateTime.toString().substring(0, 10);
    _notifySafely();
    _validateFirstSection();
  }

  void onChooseWeightType(String weight) {
    weightType = weight;
    _notifySafely();
    _calculatePrice();
  }

  void onTapGenerate(BuildContext context) {
    _inUseLoading();
    _cargoRepo.postToken().then((value) {
      tokenController.text = value.token ?? "";
      _validateFirstSection();
      _inUseSuccess();
      _notifySafely();
      Functions.tokenDialog(
        context,
        200,
        () {
          Navigator.pop(context);
        },
        tokenController.text,
        "This is your generated token for tracking your parcel.Please take a copy of it.",
        "OK",
      );
    }).onError((error, stackTrace) {
      _inUseFailed();
    });
  }

  void customerNameValidate() {
    _customerNameV = (customerNameFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validateFirstSection();
  }

  void customerPhoneValidate() {
    _customerPhoneV = (customerPhoneFormKey.currentState?.validate() ?? false);
    _notifySafely();
    _validateFirstSection();
  }

  void customerAddressValidate() {
    _customerAddressV =
        customerAddressFormKey.currentState?.validate() ?? false;
    _notifySafely();
    _validateFirstSection();
  }

  void remarkValidate() {
    _remarkV = remarkFormKey.currentState?.validate() ?? false;
    _notifySafely();
    _validateFirstSection();
  }

  void quantityValidate() {
    _quantityV = quantityFormKey.currentState?.validate() ?? false;
    _notifySafely();
    _calculatePrice();
  }

  void weightValidate() {
    _weightV = quantityFormKey.currentState?.validate() ?? false;
    _notifySafely();
    _calculatePrice();
  }

  /// second section

  void onChoosePickUpValue(String value) {
    pickUpValue = value;
    _notifySafely();
    if (value == "Yes") {
      pickupFlag = 1;
      _notifySafely();
    } else {
      pickupFlag = 0;
      _notifySafely();
    }
    _validateFirstSection();
  }

  void onChooseTownship(String township) {
    if (isPickupSectionAvailable) {
      var list = townshipVOList
          ?.where((element) => element.townshipName == township)
          .toList();
      list?.take(1);
      townshipVo = list?.elementAt(0);
      if (townshipVo != null) {
        townshipChargesId = townshipVo?.id;
        total = charge + townshipVo!.charges!;
        townshipChargeController.text =
            "${townshipVo?.charges} ${priceByKgVO?.currency}";
        totalChargeController.text = "$total ${priceByKgVO?.currency}";
        _notifySafely();
        _validateSecondSection();
      }
    } else {
      Functions.toast(msg: "Fill the above fields first", status: false);
    }
  }

  void contactNumberValidate() {
    _contactNoV = contactNoFormKey.currentState?.validate() ?? false;
    _notifySafely();
    _validateSecondSection();
  }

  void pickupAddressValidate() {
    _pickupAddressV = pickupAddressFormKey.currentState?.validate() ?? false;
    _notifySafely();
    _validateSecondSection();
  }

  void onChoosePickupDate(DateTime dateTime) {
    if (isPickupSectionAvailable) {
      pickUpDate = dateTime.toString().substring(0, 10);
      _notifySafely();
      _validateSecondSection();
    } else {
      Functions.toast(msg: "Fill the above fields first", status: false);
    }
  }

  void pickupTimeValidate() {
    _pickupTimeV = pickupTimeFormKey.currentState?.validate() ?? false;
    _notifySafely();
    _validateSecondSection();
  }

  void _validateSecondSection() {
    if (isPickupSectionAvailable &&
        townshipChargesId != null &&
        _pickupTimeV &&
        _pickupAddressV &&
        _contactNoV &&
        townshipChargeController.text != "" &&
        totalChargeController.text != "" &&
        pickUpDate != "") {
      isSubmitUnlock = true;
      _notifySafely();
    }
  }

  void _validateFirstSection() {
    if (receivePointID != 0 &&
        receiveDate != "" &&
        dropOffPointID != 0 &&
        weightType != "" &&
        _customerNameV &&
        _customerPhoneV &&
        _customerAddressV &&
        _remarkV &&
        tokenController.text != "" &&
        _quantityV &&
        _weightV &&
        weightType != "" &&
        chargesController.text != "" &&
        packageID != 0) {
      isPickupSectionAvailable = true;
      _notifySafely();
      if (pickUpValue == "Yes") {
        isSubmitUnlock = false;
        _notifySafely();
      } else {
        isSubmitUnlock = true;
        _notifySafely();
      }
    } else {
      isPickupSectionAvailable = false;
      isSubmitUnlock = false;
      _notifySafely();
    }
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

  void _inUseLoading() {
    isInUseLoading = true;
    isInUseSuccess = false;
    _notifySafely();
  }

  void _inUseSuccess() {
    isInUseLoading = false;
    isInUseSuccess = true;
    _notifySafely();
  }

  void _inUseFailed() {
    isInUseLoading = false;
    isInUseSuccess = false;
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
