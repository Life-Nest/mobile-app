import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app/core/theming/styles.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool? withReturn;
  final bool? withLogo;

  const ScreenHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.withReturn,
    this.withLogo,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      children: [
        SizedBox(height: 20.h),
        withLogo == false
            ? Container()
            : SizedBox(
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/svgs/black_green_stork.svg',
                  width: 90.w,
                ),
              ),
        SizedBox(height: 40.h),
        Text(
          title,
          style: TextStyles.h1BlackBold,
        ),
        Text(
          subtitle,
          style: TextStyles.smallFadded,
        ),
      ],
    );

    if (withReturn ?? false) {
      content = Stack(
        children: [
          IconButton(
            onPressed: () {
              context.maybePop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          content,
        ],
      );
    }

    return content;
  }
}
