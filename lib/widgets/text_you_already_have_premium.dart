import 'package:flutter/material.dart';

import 'subscribe_options_buttons.dart';

class TextYouAlreadyHavePremium extends StatefulWidget {
  final Color color;
  const TextYouAlreadyHavePremium({super.key, required this.color});

  @override
  State<TextYouAlreadyHavePremium> createState() =>
      _TextYouAlreadyHavePremiumState();
}

class _TextYouAlreadyHavePremiumState extends State<TextYouAlreadyHavePremium> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(fontWeight: FontWeight.bold);

    return Center(
      child: Column(
        children: [
          const SizedBox(height: 32),
          Text(
            'You already have premium features.',
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.workspace_premium, color: widget.color, size: 60),
              Icon(Icons.workspace_premium, color: widget.color, size: 60),
              Icon(Icons.workspace_premium, color: widget.color, size: 60),
              Icon(Icons.workspace_premium, color: widget.color, size: 60),
              Icon(Icons.workspace_premium, color: widget.color, size: 60),
            ],
          ),
          const SizedBox(height: 170),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: Colors.white,
            ),
            child: InkWell(
              onTap: () async {
                await makePurchase('100coinsInAppPurchase');
              },
              child: Center(
                child: Text(
                  'Test unique purchase',
                  style: style?.copyWith(fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
