import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../Helper/Color.dart';
import '../Helper/Constant.dart';
import '../Helper/routes.dart';
import '../Provider/UserProvider.dart';
import '../Screen/Cart/Cart.dart';
import '../Screen/Cart/Widget/clearTotalCart.dart';
import 'desing.dart';
import '../Screen/Language/languageSettings.dart';

getAppBar(String title, BuildContext context, Function setState,
    {Widget? classType, Function()? onTap}) {
  return AppBar(
    titleSpacing: 0,
    backgroundColor: Theme.of(context).colorScheme.white,
    leading: Builder(
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: InkWell(
            borderRadius: BorderRadius.circular(circularBorderRadius4),
            onTap: onTap ??
                () => classType != null
                    ? Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => classType),
                        (route) => false)
                    : Navigator.of(context).pop(),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: colors.primary,
              ),
            ),
          ),
        );
      },
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: colors.primary,
        fontWeight: FontWeight.normal,
        fontFamily: 'ubuntu',
      ),
    ),
    actions: <Widget>
    [
      title == getTranslated(context, 'FAVORITE') || title == getTranslated(context, 'NOTIFICATION') || title == getTranslated(context, 'CHAT') || title == getTranslated(context, 'ORDER_PLACED')|| title == getTranslated(context, 'CUSTOMER_REVIEW_LBL')|| title == getTranslated(context, 'Questions and Answers') || title == getTranslated(context, 'REVIEW_BY_CUST')
          ? const SizedBox()
          : IconButton(
              padding: const EdgeInsets.all(0),
              icon: SvgPicture.asset(
                DesignConfiguration.setSvgPath('desel_fav'),
                colorFilter:
                    const ColorFilter.mode(colors.primary, BlendMode.srcIn),
              ),
              onPressed: () {
                Routes.navigateToFavoriteScreen(context);
              },
            ),
      Selector<UserProvider, String>(
        builder: (context, data, child) {
          return   title == getTranslated(context, 'NOTIFICATION') || title == getTranslated(context, 'CHAT') || title == getTranslated(context, 'MY_ORDERS_LBL') || title == getTranslated(context, 'ORDER_PLACED')|| title == getTranslated(context, 'CUSTOMER_REVIEW_LBL')|| title == getTranslated(context, 'Questions and Answers') || title == getTranslated(context, 'REVIEW_BY_CUST')
          ? const SizedBox()
          : IconButton(
            icon: Stack(
              children: [
                Center(
                  child: SvgPicture.asset(
                    DesignConfiguration.setSvgPath('appbarCart'),
                    colorFilter:
                        const ColorFilter.mode(colors.primary, BlendMode.srcIn),
                  ),
                ),
                (data.isNotEmpty && data != '0')
                    ? Positioned(
                        bottom: 20,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors.primary,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Text(
                                data,
                                style: const TextStyle(
                                  fontSize: textFontSize7,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ubuntu',
                                  color: colors.whiteTemp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
            onPressed: () {
              cartTotalClear(context);
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const Cart(
                    fromBottom: false,
                  ),
                ),
              ).then(
                (value) {
                  setState;
                },
              );
            },
          );
         
        },
        selector: (_, HomePageProvider) => HomePageProvider.curCartCount,
      )
    ],
  );
}

getSimpleAppBar(
  String title,
  BuildContext context,
) {
  return AppBar(
    titleSpacing: 0,
    backgroundColor: Theme.of(context).colorScheme.white,
    leading: Builder(
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: InkWell(
            borderRadius: BorderRadius.circular(circularBorderRadius4),
            onTap: () => Navigator.of(context).pop(),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: colors.primary,
              ),
            ),
          ),
        );
      },
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: colors.primary,
        fontWeight: FontWeight.normal,
        fontFamily: 'ubuntu',
      ),
    ),
  );
}
