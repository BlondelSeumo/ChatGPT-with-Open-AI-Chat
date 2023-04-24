import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../config.dart';

class ChatScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  const ChatScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatLayoutController>(builder: (chatCtrl) {
      return AppBar(
          toolbarHeight: 70,
          titleSpacing: 0,
          leading: SvgPicture.asset(
            eSvgAssets.leftArrow,
            fit: BoxFit.scaleDown,
            colorFilter:
                ColorFilter.mode(appCtrl.appTheme.sameWhite, BlendMode.srcIn),
          ).inkWell(onTap: () {
            Get.back();
            chatCtrl.clearData();
          }),
          automaticallyImplyLeading: false,
          backgroundColor: appCtrl.appTheme.primary,
          actions: [
            chatCtrl.isLongPress
                ? Row(
                    children: [
                      chatCtrl.selectedIndex.length > 1
                          ? Container()
                          : ChatCommonWidget()
                              .commonSvgIcon(eSvgAssets.rotate)
                              .inkWell(onTap: () {
                              chatCtrl.chatController.text =
                                  chatCtrl.selectedData[0];
                              chatCtrl.processChat();
                            }),
                      const HSpace(Sizes.s17),
                      ChatCommonWidget().commonSvgIcon(eSvgAssets.copy).inkWell(
                          onTap: () {
                        Clipboard.setData(ClipboardData(
                            text: chatCtrl.selectedData.toString()));
                      }),
                      const HSpace(Sizes.s17),
                      ChatCommonWidget()
                          .commonSvgIcon(eSvgAssets.share)
                          .inkWell(onTap: () {
                        Share.share(chatCtrl.selectedData.toString(),
                            subject: "I'm sharing Conversation with PROBOT");
                      }),
                      const HSpace(Sizes.s17),
                    ],
                  )
                : const MoreOption()

          ],
          title: Row(children: [
            Container(
              height: Sizes.s50,
              width: Sizes.s50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(appCtrl.selectedCharacter["image"]))),
            ),
            const HSpace(Sizes.s10),
            Text(appCtrl.selectedCharacter["title"].toString().tr,
                style: AppCss.outfitExtraBold22
                    .textColor(appCtrl.appTheme.sameWhite))
          ]));
    });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
