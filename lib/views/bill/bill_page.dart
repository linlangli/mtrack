import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mtrack/common/extension/widget_extension.dart';
import 'package:mtrack/common/util/log_util.dart';
import 'package:mtrack/constants/app_string.dart';
import 'package:mtrack/constants/theme_font.dart';
import 'package:mtrack/controllers/bill/bill_controller.dart';
import 'package:mtrack/models/bill_model.dart';

class BillPage extends GetView<BillController> {
  BillPage({super.key}) {
    controller.loadBillList();
  }

  @override
  final BillController controller = Get.put(BillController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillController>(builder: (controller) {
      LogUtil.log('BillPage', 'GetBuilder build');
      List<BillPerDay> billPerDayList = controller.bill?.billPerDayList ?? [];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _introWidget(),
          ),
          const SizedBox(height: 32),
          ListView.builder(
              shrinkWrap: true,
              itemCount: billPerDayList.length,
              itemBuilder: (BuildContext context, int index) {
                return _perDayContentWidget(billPerDayList[index]);
              })
        ],
      );
    });
  }

  Widget _introWidget() {
    final bill = controller.bill;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'assets/bill_page_time.svg',
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 6),
            Text(
              '2023年12月',
              style: ThemeFont.warmPrimary(),
            ),
          ],
        ),
        const Text(' | '),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'assets/bill_page_money.svg',
              height: 24,
              width: 24,
            ),
            _introItemWidget(
              AppString.billPageIncome,
              bill?.income,
            ),
            _introItemWidget(
              AppString.billPageExpenditure,
              bill?.expenses,
            ),
            _introItemWidget(
              AppString.billPageBalance,
              bill?.balance,
            ),
          ],
        )
      ],
    );
  }

  Widget _introItemWidget(String key, double? value) {
    return Row(
      children: [
        const SizedBox(width: 18),
        Text(
          key,
          style: ThemeFont.bodySecondary(),
        ),
        const SizedBox(width: 6),
        Text(
          value?.toString() ?? '',
          style: ThemeFont.warmPrimary(),
        ).translate(0, 1.5)
      ],
    );
  }

  Widget _perDayContentWidget(BillPerDay billPerDay) {
    List<Widget> billItemWidget = [];
    for (var billItem in billPerDay.billItemList) {
      billItemWidget.add(_perDayItemWidget(billItem));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(billPerDay.date, style: ThemeFont.labelSecondary()),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: billItemWidget,
          )),
        const SizedBox(height: 12)
      ],
    );
  }

  Widget _perDayItemWidget(BillItem billItem) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                child: const Icon(size: 24, Icons.accessibility),
                onTap: () {},
              ),
              const SizedBox(width: 18),
              Text(billItem.name, style: ThemeFont.bodyPrimary())
            ],
          ),
          Text('${billItem.money}', style: ThemeFont.warmPrimary()),
        ],
      ),
    );
  }
}
