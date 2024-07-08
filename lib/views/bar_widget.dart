import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mtrack/constants/app_string.dart';
import 'package:mtrack/constants/theme_font.dart';
import 'package:mtrack/views/bill/bookkeeping_modal.dart';


class BarWidget extends StatefulWidget {
  BarWidget(
      {super.key,
      this.title = AppString.appName,
      this.leftWidgets,
      this.rightWidgets,
      this.padding});

  final String title;
  final List<Widget>? leftWidgets;
  final List<Widget>? rightWidgets;
  final EdgeInsetsGeometry? padding;

  @override
  State<StatefulWidget> createState() => _BarWidgetState();
}

class BarWidgetButton {
  BarWidgetButton(this.image, this.onClick);

  final String image;
  final Function onClick;
}

class _BarWidgetState extends State<BarWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ??
        const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Row(
        children: [
          GestureDetector(
            child: SvgPicture.asset(
              'assets/bar_widget_robot.svg',
              width: 24,
              height: 24
            ),
          ),
          const Spacer(),
          Text(
            widget.title,
            style: ThemeFont.titlePrimary(),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              showBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return BookkeepingModal();
                },
              );
            },
            child: SvgPicture.asset(
              'assets/bar_widget_add.svg',
              width: 24,
              height: 24
            ),
          ),
        ],
      ),
    );
  }
}
