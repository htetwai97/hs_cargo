import 'package:hs_cargo_customer_app/data_layer/model/hs_cargo_repo.dart';
import 'package:hs_cargo_customer_app/data_layer/vos/order_register_vo.dart';
import 'package:hs_cargo_customer_app/data_layer/vos/token_vo.dart';
import 'package:hs_cargo_customer_app/network/data_agent/dio_data_agent_impl.dart';
import 'package:hs_cargo_customer_app/network/response/get_location_response.dart';
import 'package:hs_cargo_customer_app/network/response/get_price_by_kg_response.dart';
import 'package:hs_cargo_customer_app/network/response/get_township_and_charges_response.dart';
import 'package:hs_cargo_customer_app/network/response/get_way_plans_response.dart';
import 'package:hs_cargo_customer_app/network/response/post_order_track_response.dart';
import 'package:hs_cargo_customer_app/persistence/share_preference/share_preference.dart';

class HSCargoRepoImpl extends HSCargoRepo {
  HSCargoRepoImpl._internal();

  static final HSCargoRepoImpl _singleton = HSCargoRepoImpl._internal();

  factory HSCargoRepoImpl() => _singleton;

  final _dataAgent = DioDataAgentImpl();
  final _shareP = SharePreferenceModel();

  @override
  Future<PostOrderTrackResponse> postTrackPackage(
      String? token, String? phoneNumber) {
    return _dataAgent.postTrackPackage(token, phoneNumber);
  }

  @override
  Future<GetLocationsResponse> getLocations() {
    return _dataAgent.getLocations();
  }

  @override
  Future<GetPriceByKGResponse> getPriceByKg() {
    return _dataAgent.getPriceByKg();
  }

  @override
  Future<TokenVO> postToken() {
    return _dataAgent.postToken();
  }

  @override
  Future<void> postOrder(OrderRegisterVO orderRegisterVO) {
    return _dataAgent.postOrder(orderRegisterVO);
  }

  @override
  Future<void> saveStringList(String key, List<String> value) {
    return _shareP.saveStringList(key, value);
  }

  @override
  Future<List<String>> getStringList(String key) {
    return _shareP.getStringList(key);
  }

  @override
  Future<GetTownshipAndChargesResponse> getTownshipCharges() {
    return _dataAgent.getTownshipCharges();
  }

  @override
  Future<GetWayPlansResponse> getWayPlansList() {
    return _dataAgent.getWayPlansList();
  }
}
