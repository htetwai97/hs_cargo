import 'package:hs_cargo_customer_app/data_layer/vos/order_register_vo.dart';
import 'package:hs_cargo_customer_app/data_layer/vos/token_vo.dart';
import 'package:hs_cargo_customer_app/network/response/get_location_response.dart';
import 'package:hs_cargo_customer_app/network/response/get_price_by_kg_response.dart';
import 'package:hs_cargo_customer_app/network/response/get_township_and_charges_response.dart';
import 'package:hs_cargo_customer_app/network/response/get_way_plans_response.dart';
import 'package:hs_cargo_customer_app/network/response/post_order_track_response.dart';

abstract class HSCargoRepo {
  Future<PostOrderTrackResponse> postTrackPackage(
      String? token, String? phoneNumber);
  Future<GetLocationsResponse> getLocations();
  Future<GetPriceByKGResponse> getPriceByKg();
  Future<TokenVO> postToken();
  Future<void> postOrder(OrderRegisterVO orderRegisterVO);
  Future<void> saveStringList(String key,List<String> value);
  Future<List<String>> getStringList(String key);
  Future<GetTownshipAndChargesResponse> getTownshipCharges();
  Future<GetWayPlansResponse> getWayPlansList();
}
