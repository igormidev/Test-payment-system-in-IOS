import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PaymentListenerWrapper extends StatefulWidget {
  final Widget child;
  final void Function(PurchaseDetails purchaseDetails) onPurchaseDetected;
  const PaymentListenerWrapper({
    Key? key,
    required this.child,
    required this.onPurchaseDetected,
  }) : super(key: key);

  @override
  State<PaymentListenerWrapper> createState() => _PaymentListenerWrapperState();
}

class _PaymentListenerWrapperState extends State<PaymentListenerWrapper> {
  late final StreamSubscription<List<PurchaseDetails>> _subscription;

  @override
  void initState() {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        InAppPurchase.instance.purchaseStream;

    _subscription = purchaseUpdated.listen(
      _listenToPurchaseUpdated,
      onError: (error, stackTrace) {
        log('Error', error: error, stackTrace: stackTrace);
        showPurchaseError(context, error.toString());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _getIfUserIsPremium() {}

  void _listenToPurchaseUpdated(
    List<PurchaseDetails> purchaseDetailsList,
  ) async {
    for (var purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        // _showPendingUI();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          // _handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          _defineIfUserIsPremium(purchaseDetails);
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    }
  }

  void _defineIfUserIsPremium(PurchaseDetails purchaseDetails) {
    widget.onPurchaseDetected(purchaseDetails);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

void showPurchaseError(BuildContext context, String error) {
  showDialog(
    context: context,
    builder: (final context) {
      return AlertDialog(
        title: const Text('Error while purchasing!'),
        content: Text(error),
      );
    },
  );
}
