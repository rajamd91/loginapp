import 'package:flutter/material.dart';

// import '../../../../../constants/colors.dart';
// import '../../../../../constants/image_strings.dart';
// import '../../../../../constants/sizes.dart';
// import '../../../../../constants/text_strings.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
// import '../../../../../utils/constants/colors.dart';
// import '../../../../../utils/constants/image_strings.dart';
// import '../../../../../utils/constants/sizes.dart';
// import '../../../../../utils/constants/text_strings.dart';

class DashboardBanners extends StatelessWidget {
  const DashboardBanners({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: tCardBgColor),
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Image(image: AssetImage(tBookmarkIconImage)),
                    ),
                    Flexible(
                      child: Image(image: AssetImage(tBannerImage1)),
                    )
                  ],
                ),
                const SizedBox(height: 25.0),
                Text(tDashboardBannerTitle1,
                    style: txtTheme.headlineMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                Text(tDashboardBannerSubTitle,
                    style: txtTheme.headlineMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis)
              ],
            ),
          ),
        ),
        const SizedBox(width: tDashboardCardPadding),
        Expanded(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: tCardBgColor),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Image(image: AssetImage(tBookmarkIconImage)),
                        ),
                        Flexible(
                          child: Image(image: AssetImage(tBannerImage2)),
                        )
                      ],
                    ),
                    Text(tDashboardBannerTitle2,
                        style: txtTheme.headlineMedium,
                        overflow: TextOverflow.ellipsis),
                    Text(tDashboardBannerSubTitle,
                        style: txtTheme.headlineMedium,
                        overflow: TextOverflow.ellipsis)
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {}, child: Text(tDashboardButton)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
