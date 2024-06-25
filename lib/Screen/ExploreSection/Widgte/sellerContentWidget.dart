import 'dart:math';

import 'package:footwear_customer_app/Helper/Color.dart';
import 'package:footwear_customer_app/Provider/homePageProvider.dart';
import 'package:footwear_customer_app/widgets/ratingCardForProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Helper/Constant.dart';
import '../../../Helper/routes.dart';
import '../../../Model/Section_Model.dart';
import '../../../widgets/desing.dart';
import '../../Language/languageSettings.dart';
import '../../../widgets/star_rating.dart';
import '../explore.dart';

// ignore: must_be_immutable
class ShowContentOfSellers extends StatelessWidget {
  List<Product> sellerList;
  ShowContentOfSellers({Key? key, required this.sellerList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return sellerList.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            controller: sellerListController,
            itemCount: sellerList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Card(
                  elevation: 0,
                  color: Theme.of(context).colorScheme.white,
                  child: ListTile(
                    title: Text(
                      sellerList[index].store_name!,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.lightBlack,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ubuntu',
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RatingCartForProduct(noOfRating: sellerList[index].noOfRatingsOnSeller!, totalRating: sellerList[index].seller_rating!),
                        // Expanded(
                        //   child: StarRating(
                        //       noOfRatings:
                        //           sellerList[index].noOfRatingsOnSeller!,
                        //       totalRating: sellerList[index].seller_rating!,
                        //       needToShowNoOfRatings: false),
                        // ),
                        Expanded(
                          child: Text(
                            '| ${sellerList[index].totalProductsOfSeller} ${getTranslated(context, 'PRODUCTS')} ',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: textFontSize14,
                              fontFamily: 'ubuntu',
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    leading: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(circularBorderRadius7),
                      child: sellerList[index].seller_profile == ''
                          ? Image.asset(
                              DesignConfiguration.setPngPath('placeholder'),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                          : DesignConfiguration.getCacheNotworkImage(
                              context: context,
                              boxFit: BoxFit.cover,
                              heightvalue: 50,
                              widthvalue: 50,
                              placeHolderSize: 50,
                              imageurlString: sellerList[index].seller_profile!,
                            ),
                    ),
                    trailing: Container(
                      width: 80,
                      height: 35,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(3.0, 0, 3.0, 0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: colors.black12),
                        borderRadius:
                            BorderRadius.circular(circularBorderRadius10),
                      ),
                      child: Center(
                        child: Text(
                          getTranslated(context, 'VIEW_STORE'),
                          style: const TextStyle(
                            color: colors.primary,
                            fontFamily: 'ubuntu',
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: true,
                        ),
                      ),
                    ),
                    onTap: () async {
                      Routes.navigateToSellerProfileScreen(
                        context,
                        sellerList[index].seller_id!,
                        sellerList[index].seller_profile!,
                        sellerList[index].seller_name!,
                        sellerList[index].seller_rating!,
                        sellerList[index].store_name!,
                        sellerList[index].store_description!,
                        sellerList[index].totalProductsOfSeller,
                      );
                    },
                  ),
                ),
              );
            },
          )
        : Selector<HomePageProvider, bool>(
            builder: (context, data, child) {
              return !data
                  ? Center(
                      child: Text(
                        getTranslated(context, 'No Seller/Store Found'),
                        style: const TextStyle(
                          fontFamily: 'ubuntu',
                        ),
                      ),
                    )
                  : const SizedBox();
            },
            selector: (_, provider) => provider.sellerLoading,
          );
  }
}
