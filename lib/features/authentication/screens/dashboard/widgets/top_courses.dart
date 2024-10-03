import 'package:flutter/material.dart';
// import '../../../../../constants/colors.dart';
// import '../../../../../constants/image_strings.dart';
// import '../../../../../constants/sizes.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
// import '../../../../../utils/constants/colors.dart';
// import '../../../../../utils/constants/image_strings.dart';
// import '../../../../../utils/constants/sizes.dart';
import '../../../models/dashboard/topcourses_model.dart';

class DashboardTopCourses extends StatelessWidget {
  const DashboardTopCourses({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final list = DashboardTopCoursesModel.list;
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: list[index].onPress,
          child: SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: tCardBgColor,
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            list[index].title,
                            style: txtTheme.headlineMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Flexible(
                          child: Image(
                            image: AssetImage(tTopCourseImage1),
                            height: 110,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder()),
                          onPressed: () {},
                          child: const Icon(Icons.play_arrow),
                        ),
                        const SizedBox(width: tDashboardCardPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[index].heading,
                              style: txtTheme.headlineMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              list[index].subHeading,
                              style: txtTheme.bodyMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

        // children: [
        //   SizedBox(
        //     width: 320,
        //     height: 200,
        //     child: Padding(
        //       padding: const EdgeInsets.only(right: 10.0, top: 5.0),
        //       child: Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10.0),
        //           color: tCardBgColor,
        //         ),
        //         padding: const EdgeInsets.symmetric(
        //             vertical: 10.0, horizontal: 10.0),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Flexible(
        //                   child: Text(
        //                     "Flutter Crash Courses",
        //                     style: txtTheme.headlineMedium,
        //                     maxLines: 2,
        //                     overflow: TextOverflow.ellipsis,
        //                   ),
        //                 ),
        //                 Flexible(
        //                   child: Image(
        //                     image: AssetImage(tTopCourseImage1),
        //                     height: 110,
        //                   ),
        //                 )
        //               ],
        //             ),
        //             Row(
        //               children: [
        //                 ElevatedButton(
        //                   style:
        //                       ElevatedButton.styleFrom(shape: CircleBorder()),
        //                   onPressed: () {},
        //                   child: Icon(Icons.play_arrow),
        //                 ),
        //                 SizedBox(width: tDashboardCardPadding),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       "3 Sections",
        //                       style: txtTheme.headlineMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                     Text(
        //                       "Programming Languages",
        //                       style: txtTheme.bodyMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                   ],
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     width: 320,
        //     height: 200,
        //     child: Padding(
        //       padding: const EdgeInsets.only(right: 10.0, top: 5.0),
        //       child: Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10.0),
        //           color: tCardBgColor,
        //         ),
        //         padding: const EdgeInsets.symmetric(
        //             vertical: 10.0, horizontal: 10.0),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Flexible(
        //                   child: Text(
        //                     "Flutter Crash Courses",
        //                     style: txtTheme.headlineMedium,
        //                     maxLines: 2,
        //                     overflow: TextOverflow.ellipsis,
        //                   ),
        //                 ),
        //                 Flexible(
        //                   child: Image(
        //                     image: AssetImage(tTopCourseImage1),
        //                     height: 110,
        //                   ),
        //                 )
        //               ],
        //             ),
        //             Row(
        //               children: [
        //                 ElevatedButton(
        //                   style:
        //                       ElevatedButton.styleFrom(shape: CircleBorder()),
        //                   onPressed: () {},
        //                   child: Icon(Icons.play_arrow),
        //                 ),
        //                 SizedBox(width: tDashboardCardPadding),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       "3 Sections",
        //                       style: txtTheme.headlineMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                     Text(
        //                       "Programming Languages",
        //                       style: txtTheme.bodyMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                   ],
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     width: 320,
        //     height: 200,
        //     child: Padding(
        //       padding: const EdgeInsets.only(right: 10.0, top: 5.0),
        //       child: Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10.0),
        //           color: tCardBgColor,
        //         ),
        //         padding: const EdgeInsets.symmetric(
        //             vertical: 10.0, horizontal: 10.0),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Flexible(
        //                   child: Text(
        //                     "Flutter Crash Courses",
        //                     style: txtTheme.headlineMedium,
        //                     maxLines: 2,
        //                     overflow: TextOverflow.ellipsis,
        //                   ),
        //                 ),
        //                 Flexible(
        //                   child: Image(
        //                     image: AssetImage(tTopCourseImage1),
        //                     height: 110,
        //                   ),
        //                 )
        //               ],
        //             ),
        //             Row(
        //               children: [
        //                 ElevatedButton(
        //                   style:
        //                       ElevatedButton.styleFrom(shape: CircleBorder()),
        //                   onPressed: () {},
        //                   child: Icon(Icons.play_arrow),
        //                 ),
        //                 SizedBox(width: tDashboardCardPadding),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       "3 Sections",
        //                       style: txtTheme.headlineMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                     Text(
        //                       "Programming Languages",
        //                       style: txtTheme.bodyMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                   ],
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     width: 320,
        //     height: 200,
        //     child: Padding(
        //       padding: const EdgeInsets.only(right: 10.0, top: 5.0),
        //       child: Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10.0),
        //           color: tCardBgColor,
        //         ),
        //         padding: const EdgeInsets.symmetric(
        //             vertical: 10.0, horizontal: 10.0),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Flexible(
        //                   child: Text(
        //                     "Flutter Crash Courses",
        //                     style: txtTheme.headlineMedium,
        //                     maxLines: 2,
        //                     overflow: TextOverflow.ellipsis,
        //                   ),
        //                 ),
        //                 Flexible(
        //                   child: Image(
        //                     image: AssetImage(tTopCourseImage1),
        //                     height: 110,
        //                   ),
        //                 )
        //               ],
        //             ),
        //             Row(
        //               children: [
        //                 ElevatedButton(
        //                   style:
        //                       ElevatedButton.styleFrom(shape: CircleBorder()),
        //                   onPressed: () {},
        //                   child: Icon(Icons.play_arrow),
        //                 ),
        //                 SizedBox(width: tDashboardCardPadding),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       "3 Sections",
        //                       style: txtTheme.headlineMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                     Text(
        //                       "Programming Languages",
        //                       style: txtTheme.bodyMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                   ],
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     width: 320,
        //     height: 200,
        //     child: Padding(
        //       padding: const EdgeInsets.only(right: 10.0, top: 5.0),
        //       child: Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10.0),
        //           color: tCardBgColor,
        //         ),
        //         padding: const EdgeInsets.symmetric(
        //             vertical: 10.0, horizontal: 10.0),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Flexible(
        //                   child: Text(
        //                     "Flutter Crash Courses",
        //                     style: txtTheme.headlineMedium,
        //                     maxLines: 2,
        //                     overflow: TextOverflow.ellipsis,
        //                   ),
        //                 ),
        //                 Flexible(
        //                   child: Image(
        //                     image: AssetImage(tTopCourseImage1),
        //                     height: 110,
        //                   ),
        //                 )
        //               ],
        //             ),
        //             Row(
        //               children: [
        //                 ElevatedButton(
        //                   style:
        //                       ElevatedButton.styleFrom(shape: CircleBorder()),
        //                   onPressed: () {},
        //                   child: Icon(Icons.play_arrow),
        //                 ),
        //                 SizedBox(width: tDashboardCardPadding),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       "3 Sections",
        //                       style: txtTheme.headlineMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                     Text(
        //                       "Programming Languages",
        //                       style: txtTheme.bodyMedium,
        //                       overflow: TextOverflow.ellipsis,
        //                     ),
        //                   ],
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ],
      ),
    );
  }
}
