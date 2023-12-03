import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app/core/routing/routes.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/core/widgets/green_button.dart';
import 'package:mobile_app/features/get_started/role_tile.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/svgs/black_green_stork.svg',
                  width: 90.w,
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'Let\'s get started',
                style: TextStyles.h1BlackBold,
              ),
              Text(
                'Who are you?',
                style: TextStyles.smallFadded,
              ),
              SizedBox(height: 100.h),
              const RoleTile(
                icon: Icons.person_outline_outlined,
                titleText: 'I\'m a Parent',
                subtitleText: 'trying to find an incubator',
              ),
              SizedBox(height: 40.h),
              const RoleTile(
                icon: Icons.person_outline_outlined,
                titleText: 'I\'m a Doctor',
                subtitleText: 'Workign in a hospital',
              ),
              Expanded(child: Container()),
              const GreenButton(
                text: 'Continue',
                route: Routes.loginScreen,
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
