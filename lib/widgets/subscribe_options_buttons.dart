import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:testchallange/core/constants/colors.dart';
import 'package:testchallange/core/extensions/context_extensions.dart';

class SubscribeOptionsButtons extends StatelessWidget {
  const SubscribeOptionsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(fontWeight: FontWeight.bold);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 32),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          height: 70,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            gradient: LinearGradient(
              colors: <Color>[AppColors.primary, AppColors.primaryLite],
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            child: InkWell(
              onTap: () async {
                await makePurchase('inapptestingflutter1year');
              },
              child: Banner(
                message: "Best deal",
                location: BannerLocation.topEnd,
                color: const Color(0xffFFC555),
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: style,
                      children: [
                        TextSpan(
                          text: '1 Year',
                          style: style?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        const TextSpan(
                          text: ' (Only \$199,99)',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: context.height * 0.02),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          height: 70,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: Colors.white,
          ),
          child: InkWell(
            onTap: () async {
              await makePurchase('inapptestingflutter');
            },
            child: Center(
              child: Text(
                '3 months (Only \$59,99)',
                style: style?.copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

Future<bool> makePurchase(String id) async {
  final ProductDetailsResponse response =
      await InAppPurchase.instance.queryProductDetails({
    id,
    // 'inapptestingflutter',
    // '100coinsInAppPurchase',
  });

  final List<ProductDetails> products = response.productDetails;

  log('List:\n$products');

  if (products.isNotEmpty) {
    log('Not empty!');
  } else {
    return false;
  }

  final product = products.singleWhere((element) => element.id == id);

  final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);

  return await InAppPurchase.instance
      .buyConsumable(purchaseParam: purchaseParam);
}
