import 'package:footwear_customer_app/Provider/UserProvider.dart';
import 'package:footwear_customer_app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Helper/Color.dart';
import '../../../Helper/Constant.dart';
import '../../../Helper/String.dart';
import '../../../Provider/CartProvider.dart';
import '../../../widgets/desing.dart';
import '../../Language/languageSettings.dart';
import '../../Dashboard/Dashboard.dart';

// ignore: must_be_immutable
class SaveLatterIteam extends StatefulWidget {
  int index;
  Function setState;
  Function cartFunc;

  SaveLatterIteam({
    Key? key,
    required this.index,
    required this.setState,
    required this.cartFunc,
  }) : super(key: key);

  @override
  State<SaveLatterIteam> createState() => _SaveLatterIteamState();
}

class _SaveLatterIteamState extends State<SaveLatterIteam> {
  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    int selectedPos = 0;
    for (int i = 0;
        i <
            context
                .read<CartProvider>()
                .saveLaterList[index]
                .productList![0]
                .prVarientList!
                .length;
        i++) {
      if (context.read<CartProvider>().saveLaterList[index].varientId ==
          context
              .read<CartProvider>()
              .saveLaterList[index]
              .productList![0]
              .prVarientList![i]
              .id) {
        selectedPos = i;
      }
    }
    double price = double.parse(context
        .read<CartProvider>()
        .saveLaterList[index]
        .productList![0]
        .prVarientList![selectedPos]
        .disPrice!);
    if (price == 0) {
      price = double.parse(context
          .read<CartProvider>()
          .saveLaterList[index]
          .productList![0]
          .prVarientList![selectedPos]
          .price!);
    }
    double off = (double.parse(context
                .read<CartProvider>()
                .saveLaterList[index]
                .productList![0]
                .prVarientList![selectedPos]
                .price!) -
            double.parse(context
                .read<CartProvider>()
                .saveLaterList[index]
                .productList![0]
                .prVarientList![selectedPos]
                .disPrice!))
        .toDouble();
    off = off *
        100 /
        double.parse(context
            .read<CartProvider>()
            .saveLaterList[index]
            .productList![0]
            .prVarientList![selectedPos]
            .price!);
    context.read<CartProvider>().saveLaterList[index].perItemPrice =
        price.toString();
    if (context
            .read<CartProvider>()
            .saveLaterList[index]
            .productList![0]
            .availability !=
        '0') {
      context.read<CartProvider>().saveLaterList[index].perItemTotal = (price *
              double.parse(
                  context.read<CartProvider>().saveLaterList[index].qty!))
          .toString();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 1.0,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            elevation: 0.1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag:
                      '$heroTagUniqueString$heroTagUniqueString$index${context.read<CartProvider>().saveLaterList[index].productList![0].id}',
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(circularBorderRadius4),
                          bottomLeft: Radius.circular(circularBorderRadius4),
                        ),
                        child: Stack(
                          children: [
                            DesignConfiguration.getCacheNotworkImage(
                              boxFit: extendImg ? BoxFit.cover : BoxFit.contain,
                              context: context,
                              heightvalue: 100.0,
                              widthvalue: 100.0,
                              imageurlString: context
                                              .read<CartProvider>()
                                              .saveLaterList[index]
                                              .productList![0]
                                              .type ==
                                          'variable_product' &&
                                      context
                                          .read<CartProvider>()
                                          .saveLaterList[index]
                                          .productList![0]
                                          .prVarientList![selectedPos]
                                          .images!
                                          .isNotEmpty
                                  ? context
                                      .read<CartProvider>()
                                      .saveLaterList[index]
                                      .productList![0]
                                      .prVarientList![selectedPos]
                                      .images![0]
                                  : context
                                      .read<CartProvider>()
                                      .saveLaterList[index]
                                      .productList![0]
                                      .image!,
                              placeHolderSize: 100,
                            ),
                            Positioned.fill(
                              child: context
                                          .read<CartProvider>()
                                          .saveLaterList[index]
                                          .productList![0]
                                          .availability ==
                                      '0'
                                  ? Container(
                                      height: 55,
                                      color: colors.white70,
                                      padding: const EdgeInsets.all(2),
                                      child: Center(
                                        child: Text(
                                          getTranslated(
                                              context, 'OUT_OF_STOCK_LBL'),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'ubuntu',
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    top: 5.0, end: 20),
                                child: Text(
                                  context
                                      .read<CartProvider>()
                                      .saveLaterList[index]
                                      .productList![0]
                                      .name!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontFamily: 'ubuntu',
                                        color: Theme.of(context)
                                            .colorScheme
                                            .fontColor,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  start: 8.0,
                                  end: 8,
                                  bottom: 8,
                                ),
                                child: Icon(
                                  Icons.close,
                                  size: 20,
                                  color:
                                      Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              onTap: () async {
                                if (context.read<CartProvider>().isProgress ==
                                    false) {
                                  if (context.read<UserProvider>().userId !=
                                      '') {
                                    context.read<CartProvider>().deleteFromCart(
                                        index: index,
                                        cartList: context
                                            .read<CartProvider>()
                                            .saveLaterList,
                                        move: true,
                                        selPos: selectedPos,
                                        context: context,
                                        update: widget.setState,
                                        promoCode: context
                                            .read<CartProvider>()
                                            .promoC
                                            .text,
                                        from: 2);
                                  } else {
                                    db.removeSaveForLater(
                                        context
                                            .read<CartProvider>()
                                            .saveLaterList[index]
                                            .productList![0]
                                            .prVarientList![selectedPos]
                                            .id!,
                                        context
                                            .read<CartProvider>()
                                            .saveLaterList[index]
                                            .productList![0]
                                            .id!);
                                    context
                                        .read<CartProvider>()
                                        .productIds
                                        .remove(context
                                            .read<CartProvider>()
                                            .saveLaterList[index]
                                            .productList![0]
                                            .prVarientList![selectedPos]
                                            .id!);

                                    context
                                        .read<CartProvider>()
                                        .saveLaterList
                                        .removeAt(index);
                                    widget.setState();
                                  }
                                }
                              },
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              '${DesignConfiguration.getPriceFormat(context, price)!} ',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'ubuntu',
                              ),
                            ),
                            Text(
                              double.parse(context
                                          .read<CartProvider>()
                                          .saveLaterList[index]
                                          .productList![0]
                                          .prVarientList![selectedPos]
                                          .disPrice!) !=
                                      0
                                  ? DesignConfiguration.getPriceFormat(
                                      context,
                                      double.parse(
                                        context
                                            .read<CartProvider>()
                                            .saveLaterList[index]
                                            .productList![0]
                                            .prVarientList![selectedPos]
                                            .price!,
                                      ),
                                    )!
                                  : '',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                      fontFamily: 'ubuntu',
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: colors.darkColor3,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      decorationThickness: 2,
                                      letterSpacing: 0.7),
                            ),
                            off != 0 &&
                                    context
                                            .read<CartProvider>()
                                            .saveLaterList[index]
                                            .productList![0]
                                            .prVarientList![selectedPos]
                                            .disPrice! !=
                                        '0'
                                ? Text(
                                    '  ${off.toStringAsFixed(2)}%',
                                    style: const TextStyle(
                                      color: colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: textFontSize9,
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          context
                          .read<CartProvider>()
                          .saveLaterList[index]
                          .productList![0]
                          .availability ==
                      '1' ||
                  context
                          .read<CartProvider>()
                          .saveLaterList[index]
                          .productList![0]
                          .stockType ==
                      ''
              ? Positioned.directional(
                  textDirection: Directionality.of(context),
                  end: 8,
                bottom: 8,
                  child: Container(
                    // elevation: 1,
                    decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .white,
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .gray,
                                                  width: 1),
                                              borderRadius:
                                                  const BorderRadiusDirectional
                                                      .all(
                                                Radius.circular(
                                                    circularBorderRadius50),
                                              ),
                                            ),
                   
                    child: InkWell(
                      onTap: !context.read<CartProvider>().addCart &&
                              !context.read<CartProvider>().isProgress
                          ? () {
                              if (context.read<UserProvider>().userId != '') {
                                context.read<CartProvider>().addCart = true;
                                widget.setState();
                                context.read<CartProvider>().saveForLater(
                                      update: widget.setState,
                                      fromSave: true,
                                      id: context
                                          .read<CartProvider>()
                                          .saveLaterList[index]
                                          .varientId,
                                      price: double.parse(context
                                          .read<CartProvider>()
                                          .saveLaterList[index]
                                          .perItemTotal!),
                                      context: context,
                                      qty: context
                                          .read<CartProvider>()
                                          .saveLaterList[index]
                                          .qty,
                                      save: '0',
                                      curItem: context
                                          .read<CartProvider>()
                                          .saveLaterList[index],
                                      promoCode: context
                                          .read<CartProvider>()
                                          .promoC
                                          .text,
                                    );
                              } else {
                                () async {
                                  if (singleSellerOrderSystem) {
                                    if (CurrentSellerID == '' ||
                                        CurrentSellerID ==
                                            context
                                                .read<CartProvider>()
                                                .saveLaterList[index]
                                                .sellerId!) {
                                      CurrentSellerID = context
                                          .read<CartProvider>()
                                          .saveLaterList[index]
                                          .sellerId!;
                                      context.read<CartProvider>().addCart =
                                          true;
                                      context
                                          .read<CartProvider>()
                                          .setProgress(true);
                                      widget.cartFunc(
                                        index: index,
                                        selectedPos: selectedPos,
                                        total: double.parse(context
                                            .read<CartProvider>()
                                            .saveLaterList[index]
                                            .perItemTotal!),
                                      );
                                    } else {
                                      setSnackbar(
                                          getTranslated(context,
                                              'only Single Seller Product Allow'),
                                          context);
                                    }
                                  } else {
                                    context.read<CartProvider>().addCart = true;
                                    context
                                        .read<CartProvider>()
                                        .setProgress(true);
                                    widget.cartFunc(
                                      index: index,
                                      selectedPos: selectedPos,
                                      total: double.parse(context
                                          .read<CartProvider>()
                                          .saveLaterList[index]
                                          .perItemTotal!),
                                    );
                                  }
                                }();

                                widget.setState();
                              }
                            }
                          : null,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
