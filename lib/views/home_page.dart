import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mtrack/common/widgets/page_widget.dart';
import 'package:mtrack/constants/app_string.dart';
import 'package:mtrack/views/bar_widget.dart';
import 'package:mtrack/views/bill/bill_page.dart';
import 'package:mtrack/views/chart/chart_page.dart';
import 'package:mtrack/views/user/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NavigationIndex navigationIndexSelected = NavigationIndex.bill;

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (navigationIndexSelected) {
      case NavigationIndex.bill:
        child = BillPage();
        break;
      case NavigationIndex.property:
        child = const ChartPage();
        break;
      case NavigationIndex.mine:
        child = const UserPage();
        break;
    }
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomRight,
      children: [
        PageWidget(
          child: Stack(
            children: [
              navigationIndexSelected == NavigationIndex.bill ? Positioned(
                right: 32,
                bottom: 100,
                child: SvgPicture.asset(
                  'assets/app_logo.svg',
                  height: 120,
                  width: 120,
                ),
              ) : const SizedBox(),
              Column(
                children: [
                  BarWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: child,
                  ),
                  const Spacer(),
                  _renderNavigationWidget(),
                  const SizedBox(
                    height: 12,
                  )
                ],
              ),
            ],
          )
        ),
      ],
    );
  }

  Widget _renderNavigationWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _renderNavigationItem(NavigationIndex.bill),
        _renderNavigationItem(NavigationIndex.property),
        _renderNavigationItem(NavigationIndex.mine),
      ],
    );
  }

  Widget _renderNavigationItem(NavigationIndex navigationIndex) {
    String icon = 'assets/navigation_bill.svg';
    String iconSelected = 'assets/navigation_bill_selected.svg';
    String name = AppString.navigationBill;
    if (navigationIndex == NavigationIndex.property) {
      icon = 'assets/navigation_chart.svg';
      iconSelected = 'assets/navigation_chart_selected.svg';
    } else if (navigationIndex == NavigationIndex.mine) {
      icon = 'assets/navigation_mine.svg';
      iconSelected = 'assets/navigation_mine_selected.svg';
    }
    bool isSelected = navigationIndex == navigationIndexSelected;
    return GestureDetector(
        onTap: () {
          setState(() {
            navigationIndexSelected = navigationIndex;
          });
        },
        child: SizedBox(
          width: 40,
          child: SvgPicture.asset(
            isSelected ? iconSelected : icon,
            width: isSelected ? 32 : 28,
            height: isSelected ? 32 : 28,
          ),
        ));
  }
}

enum NavigationIndex { bill, property, mine }
