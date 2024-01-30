import 'package:hs_cargo_customer_app/data_layer/vos/address_vo.dart';

class AddressDummyData {
  static List<AddressVO> addressList = [
    AddressVO(
        state: "Bangkok",
        address:
            "2639 Soi Khlong Tan Mosque,Ramkhamhaeng Road, Suan Luang District,Bangkok 10250",
        phone: "+++66-0951033920"),
    AddressVO(
        state: "Maesot",
        address:
            "No.637/3, Moo 2 Soi 5,Tha Sai Luat, Mae Sot District,Tak 63110",
        phone: "+++66-0823992159, +66-087389314"),
    AddressVO(
        state: "Yangon",
        address: "No(296), 7 road, Mingalardon Industry, Zay Kabar",
        phone: "++09-796898989"),
    AddressVO(
        state: "Myawaddy",
        address: "6/7, Pyi Khaing Phyo Road",
        phone: "++09-796898989"),
  ];
}
