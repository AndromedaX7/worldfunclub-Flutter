import 'package:dartin/dartin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worldfunclub/http/network.dart';
import 'package:worldfunclub/vm/address_list_page_provider.dart';
import 'package:worldfunclub/vm/balance_page_provider.dart';
import 'package:worldfunclub/vm/cart_page_provider.dart';
import 'package:worldfunclub/vm/club_page_provider.dart';
import 'package:worldfunclub/vm/goods_category_page_provider.dart';
import 'package:worldfunclub/vm/goods_details_provider.dart';
import 'package:worldfunclub/vm/goods_search_page_provider.dart';
import 'package:worldfunclub/vm/home_advert_page_provider.dart';
import 'package:worldfunclub/vm/home_category_home_provider.dart';
import 'package:worldfunclub/vm/home_category_other_provider.dart';
import 'package:worldfunclub/vm/home_main_page_provider.dart';
import 'package:worldfunclub/vm/live_category_page_provider.dart';
import 'package:worldfunclub/vm/live_page_provider.dart';
import 'package:worldfunclub/vm/local_cache.dart';
import 'package:worldfunclub/vm/login_page_provider.dart';
import 'package:worldfunclub/vm/login_phone_provider.dart';
import 'package:worldfunclub/vm/main_ui_provider.dart';
import 'package:worldfunclub/vm/mine_page_provider.dart';
import 'package:worldfunclub/vm/pay_success_page_provider.dart';
import 'package:worldfunclub/vm/settings_provider.dart';
import 'package:worldfunclub/vm/vip_page_provider.dart';

import 'file:///D:/dev/workspaces2/worldfunclub/lib/local_platform_channel.dart';

final appModule = [viewModelModule, localModule];

final localModule = Module([
  single<LocalCache>(({params}) => LocalCache(_preferences)),
  single<Api>(({params}) => api),
  factory<LocalChannel>(({params}) => LocalChannel()),
]);

final viewModelModule = Module([
  single<MainUiProvider>(({params}) => MainUiProvider(get())),
  factory<LoginPageProvider>(
      ({params}) => LoginPageProvider(get(), get(), get())),
  factory<LoginPhonePageProvider>(
      ({params}) => LoginPhonePageProvider(get(), get())),
  factory<HomeMainPageProvider>(({params}) => HomeMainPageProvider()),
  factory<HomeCategoryHomePageProvider>(
      ({params}) => HomeCategoryHomePageProvider()),
  factory<HomeCategoryOtherPageProvider>(
      ({params}) => HomeCategoryOtherPageProvider(params.get(0))),
  factory<LivePageProvider>(({params}) => LivePageProvider()),
  factory<LiveCategoryPageProvider>(
      ({params}) => LiveCategoryPageProvider(params.get(0))),
  factory<GoodsDetailsPageProvider>(
      ({params}) => GoodsDetailsPageProvider(params.get(0))),
  factory<CartPageProvider>(({params}) => CartPageProvider()),
  factory<VipPageProvider>(({params}) => VipPageProvider()),
  factory<SettingsPageProvider>(
      ({params}) => SettingsPageProvider(get(), get())),
  factory<MinePageProvider>(({params}) => MinePageProvider()),
  factory<BalancePageProvider>(({params}) => BalancePageProvider()),
  factory<ClubPageProvider>(({params}) => ClubPageProvider()),
  factory<GoodsCategoryPageProvider>(({params}) => GoodsCategoryPageProvider()),
  factory<HomeAdvertPageProvider>(({params}) =>
      HomeAdvertPageProvider(params.get(0), params.get(1), params.get(2))),
  factory<AddressListPageProvider>(({params}) => AddressListPageProvider()),
  factory<PaySuccessPageProvider>(({params}) => PaySuccessPageProvider(params.get(0),params.get(1),params.get(2),)),
  factory<GoodsSearchPageProvider>(
      ({params}) => GoodsSearchPageProvider(params.get(0), params.get(1)))
  // factory<BannerPageProvider>(({params})=>BannerPageProvider(params.get(0),params.get(1)))
]);

Future initDartIn() async {
  _preferences = await SharedPreferences.getInstance();
  startDartIn(appModule);
}

SharedPreferences _preferences;