import 'package:flutter_switch/flutter_switch.dart';

import '../../../../config.dart';

class CommonSwitcher extends StatelessWidget {
  final int? index;

  const CommonSwitcher({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
        padding: 4,
        height: Sizes.s20,
        toggleSize: 12,
        inactiveColor: appCtrl.appTheme.txt.withOpacity(.1),
        width: Sizes.s32,
        value: appCtrl.isRTL,
        onToggle: (val) {
          appCtrl.isRTL = !appCtrl.isRTL;
          appCtrl.update();
          Get.forceAppUpdate();
        });
  }
}
