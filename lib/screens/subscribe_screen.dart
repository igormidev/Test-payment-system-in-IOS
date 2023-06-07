import 'package:flutter/material.dart';
import 'package:testchallange/core/constants/colors.dart';
import 'package:testchallange/elements/payment_listener_wrapper.dart';
import 'package:testchallange/widgets/subcribe_premium_advantages_card.dart';
import 'package:testchallange/widgets/subscribe_appbar.dart';
import 'package:testchallange/widgets/subscribe_header_text.dart';
import 'package:testchallange/widgets/subscribe_options_buttons.dart';
import 'package:testchallange/widgets/text_you_already_have_premium.dart';

class SubscribeScreen extends StatefulWidget {
  const SubscribeScreen({super.key});

  @override
  State<SubscribeScreen> createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
  bool isPremium = false;
  Color color = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return PaymentListenerWrapper(
      onPurchaseDetected: (final purchaseDetails) {
        if (purchaseDetails.productID == '100coinsInAppPurchase' ||
            purchaseDetails.purchaseID == '100coinsInAppPurchase') {
          setState(() {
            color = Colors.cyan;
          });
        }

        setState(() {
          isPremium = true;
        });
      },
      child: Scaffold(
        appBar: isPremium ? null : subscribeAppBar(context),
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            if (isPremium == false) ...{
              const SubscribeHeaderText(),
              const SubcribePremiumAdvantagesCard(),
              const SubscribeOptionsButtons(),
            } else ...{
              const SizedBox(height: 32),
              TextYouAlreadyHavePremium(color: color),
            }
          ],
        ),
        bottomNavigationBar: isPremium
            ? null
            : BottomNavigationBar(
                backgroundColor: const Color(0xff1D1D1F),
                currentIndex: 1,
                unselectedItemColor: Colors.grey,
                selectedItemColor: AppColors.primaryLite,
                selectedIconTheme: const IconThemeData(
                  color: AppColors.primary,
                ),
                unselectedIconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.subscriptions_outlined),
                    label: 'Ads',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.trending_up_rounded),
                    label: 'Subscribe',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
              ),
      ),
    );
  }
}
