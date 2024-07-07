import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mtrack/common/extension/widget_extension.dart';
import 'package:mtrack/common/utils/device_util.dart';
import 'package:mtrack/common/utils/log_util.dart';
import 'package:mtrack/common/utils/ui_util.dart';
import 'package:mtrack/constants/app_string.dart';
import 'package:mtrack/constants/theme_color.dart';
import 'package:mtrack/constants/theme_font.dart';
import 'package:mtrack/controllers/bill/bill_controller.dart';

class BookkeepingModal extends GetView<BillController>{
  BookkeepingModal({super.key});

  @override
  BillController controller = Get.find<BillController>();

  Widget topWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
            'assets/bookkeeping_modal_setting.svg',
            height: 24, width: 24
        ).button(
          onTap: () {
            LogUtil.log('tag', 'message');
          },
          padding: 6
        ),
        GetBuilder<BillController>(builder: (controller) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                controller.bookkeepingType == BookkeepingType.income ? '+' : '-',
                style: ThemeFont.titlePrimary(fontSize: 24),
              ),
              const SizedBox(width: 6),
              Text(
                controller.money,
                style: ThemeFont.titlePrimary(fontSize: 24),
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/bookkeeping_modal_date.svg',
                    height: 14, width: 14
                  ),
                  const SizedBox(width: 2),
                  Text(
                    controller.date,
                    style: ThemeFont.warmPrimary(),
                  ),
                ],
              ).button(onTap: () {
                // todo
              }).paddingOnly(bottom: 6)
            ],
          );
        }, id: AppString.bookkeepingModalGetBuilderId),
        SvgPicture.asset(
          'assets/bookkeeping_modal_confirm.svg',
          height: 28,
          width: 28,
        ).button(onTap: () {
          controller.bookkeeping();
          Navigator.pop(context);
        }),
      ],
    ).paddingOnly(left: 18, right: 18, top: 10);
  }

  Widget introWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(width: 12),
        SvgPicture.asset(
            'assets/bookkeeping_modal_intro.svg',
            height: 24, width: 24
        ),
        const SizedBox(width: 12),
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: DeviceUtil.deviceWidthScale(context, 0.8),
              child: TextFormField(
                enabled: true,
                style: ThemeFont.bodyPrimary(),
                decoration: InputDecoration(
                  hintText: AppString.bookkeepingModalIntro,
                  border: InputBorder.none,
                  isCollapsed: true,
                  hintStyle: ThemeFont.bodySecondary(),
                  contentPadding: const EdgeInsets.only(left: 6, bottom: 2)
                ),
                onEditingComplete: () {},
              ),
            ),
            // Text('data'),
            Container(
              height: 1,
              width: DeviceUtil.deviceWidthScale(context, 0.8),
              decoration: const BoxDecoration(color: Colors.black),
            ),
          ],
        )
      ],
    );
  }

  Widget itemWidget(String text) {
    return Container(
      alignment: Alignment.center,
      width: 54,
      height: 54,
      child: (text != '' ? Text(text, style: ThemeFont.titleSecondary()) : SvgPicture.asset(
          'assets/bookkeeping_modal_back.svg',
          height: 24, width: 24
      )
    )).button(onTap: () {
      if (text == '') {
        controller.setMoneyType(BookkeepingType.expenses);
        controller.setMoney('0.0');
      }
      controller.setMoney('${controller.money}$text');
    });
  }

  Widget numberWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(flex: 1,child: itemWidget('1'),),
              Flexible(flex: 1,child: itemWidget('2'),),
              Flexible(flex: 1,child: itemWidget('3'),),
            ],
          ),),
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(flex: 1,child: itemWidget('4'),),
              Flexible(flex: 1,child: itemWidget('5'),),
              Flexible(flex: 1,child: itemWidget('6'),),
            ],
          ),),
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(flex: 1,child: itemWidget('7'),),
              Flexible(flex: 1,child: itemWidget('8'),),
              Flexible(flex: 1,child: itemWidget('9'),),
            ],
          ),),
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(flex: 1,child: itemWidget('.'),),
              Flexible(flex: 1,child: itemWidget('0'),),
              Flexible(flex: 1,child: itemWidget(''),),
            ],
          ),),
      ],
    );
  }

  Widget functionWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GetBuilder<BillController>(builder: (controller) {
          return SvgPicture.asset(
            controller.bookkeepingType == BookkeepingType.expenses ? 'assets/bookkeeping_modal_expenses.svg' : 'assets/bookkeeping_modal_income.svg',
            height: 28,
            width: 28,
          ).button(onTap: () {
            controller.bookkeepingType == BookkeepingType.expenses ? controller.setMoneyType(BookkeepingType.income) : controller.setMoneyType(BookkeepingType.expenses);
          });
        }, id: AppString.bookkeepingModalGetBuilderId),
        SvgPicture.asset(
            'assets/bookkeeping_modal_reset.svg',
            height: 24, width: 24
        ).button(onTap: () {
          controller.setMoneyType(BookkeepingType.expenses);
          controller.setMoney('0.0');
        }),
        SvgPicture.asset(
          'assets/bookkeeping_modal_tag.svg',
          height: 28,
          width: 28,
        ).button(onTap: () {
          Navigator.pop(context);
        }),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(borderRadius: UiUtil.radius(12), color: Colors.amber),
        ).button(onTap: () {})
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      height: 380,
      decoration: const BoxDecoration(
          color: ThemeColor.secondary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(flex: 2,child: topWidget(context)),
          Flexible(flex: 10,child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(flex: 2, child: functionWidget(context)),
              Flexible(flex: 6, child: numberWidget()),
            ],
          )),
          Flexible(flex: 1,child: introWidget(context),),
        ],
      ),
    );
  }
}