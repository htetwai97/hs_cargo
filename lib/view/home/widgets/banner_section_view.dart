import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';

class BannerSectionHomeView extends StatefulWidget {
  final List<String>? bannerList;
  final double dividerHeight;
  final double viewPort;
  const BannerSectionHomeView({
    Key? key,
    required this.bannerList,
    this.dividerHeight = 4.2,
    this.viewPort = 0.8,
  }) : super(key: key);
  @override
  State<BannerSectionHomeView> createState() => _BannerSectionHomeViewState();
}

class _BannerSectionHomeViewState extends State<BannerSectionHomeView> {
  double _position = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _position = index.toDouble();
              });
            },
            height: MediaQuery.of(context).size.height / widget.dividerHeight,
            aspectRatio: 1.7,
            viewportFraction: widget.viewPort,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
          ),
          items: widget.bannerList
              ?.map(
                (bannerItem) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    bannerItem,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              .toList(),
        ),
        DotsIndicator(
          dotsCount: widget.bannerList?.length ?? 4,
          position: _position,
          decorator: const DotsDecorator(
            color: Colors.grey,
            activeColor: Colors.purple,
          ),
        ),
      ],
    );
  }
}
