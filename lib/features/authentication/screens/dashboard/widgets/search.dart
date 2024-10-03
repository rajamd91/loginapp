import 'package:flutter/material.dart';

// import '../../../../../constants/text_strings.dart';
import '../../../../../../utils/constants/text_strings.dart';
//import '../../../../../utils/constants/text_strings.dart';

class DashboardSearchBox extends StatelessWidget {
  const DashboardSearchBox({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(width: 4.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tDashboardSearch,
            style: txtTheme.displayMedium
                ?.apply(color: Colors.grey.withOpacity(0.5)),
          ),
          const Icon(
            Icons.mic,
            size: 25.0,
          )
        ],
      ),
    );
  }
}
