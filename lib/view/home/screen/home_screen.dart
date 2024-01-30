import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_style.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/data_layer/dummy_data/address_dummy_data.dart';
import 'package:hs_cargo_customer_app/view/home/widgets/banner_section_view.dart';
import 'package:hs_cargo_customer_app/view/home/widgets/price_box_list_view.dart';
import 'package:hs_cargo_customer_app/view/home/widgets/readmore_readless_widget.dart';
import 'package:hs_cargo_customer_app/view/home/widgets/title_and_address_list_widget_view.dart';
import 'package:hs_cargo_customer_app/view/tracking/screen/tracking_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: MATERIAL_COLOR,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/images/company_logo.png",
                      width: scaleWidth(context) - 160,
                    ),
                    MaterialButton(
                      color: APP_THEME_COLOR,
                      onPressed: () {
                        Functions.rightToLeftTransition(
                            context, const TrackingScreen());
                      },
                      child: Text(
                        "Track Parcel",
                        style: ConfigStyle.regularStyleOne(
                          DIMEN_FOURTEEN,
                          MATERIAL_COLOR,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const BannerSectionHomeView(
                  bannerList: [
                    "assets/images/mission.png",
                    "assets/images/vision.png",
                    "assets/images/service.png",
                    "assets/images/network.png"
                  ],
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ReadMoreLessWidget(
                    title:
                        "ထိုင်းနိုင်ငံက ပစ္စည်းသာမှာလိုက်ပါ . . . HS Cargo မှ မြန်မာတစ်နိုင်ငံလုံးပတ်ပို့ပေးမယ်ဆို ယုံမလား?",
                    text:
                        "ထိုင်းနိုင်ငံက ပစ္စည်းသာမှာလိုက်ပါ . . . HS Cargo မှ မြန်မာတစ်နိုင်ငံလုံးပတ်ပို့ပေးမယ်ဆို ယုံမလား? ဟုတ်ပါတယ် HS Cargo မှ မြန်မာနိုင်ငံရှိ မြို့နယ်တွေကို ကားဂိတ်မှ တဆင့်ပို့ဆောင်ပေးမှာဖြစ်ပါတယ်။ ရန်ကုန်၊ မန္တလေးကတော့ အိမ်အ‌ရောက်ပို့ပေးမှာပါဗျ။ ထိုင်းနိုင်ငံမှ Order တွေကို မြန်မာနိုင်ငံသို့ ပို့ဆောင်ချင်တဲ့ Customers များအတွက် HS Cargo မှ မြန်မာတစ်ပြည်လုံးအနှံ့ပို့ဆောင်ပေးနေပြီဆိုတော့ . . . မိတ်ဟောင်းမိတ်သစ် Customers များအားလုံး HS Cargo နဲ့ စိတ်ချယုံကြည်စွာ ပို့ဆောင်ဖို့ ဖိတ်ခေါ်လိုက်ရပါတယ်။ ထိုင်းမှမြန်မာ ပစ္စည်းပို့ဖို့ ခုပဲ Page Messenger ကနေ ဆက်သွယ်လိုက်တော့နော်။",
                    maxLines: 15,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TitleAndAddressListWidgetView(
                    title: 'Our offices',
                    list: AddressDummyData.addressList,
                  ),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ReadMoreLessWidget(
                    title:
                        "HS နဲ့ ပစ္စည်းပို့ရင် ဘယ်ဘက်ကနေ ပို့တာ ပိုအဆင်ပြေလဲ?",
                    text:
                        "HS နဲ့ ပစ္စည်းပို့ရင် ဘယ်ဘက်ကနေ ပို့တာ ပိုအဆင်ပြေလဲ? Team Bangkok လား❓Team Maesot လား❓🤔 👍🏻 Team Bkk ဆို ယခု Post ကို Like လုပ်ပြီး 💜 Team Maesot ဆို Love React လေး ပေးသွာကြမယ်နော်။ ဝန်ဆောင်မှုကောင်းတွေနဲ့ ပို့ဆောင်ပေးနိုင်ဖို့ HS Cargo go မှ အမြဲ ကြိုးစားလျက်ပါဗျ 🙏🏻",
                    maxLines: 15,
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: PriceBoxListView(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
