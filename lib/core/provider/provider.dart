import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:footwear_customer_app/Helper/String.dart';
import 'package:footwear_customer_app/Provider/SettingProvider.dart';
import 'package:footwear_customer_app/Provider/Theme.dart';
import 'package:footwear_customer_app/Provider/UserProvider.dart';
import 'package:footwear_customer_app/Provider/homePageProvider.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:footwear_customer_app/Helper/Color.dart';
import 'package:footwear_customer_app/Helper/Constant.dart';
import 'package:footwear_customer_app/Provider/CartProvider.dart';
import 'package:footwear_customer_app/Provider/CategoryProvider.dart';
import 'package:footwear_customer_app/Provider/Favourite/UpdateFavProvider.dart';
import 'package:footwear_customer_app/Provider/NotificationProvider.dart';
import 'package:footwear_customer_app/Provider/ProductProvider.dart';
import 'package:footwear_customer_app/Provider/Search/SearchProvider.dart';
import 'package:footwear_customer_app/Provider/UserProvider.dart';
import 'package:footwear_customer_app/Provider/explore_provider.dart';
import 'package:footwear_customer_app/Provider/authenticationProvider.dart';
import 'package:footwear_customer_app/Provider/myWalletProvider.dart';
import 'package:footwear_customer_app/Provider/paymentProvider.dart';
import 'package:footwear_customer_app/Screen/SplashScreen/Splash.dart';
import 'package:footwear_customer_app/Screen/Language/languageSettings.dart';
import 'package:footwear_customer_app/cubits/appSettingsCubit.dart';
import 'package:footwear_customer_app/cubits/brandsListCubit.dart';
import 'package:footwear_customer_app/cubits/personalConverstationsCubit.dart';
import 'package:footwear_customer_app/repository/brandsRepository.dart';
import 'package:footwear_customer_app/repository/chatRepository.dart';
import 'package:footwear_customer_app/Provider/UserProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:footwear_customer_app/Provider/FaqsProvider.dart';
import 'package:footwear_customer_app/Provider/Favourite/FavoriteProvider.dart';
import 'package:footwear_customer_app/Provider/ManageAddressProvider.dart';
import 'package:footwear_customer_app/Provider/Order/OrderProvider.dart';
import 'package:footwear_customer_app/Provider/Order/UpdateOrderProvider.dart';
import 'package:footwear_customer_app/Provider/addressProvider.dart';
import 'package:footwear_customer_app/Provider/chatProvider.dart';
import 'package:footwear_customer_app/Provider/customerSupportProvider.dart';
import 'package:footwear_customer_app/Provider/homePageProvider.dart';
import 'package:footwear_customer_app/Provider/productDetailProvider.dart';
import 'package:footwear_customer_app/Provider/ReviewGallleryProvider.dart';
import 'package:footwear_customer_app/Provider/ReviewPreviewProvider.dart';
import 'package:footwear_customer_app/Provider/Theme.dart';
import 'package:footwear_customer_app/Provider/SettingProvider.dart';
import 'package:footwear_customer_app/Provider/faqProvider.dart';
import 'package:footwear_customer_app/Provider/productListProvider.dart';
import 'package:footwear_customer_app/Provider/promoCodeProvider.dart';
import 'package:footwear_customer_app/Provider/pushNotificationProvider.dart';
import 'package:footwear_customer_app/Provider/sellerDetailProvider.dart';
import 'package:footwear_customer_app/Provider/systemProvider.dart';
import 'package:footwear_customer_app/Provider/userWalletProvider.dart';
import 'package:footwear_customer_app/Provider/writeReviewProvider.dart';

