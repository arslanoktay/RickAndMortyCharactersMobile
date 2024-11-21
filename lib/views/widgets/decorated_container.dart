import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DecoratedContainer extends StatelessWidget {
  final Widget child;
  final Widget topChild;
  const DecoratedContainer({super.key, required this.child, required this.topChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/backgroundRickandMorty.png'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          topChild,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50)
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
