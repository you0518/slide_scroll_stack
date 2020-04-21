library slide_scroll_stack;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Widget that slides and scrolls to stack.
class SlideScrollStack extends StatelessWidget {
  const SlideScrollStack(
      {this.children = const <Widget>[],
      this.slideDirection = SlideDirection.bottom,
      this.rate = 3 / 4,
      this.initalPage = 0,
      this.reverse = false})
      : isVertical = slideDirection == SlideDirection.top ||
            slideDirection == SlideDirection.bottom;

  final List<Widget> children;

  /// Scrolling to slide the widget from the specified direction to the opposite direction.
  final SlideDirection slideDirection;

  /// is reverse scroll.
  final bool reverse;
  final int initalPage;

  /// The ratio of the size of the main widget to the next widget.
  final double rate;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    final notifier = _SlideCardController(initalPage);
    final query = MediaQuery.of(context).size;
    final size = isVertical ? query.height : query.width;
    final _buildPositioned = _getDirectionBuild(slideDirection);

    return ChangeNotifierProvider.value(
        value: notifier,
        child: Container(
          child: Stack(
            children: <Widget>[
              Stack(
                children: List.generate(
                    children.length,
                    (index) => Selector<_SlideCardController, double>(
                          selector: (context, model) => model.value,
                          shouldRebuild: (prev, next) => index > next - 1,
                          builder: (context, pageOffset, _) =>
                              _buildPositioned(index, pageOffset, size),
                        )),
              ),
              _buildPageView(notifier)
            ],
          ),
        ));
  }

  Widget _buildPageView(_SlideCardController notifier) {
    return PageView.builder(
        reverse: (slideDirection == SlideDirection.top ||
                slideDirection == SlideDirection.right) ^
            reverse,
        scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
        controller: notifier.controller,
        itemCount: children.length,
        itemBuilder: (context, index) => Container());
  }

  Widget Function(int, double, double) _getDirectionBuild(
      SlideDirection direction) {
    switch (direction) {
      case SlideDirection.top:
        return _buildTopPositioned;
      case SlideDirection.bottom:
        return _buildBottomPositioned;
      case SlideDirection.left:
        return _buildLeftPositioned;
      case SlideDirection.right:
        return _buildRightPositioned;
    }
    return _buildTopPositioned;
  }

  Widget _buildBottomPositioned(int index, double pageOffset, double size) {
    final position = _getPosition(index, pageOffset, size);
    return Positioned(
      height: size * rate,
      top: position,
      left: 0,
      right: 0,
      child: children[index],
    );
  }

  Widget _buildTopPositioned(int index, double pageOffset, double size) {
    final position = _getPosition(index, pageOffset, size);
    return Positioned(
      height: size * rate,
      bottom: position,
      left: 0,
      right: 0,
      child: children[index],
    );
  }

  Widget _buildRightPositioned(int index, double pageOffset, double size) {
    final position = _getPosition(index, pageOffset, size);
    return Positioned(
      width: size * rate,
      right: position,
      top: 0,
      bottom: 0,
      child: children[index],
    );
  }

  Widget _buildLeftPositioned(int index, double pageOffset, double size) {
    final position = _getPosition(index, pageOffset, size);
    return Positioned(
      width: size * rate,
      left: position,
      top: 0,
      bottom: 0,
      child: children[index],
    );
  }

  /// Getting the drawing position of Widget for the offset of PageView.
  double _getPosition(int index, double pageOffset, double size) =>
      pageOffset > index ? 0.0 : (index - pageOffset) * (size * rate);
}

enum SlideDirection { right, left, top, bottom }

class _SlideCardController extends ValueNotifier<double> {
  _SlideCardController(int initialPage)
      : controller = PageController(initialPage: initialPage),
        super(initialPage.toDouble()) {
    controller.addListener(() {
      value = controller.page;
    });
  }

  final PageController controller;
}
