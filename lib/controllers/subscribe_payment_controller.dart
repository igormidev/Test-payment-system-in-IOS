import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class SubscribePaymentController {
  late final StreamSubscription<List<PurchaseDetails>> _subscription;
  final ValueNotifier<List<ProductDetails>> productDetails = ValueNotifier([]);

  Future<void> subscribePremiumForMonths(int monts) async {
    final bool isPurchaseAvailible = await InAppPurchase.instance.isAvailable();

    if (isPurchaseAvailible) {
      const Set<String> kIds = <String>{'premium3months'};
      final ProductDetailsResponse response =
          await InAppPurchase.instance.queryProductDetails(kIds);

      final List<ProductDetails> products = response.productDetails;

      final PurchaseParam purchaseParam =
          PurchaseParam(productDetails: products.first);

      // InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);

      await InAppPurchase.instance
          .buyNonConsumable(purchaseParam: purchaseParam);
    } else {
      // Todo(igor): manege in ui this case
    }
  }

  void startListeningPurchase() {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        InAppPurchase.instance.purchaseStream;
    _subscription = purchaseUpdated.listen(
      (
        final List<PurchaseDetails> purchaseDetailsList,
      ) {
        _listenToPurchaseUpdated(purchaseDetailsList);
      },
      onError: (error, stackTrace) {
        log('Error', error: error, stackTrace: stackTrace);
      },
    );
  }

  void _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    // for (var purchaseDetails in purchaseDetailsList) {
    //   if (purchaseDetails.status == PurchaseStatus.pending) {
    //     // _showPendingUI();
    //   } else {
    //     if (purchaseDetails.status == PurchaseStatus.error) {
    //       // _handleError(purchaseDetails.error!);
    //     } else if (purchaseDetails.status == PurchaseStatus.purchased ||
    //         purchaseDetails.status == PurchaseStatus.restored) {
    //       final bool valid = await _verifyPurchase(purchaseDetails);
    //       if (valid) {
    //         // _deliverProduct(purchaseDetails);
    //       } else {
    //         // _handleInvalidPurchase(purchaseDetails);
    //       }
    //     }
    //     if (purchaseDetails.pendingCompletePurchase) {
    //       await InAppPurchase.instance.completePurchase(purchaseDetails);
    //     }
    //   }
    // }
  }

  void dispose() {}
}
