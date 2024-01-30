import 'package:hs_cargo_customer_app/data_layer/vos/tracking_data_vo.dart';

class PostOrderTrackResponse {
  List<TrackingDataVO>? data;
  String? message;
  int? total;
  int? page;
  int? rowPerPages;

  PostOrderTrackResponse(
      {this.data, this.message, this.total, this.page, this.rowPerPages});

  PostOrderTrackResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TrackingDataVO>[];
      json['data'].forEach((v) {
        data!.add(new TrackingDataVO.fromJson(v));
      });
    }
    message = json['message'];
    total = json['total'];
    page = json['page'];
    rowPerPages = json['rowPerPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['total'] = this.total;
    data['page'] = this.page;
    data['rowPerPages'] = this.rowPerPages;
    return data;
  }
}


