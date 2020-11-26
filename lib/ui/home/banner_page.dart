import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:worldfunclub/bean/home_category.dart';
import 'package:worldfunclub/dev_wrapper/dev_wrapper.dart';

class BannerPage extends StatelessWidget {
  final num width;
  final num height;
  final List<BannerData> data;
  final bool self;

  BannerPage(this.width, this.height, this.data, {this.self = true});

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: data.isEmpty,
      child: Container(
        width: width,
        height: height,
        child: Swiper(
          loop: false,
          autoplay: true,
          itemCount: data.length,
          itemBuilder: (b, i) => GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (builder) => GoodsDetailsPage(
              //           data[i].goods_id,
              //           self: self,
              //         )));

              launchGoodsDetails(context, data[i].goods_id, useFlutter: false);
            },
            child: Image.network(
              data[i].img_url,
              width: width,
              height: height,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}