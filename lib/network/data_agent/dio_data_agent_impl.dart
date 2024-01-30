import 'package:dio/dio.dart';
import 'package:hs_cargo_customer_app/data_layer/vos/order_register_vo.dart';
import 'package:hs_cargo_customer_app/data_layer/vos/token_vo.dart';
import 'package:hs_cargo_customer_app/network/api_service/api_constants.dart';
import 'package:hs_cargo_customer_app/network/api_service/api_service.dart';
import 'package:hs_cargo_customer_app/network/data_agent/dio_data_agent.dart';
import 'package:hs_cargo_customer_app/network/response/get_location_response.dart';
import 'package:hs_cargo_customer_app/network/response/get_price_by_kg_response.dart';
import 'package:hs_cargo_customer_app/network/response/get_township_and_charges_response.dart';
import 'package:hs_cargo_customer_app/network/response/get_way_plans_response.dart';
import 'package:hs_cargo_customer_app/network/response/post_order_track_response.dart';

class DioDataAgentImpl extends DioDataAgent {
  DioDataAgentImpl._internal();
  static final DioDataAgentImpl _singleton = DioDataAgentImpl._internal();
  factory DioDataAgentImpl() => _singleton;

  @override
  Future<PostOrderTrackResponse> postTrackPackage(
      String? token, String? phoneNumber) async {
    var dio = DioUtil.getDio();
    dio.options.queryParameters = {
      "token": token,
      "customer_phone": phoneNumber
    };
    try {
      final response = await dio.post(TRACKING_URL);
      if (response.statusCode == 200) {
        return PostOrderTrackResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetLocationsResponse> getLocations() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(LOCATION_URL);
      if (response.statusCode == 200) {
        return GetLocationsResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetPriceByKGResponse> getPriceByKg() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(PRICE_BY_KG_URL);
      if (response.statusCode == 200) {
        return GetPriceByKGResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<TokenVO> postToken() async {
    var dio = DioUtil.getDio();

    try {
      final response = await dio.post(TOKEN_URL);
      if (response.statusCode == 200) {
        return TokenVO.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> postOrder(OrderRegisterVO orderRegisterVO) async {
    var dio = DioUtil.getDio();
    var data = orderRegisterVO.toJson();
    try {
      final response = await dio.post(ORDER_URL, data: data);
      if (response.statusCode == 200) {
        return Future.value();
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetTownshipAndChargesResponse> getTownshipCharges() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(TOWNSHIP_PRICE);
      if (response.statusCode == 200) {
        return GetTownshipAndChargesResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetWayPlansResponse> getWayPlansList() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(WAYPLANS_URL);
      if (response.statusCode == 200) {
        return GetWayPlansResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
