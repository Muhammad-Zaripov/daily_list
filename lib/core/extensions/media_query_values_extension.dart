import 'package:flutter/widgets.dart';

extension MediaQueryValues on BuildContext {
  double w(double fraction) => MediaQuery.of(this).size.width * fraction;
  double h(double fraction) => MediaQuery.of(this).size.height * fraction;
}
