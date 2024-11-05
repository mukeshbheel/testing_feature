import 'package:flutter/material.dart';
import 'package:testing/features/flutter_design_patterns/factory_method_DP/platform_loader.dart';

import '../factory_method_DP/platform_button.dart';


abstract interface class AbstructFactoryDPPlatform {
  Widget buildButton(BuildContext context, VoidCallback onPressed, Widget child);
  Widget buildLoader(BuildContext context);
}

class AbstructFactoryDpPlatformImpl implements AbstructFactoryDPPlatform{
  @override
  Widget buildButton(BuildContext context, VoidCallback onPressed, Widget child) {
    return PlatformButton(Theme.of(context).platform).build(onPressed, child);
  }

  @override
  Widget buildLoader(BuildContext context) {
    return PlatformLoader(Theme.of(context).platform).build();
  }
}