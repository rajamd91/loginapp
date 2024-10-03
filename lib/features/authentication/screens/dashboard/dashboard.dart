import 'package:flutter/material.dart';
import 'package:loginapp/features/authentication/screens/dashboard/widgets/appbar.dart';
import 'package:loginapp/features/authentication/screens/dashboard/widgets/banners.dart';
import 'package:loginapp/features/authentication/screens/dashboard/widgets/categories.dart';
import 'package:loginapp/features/authentication/screens/dashboard/widgets/search.dart';
import 'package:loginapp/features/authentication/screens/dashboard/widgets/top_courses.dart';
// import 'package:loginapp/src/constants/sizes.dart';
// import 'package:loginapp/src/constants/text_strings.dart';
// import 'package:loginapp/src/features/authentication/screens/dashboard/widgets/appbar.dart';
// import 'package:loginapp/src/features/authentication/screens/dashboard/widgets/banners.dart';
// import 'package:loginapp/src/features/authentication/screens/dashboard/widgets/categories.dart';
// import 'package:loginapp/src/features/authentication/screens/dashboard/widgets/search.dart';
// import 'package:loginapp/src/features/authentication/screens/dashboard/widgets/top_courses.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
// import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/constants/text_strings.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const DashboardAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  //Heading
                  Text(tDashboardTitle, style: txtTheme.bodyMedium),
                  Text(tDashboardHeading, style: txtTheme.displayMedium),
                  const SizedBox(height: tDashboardPadding),
                  // Search Box
                  DashboardSearchBox(txtTheme: txtTheme),
                  const SizedBox(height: tDashboardPadding),

                  // ----Categories
                  DashboardCategories(txtTheme: txtTheme),
                  const SizedBox(height: tDashboardPadding),

                  //---- Banners
                  DashboardBanners(txtTheme: txtTheme),
                  const SizedBox(height: tDashboardPadding),

                  //--Top Courses--
                  Text(tDashboardTopCourses,
                      style:
                          txtTheme.headlineMedium?.apply(fontSizeFactor: 1.2)),
                  DashboardTopCourses(txtTheme: txtTheme)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
