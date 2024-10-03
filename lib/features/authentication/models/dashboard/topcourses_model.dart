import 'package:flutter/material.dart';

class DashboardTopCoursesModel {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardTopCoursesModel(
      this.title, this.heading, this.subHeading, this.onPress);

  static List<DashboardTopCoursesModel> list = [
    DashboardTopCoursesModel(
        "FLUTTER Crash Courses", "3 Sections", "Programming Languages", null),
    DashboardTopCoursesModel(
        "CSS Crash Courses", "2 Sections", "25 Lessons", null),
    DashboardTopCoursesModel(
        "HTML Crash Courses", "1 Section", "10 Lessons", null),
    DashboardTopCoursesModel(
        "JAVA Crash Courses", "5 Section", "35 Lessons", null),
    DashboardTopCoursesModel(
        "DART Crash Courses", "4 Section", "15 Lessons", null),
  ];
}
