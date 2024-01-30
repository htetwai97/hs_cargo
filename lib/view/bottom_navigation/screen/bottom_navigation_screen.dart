import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_color.dart';
import 'package:hs_cargo_customer_app/core/core_functions/functions.dart';
import 'package:hs_cargo_customer_app/view/home/screen/home_screen.dart';
import 'package:hs_cargo_customer_app/view/register_order/screen/register_order_screen.dart';
import 'package:hs_cargo_customer_app/view/your_orders/screen/your_orders_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavigationScreen extends StatefulWidget {
  final int currentIndex;
  const BottomNavigationScreen({
    super.key,
    this.currentIndex = 0,
  });

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  late int currentIndex;

  List<GButton> gList = const [
    GButton(
      haptic: true,
      icon: MdiIcons.home,
      text: "Home",
    ),
    GButton(
      haptic: true,
      icon: MdiIcons.idCard,
      text: "Register Order",
    ),
    GButton(
      haptic: true,
      icon: MdiIcons.clipboardList,
      text: "My Orders",
    ),
  ];

  List<Widget> screens = const [
    HomeScreen(),
    RegisterOrderScreen(),
    YourOrdersScreen(),
  ];
  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: MATERIAL_COLOR,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
          boxShadow: [
            Functions.buildBoxShadow(),
          ],
          border: Border.all(color: BLACK_LIGHT, width: 0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            onTabChange: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            selectedIndex: currentIndex,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            gap: 8,
            color: BLACK_HEAVY,
            activeColor: MATERIAL_COLOR,
            backgroundColor: Colors.transparent,
            tabBackgroundColor: APP_THEME_COLOR,
            tabs: gList,
          ),
        ),
      ),
    );
  }
}
