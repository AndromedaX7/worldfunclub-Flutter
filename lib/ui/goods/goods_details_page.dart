import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:web_view_open/webview_platform.dart';
import 'package:worldfunclub/providers.dart';
import 'package:worldfunclub/ui/goods/cart_page.dart';
import 'package:worldfunclub/utils/log.dart';
import 'package:worldfunclub/vm/goods_details_provider.dart';
import 'package:worldfunclub/widgets/item_tile.dart';
import 'package:worldfunclub/dev_wrapper/dev_wrapper.dart';
class GoodsDetailsPage extends ProviderWidget<GoodsDetailsPageProvider> {
  final String goodsId;
  final bool self;

  GoodsDetailsPage(this.goodsId, {this.self = true})
      : super(params: [goodsId, self]);

  @override
  Widget buildContent(BuildContext context) {
    return _GoodsDetailsPageContent(mProvider);
  }
}

class _GoodsDetailsPageContent extends StatefulWidget {
  final GoodsDetailsPageProvider provider;

  _GoodsDetailsPageContent(this.provider);

  @override
  _GoodsDetailsPageContentState createState() =>
      _GoodsDetailsPageContentState();
}

class _GoodsDetailsPageContentState extends State<_GoodsDetailsPageContent> {
  @override
  void initState() {
    super.initState();
    widget.provider.goodsDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    brightness: Brightness.light,
                    iconTheme: IconThemeData(
                      color: Colors.black54,
                    ),
                    backgroundColor: Colors.white,
                    pinned: true,
                    floating: true,
                    snap: false,
                    expandedHeight: 375.w,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      title: Text(
                        "${widget.provider.goodsName}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black),
                      ),
                      background: Container(
                        width: double.infinity,
                        height: 375.w,
                        child: Stack(
                          children: [
                            Swiper(
                              itemCount: widget.provider.images.length,
                              autoplay: true,
                              loop: false,
                              itemBuilder: (bc, i) => Image.network(
                                widget.provider.images[i],
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24.w),
                                    topRight: Radius.circular(24.w),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: 50.w,
                            color: Colors.white,
                            padding: EdgeInsets.only(
                                left: 14.w, right: 14.w, bottom: 14.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Text(
                                  "￥",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Color(0xFFE33542)),
                                ),
                                Text(
                                  "${widget.provider.price}",
                                  style: TextStyle(
                                      fontSize: 30.sp,
                                      color: Color(0xFFE33542)),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  "￥${widget.provider.linePrice}",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Color(0xFF999999),
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Spacer(),
                                Text(
                                  "已售${widget.provider.sales}件",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Color(0xFF999999),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: EdgeInsets.only(
                                left: 14.w, right: 14.w, bottom: 14.w),
                            child: Text(
                              "${widget.provider.goodsName}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.black),
                            ),
                          ),
                          Container(
                            height: 8.w,
                            color: Color(0xfff5f5f5),
                          ),
                          LinearTextBar2(
                            titleStyle: TextStyle(color: Color(0xFF999999)),
                            title: "已选",
                            height: 40,
                            subTitle: "8斤  150克",
                            trailing: Icon(Icons.navigate_next),
                          ),

                          LinearTextBar2(
                            titleStyle: TextStyle(color: Color(0xFF999999)),
                            title: "配送",
                            height: 40,
                            subTitle: "至   吉林省   长春市",
                            trailing: Icon(Icons.navigate_next),
                          ),

                          Container(
                            height: 8.w,
                            color: Color(0xfff5f5f5),
                          ),

                          LinearTextBar2(
                            title: "商品评价（${widget.provider.commentCount}）",
                            height: 40,
                          ),
                          // TODO 商品评价位
                          Container(
                            height: 8.w,
                            color: Color(0xfff5f5f5),
                          ),

                          Container(
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                "图文详情",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            height: 40.w,
                          ),
                          if (widget.provider.html.isNotEmpty)
                            Container(
                                color: Colors.white,
                                child: WebViewWrapper(widget.provider.html)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -1),
                  blurRadius: 4,
                  spreadRadius: 2),
            ]),
            height: 50.w,
            child: Row(
              children: [
                buildBottomButton(50.w, 50.w, "收藏", widget.provider.collection? "images/ic_star.png":"images/ic_start_around.png", () {}),
                buildBottomButton(
                    50.w, 50.w, "客服", "images/ic_message.webp", () {}),
                buildBottomButton(
                    50.w, 50.w, "购物车", "images/ic_cart.png", () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (c)=>CartPage()));
                  launchCart(context);
                }),
                Flexible(
                  fit: FlexFit.tight,
                  child: FlatButton( padding: EdgeInsets.zero,
                    onPressed: (){},
                    child: Container(
                      height: 50.w,
                      color: Colors.black,
                      child: Center(
                        child: Text("加入购物车",style: TextStyle(color:Colors.white,fontSize: 16.sp),),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: FlatButton( padding: EdgeInsets.zero,
                    onPressed: (){},
                    child: Container(
                      height: 50.w,
                      color: Color(0xFFE33542),
                      child: Center(
                        child: Text("立即购买",style: TextStyle(color:Colors.white,fontSize: 16.sp),),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomButton(
      double width, double height, String name, String assets, OnTap onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              assets,
              width: 20.w,
              height: 20.w,
              fit: BoxFit.fill,
            ),
            Text(
              "$name",
              style: TextStyle(color: Color(0xFF333333), fontSize: 10.sp),
            ),
          ],
        ),
        height: height,
        width: width,
      ),
    );
  }
}
