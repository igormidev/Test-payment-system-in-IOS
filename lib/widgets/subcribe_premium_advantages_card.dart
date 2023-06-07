import 'package:flutter/material.dart';

class SubcribePremiumAdvantagesCard extends StatelessWidget {
  const SubcribePremiumAdvantagesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 270,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: Colors.grey[800],
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ListTileIcon(
            text: 'Library of HUNDREDS of incredible, effective ads!',
            imagePath: 'Icon/library.png',
          ),
          _ListTileIcon(
            text: '100+ NEW ads added weekly!',
            imagePath: 'Icon/ads.png',
          ),
          _ListTileIcon(
            text: '10+ Business Types',
            imagePath: 'Icon/business.png',
          ),
          _ListTileIcon(
            text: 'Fixed monthly price for unlimited profits!',
            imagePath: 'Icon/profits.png',
          ),
        ],
      ),
    );
  }
}

class _ListTileIcon extends StatelessWidget {
  final String imagePath;
  final String text;
  const _ListTileIcon({required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 16),
          SizedBox(
            height: 25,
            width: 25,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
