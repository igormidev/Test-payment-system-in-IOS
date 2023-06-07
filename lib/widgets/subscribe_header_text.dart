import 'package:flutter/material.dart';

class SubscribeHeaderText extends StatelessWidget {
  const SubscribeHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: RichText(
        text: TextSpan(
          style: style,
          children: [
            TextSpan(
              text: 'Skyrocket',
              style: style?.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ),
            ),
            const TextSpan(
              text: ' your business with HUNDREDS of high-converting ads!',
            ),
          ],
        ),
      ),
    );
  }
}
