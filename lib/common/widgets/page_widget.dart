import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum PageState {
  loading,
  content,
  error,
  empty
}

class PageWidget extends StatelessWidget {
  const PageWidget({
    super.key,
    required this.child,
    this.safeArea = true,
    this.pageState = PageState.content,
    this.resizeToAvoidBottomInset = false,
    this.backgroundColor,
    this.padding
  });

  final Widget child;
  final bool safeArea;
  final PageState pageState;
  final bool resizeToAvoidBottomInset;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    Widget content = child;
    String pageStateSvg = '';
    switch (pageState) {
      case PageState.empty:
        pageStateSvg = 'assets/page_state_empty.svg';
        break;
      case PageState.error:
        pageStateSvg = 'assets/page_state_error.svg';
        break;
      case PageState.loading:
        pageStateSvg = 'assets/page_state_empty.svg';
        break;
      case PageState.content:
        break;
    }
    if (pageState != PageState.content) {
      content =
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 120),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  pageStateSvg
                ),
              ],
            )
          ),
        );
    }
    if (padding != null) {
      content = Padding(padding: padding ?? EdgeInsets.zero, child: content);
    }
    Widget widget = Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: content,
    );
    if (safeArea) {
      return SafeArea(
        child: widget
      );
    } else {
      return widget;
    }
  }
}