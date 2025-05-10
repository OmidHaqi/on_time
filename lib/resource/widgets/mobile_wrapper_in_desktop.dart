import 'package:flutter/material.dart';

class MobileWrapperInDesktop extends StatelessWidget {
  const MobileWrapperInDesktop({
    super.key,
    required this.mobileWidth,
    required this.child,
  });

  final double mobileWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: mobileWidth,
          height: double.infinity,
          child: ClipRRect(
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                size: Size(mobileWidth, MediaQuery.of(context).size.height),
                padding: EdgeInsets.zero,
                viewInsets: EdgeInsets.zero,
                viewPadding: EdgeInsets.zero,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
