import 'package:vibration/vibration.dart';

import '../../../../config.dart';

class ChatLayoutTextBox extends StatelessWidget {
  const ChatLayoutTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatLayoutController>(builder: (chatCtrl) {
      return TextFieldCommon(
        controller: chatCtrl.chatController,
        hintText: appFonts.typeHere.tr,
        focusNode: chatCtrl.focusNode,
        fillColor:
            appCtrl.isTheme ? appCtrl.appTheme.bg : appCtrl.appTheme.white,
        minLines: 1,
        prefixIcon: SvgPicture.asset(eSvgAssets.smile)
            .paddingOnly(left: Insets.i18, right: Insets.i10),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () async {
                  Vibration.vibrate(duration: 200);
                  chatCtrl.speechToText();
                },
                child: SvgPicture.asset(
                  eSvgAssets.mic,
                  height: chatCtrl.isListening.value
                      ? chatCtrl.animation!.value
                      : Sizes.s22,
                  colorFilter: ColorFilter.mode(
                      chatCtrl.isListening.value
                          ? appCtrl.appTheme.primary
                          : appCtrl.appTheme.lightText,
                      BlendMode.srcIn),
                )),
            const HSpace(Sizes.s12),
            SvgPicture.asset(eSvgAssets.send)
                .paddingAll(Insets.i6)
                .decorated(
                    color: appCtrl.appTheme.primary,
                    borderRadius: BorderRadius.circular(AppRadius.r6))
                .inkWell(
                    onTap: () => chatCtrl.chatController.text.isNotEmpty
                        ? chatCtrl.processChat()
                        : Get.snackbar(appFonts.attention.tr, appFonts.enterTextBoxValue.tr)),
            const HSpace(Sizes.s8),
          ],
        ),
      ).paddingOnly(bottom: Insets.i20, left: Insets.i20, right: Insets.i20);
    });
  }
}
