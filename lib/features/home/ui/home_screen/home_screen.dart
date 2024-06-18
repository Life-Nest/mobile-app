import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:mobile_app/core/helpers/extensions.dart';
import 'package:mobile_app/core/helpers/spacing.dart';
import 'package:mobile_app/core/routing/routes.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/widgets/screen_header.dart';
import 'package:mobile_app/features/home/ui/home_screen/navigation_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void launchURL(BuildContext context) async {
    final url = Uri.https('egyptiancurebank.com');

    if (await launcher.canLaunchUrl(url)) {
      await launcher.launchUrl(url);
    } else {
      if (!context.mounted) throw 'Could not launch the url';

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('could\'t redirect to egyptiancurebank'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    print(AuthCache.getCacheData('token'));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              const ScreenHeader(
                title: 'Welcome!',
                subtitle: 'We will help you find an incubator',
                withReturn: false,
              ),
              Expanded(
                child: Center(
                  child: CircleAvatar(
                    radius: 80.w,
                    backgroundColor: ColorsManager.mainGreen,
                    child: InkWell(
                      onTap: () {
                        context.pushNamed(Routes.searchRequestScreen);
                      },
                      child: PhosphorIcon(
                        PhosphorIcons.magnifyingGlass(),
                        size: 100.h,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavigationButton(
                    route: Routes.profileScreen,
                    icon: PhosphorIcons.handCoins(),
                    tapMethod: () {
                      launchURL(context);
                    },
                  ),
                  horizontalSpace(20.w),
                  const NavigationButton(
                    route: Routes.monitoringScreen,
                    icon: Icons.monitor_heart_outlined,
                  ),
                  horizontalSpace(20.w),
                  const NavigationButton(
                    route: Routes.profileScreen,
                    icon: Icons.account_circle_outlined,
                  ),
                ],
              ),
              verticalSpace(100.h),
            ],
          ),
        ),
      ),
    );
  }
}