class ProviderPath {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  static dynamic providersList = [
    //   ChangeNotifierProvider<ThemeNotifier>(
    //   create: (BuildContext context) {
    //     String? theme = prefs.getString(APP_THEME);

    //     if (theme == DARK) {
    //       ISDARK = 'true';
    //     } else if (theme == LIGHT) {
    //       ISDARK = 'false';
    //     }

    //     if (theme == null || theme == '' || theme == DEFAULT_SYSTEM) {
    //       prefs.setString(APP_THEME, DEFAULT_SYSTEM);
    //       var brightness =
    //           SchedulerBinding.instance.platformDispatcher.platformBrightness;
    //       ISDARK = (brightness == Brightness.dark).toString();

    //       return ThemeNotifier(ThemeMode.system);
    //     }

    //     return ThemeNotifier(theme == LIGHT ? ThemeMode.light : ThemeMode.dark);
    //   },
    // ),
    // Provider<SettingProvider>(
    //   create: (context) => SettingProvider(prefs),
    // ),
    ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider()),
    ChangeNotifierProvider<HomePageProvider>(
        create: (context) => HomePageProvider()),
    ChangeNotifierProvider<CategoryProvider>(
        create: (context) => CategoryProvider()),
    ChangeNotifierProvider<ProductDetailProvider>(
        create: (context) => ProductDetailProvider()),
    ChangeNotifierProvider<FavoriteProvider>(
        create: (context) => FavoriteProvider()),
    ChangeNotifierProvider<OrderProvider>(create: (context) => OrderProvider()),
    ChangeNotifierProvider<CartProvider>(create: (context) => CartProvider()),
    ChangeNotifierProvider<ExploreProvider>(
        create: (context) => ExploreProvider()),
    ChangeNotifierProvider<ProductProvider>(
        create: (context) => ProductProvider()),
    ChangeNotifierProvider<FaqsProvider>(create: (context) => FaqsProvider()),
    ChangeNotifierProvider<PromoCodeProvider>(
        create: (context) => PromoCodeProvider()),
    ChangeNotifierProvider<SystemProvider>(
        create: (context) => SystemProvider()),
    ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider()),
    ChangeNotifierProvider<ProductListProvider>(
        create: (context) => ProductListProvider()),
    ChangeNotifierProvider<AuthenticationProvider>(
        create: (context) => AuthenticationProvider()),
    ChangeNotifierProvider<FaQProvider>(create: (context) => FaQProvider()),
    ChangeNotifierProvider<ReviewGallaryProvider>(
        create: (context) => ReviewGallaryProvider()),
    ChangeNotifierProvider<ReviewPreviewProvider>(
        create: (context) => ReviewPreviewProvider()),
    ChangeNotifierProvider<UpdateFavProvider>(
        create: (context) => UpdateFavProvider()),
    ChangeNotifierProvider<UserTransactionProvider>(
        create: (context) => UserTransactionProvider()),
    ChangeNotifierProvider<MyWalletProvider>(
        create: (context) => MyWalletProvider()),
    ChangeNotifierProvider<PaymentProvider>(
        create: (context) => PaymentProvider()),
    ChangeNotifierProvider<SellerDetailProvider>(
        create: (context) => SellerDetailProvider()),
    ChangeNotifierProvider<SearchProvider>(
        create: (context) => SearchProvider()),
    ChangeNotifierProvider<PushNotificationProvider>(
        create: (context) => PushNotificationProvider()),
    ChangeNotifierProvider<NotificationProvider>(
        create: (context) => NotificationProvider()),
    ChangeNotifierProvider<ManageAddrProvider>(
        create: (context) => ManageAddrProvider()),
    ChangeNotifierProvider<UpdateOrdProvider>(
        create: (context) => UpdateOrdProvider()),
    ChangeNotifierProvider<WriteReviewProvider>(
        create: (context) => WriteReviewProvider()),
    ChangeNotifierProvider<AddressProvider>(
        create: (context) => AddressProvider()),
    ChangeNotifierProvider<CustomerSupportProvider>(
        create: (context) => CustomerSupportProvider()),
    ChangeNotifierProvider<ChatProvider>(create: (context) => ChatProvider()),

    ///
    ///Chat feature related provides
    ///
    BlocProvider<PersonalConverstationsCubit>(
        create: (context) => PersonalConverstationsCubit(ChatRepository())),
    //cubit to get brand details on home page
    BlocProvider<BrandsListCubit>(
      create: (context) => BrandsListCubit(
        brandsRepository: BrandsRepository(),
      ),
    ),
    //cubit for global app-settings management
    BlocProvider<AppSettingsCubit>(
      create: (context) => AppSettingsCubit(),
    ),
  ];
}
