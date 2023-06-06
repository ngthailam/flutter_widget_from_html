part of '../core_ops.dart';

const kTagFont = 'font';
const kAttributeFontColor = 'color';
const kAttributeFontFace = 'face';
const kAttributeFontSize = 'size';

extension TagFont on WidgetFactory {
  BuildOp get tagFont => const BuildOp.v1(
        debugLabel: kTagFont,
        defaultStyles: _defaultStyles,
        priority: Priority.tagFont,
      );

  static StylesMap _defaultStyles(BuildTree tree) {
    final attrs = tree.element.attributes;
    final color = attrs[kAttributeFontColor];
    final fontFace = attrs[kAttributeFontFace];
    final fontSize = kCssFontSizes[attrs[kAttributeFontSize] ?? ''];
    return {
      if (color != null) kCssColor: color,
      if (fontFace != null) kCssFontFamily: fontFace,
      if (fontSize != null) kCssFontSize: fontSize,
    };
  }
}
