import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:probot/config.dart';

class ChatLayout extends StatelessWidget {
  final chatCtrl = Get.put(ChatLayoutController());

  ChatLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("image: ${chatCtrl.selectedImage}");
    return GetBuilder<ChatLayoutController>(builder: (_) {
      return DirectionalityRtl(
        child: WillPopScope(
          onWillPop: () async {
            chatCtrl.speechStopMethod();
            chatCtrl.clearData();

            return true;
          },
          child: Scaffold(
              key: chatCtrl.scaffoldKey,
              drawer: const CommonDrawer(),
              backgroundColor: appCtrl.appTheme.bg1,
              appBar: const ChatScreenAppBar(),
              body: InkWell(
                onTap: () {
                  chatCtrl.isLongPress = false;
                  chatCtrl.selectedData = [];
                  chatCtrl.selectedIndex = [];

                  chatCtrl.update();
                },
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child:  Column(
                          children: [
                            Text("Today, ${DateFormat("hh:mm a").format(DateTime.now())}",
                                    style: AppCss.outfitMedium14
                                        .textColor(appCtrl.appTheme.txt))
                                .marginOnly(top: Insets.i15),
                            const VSpace(Sizes.s13),
                            const Expanded(flex: 5, child: ChatList()),
                            Container(),
                            const Expanded(flex: 0, child: ChatTextBox()),
                          ],
                        ).backgroundImage(DecorationImage(
                          image: AssetImage(appCtrl.isTheme ? chatCtrl.selectedImage["darkImage"] : chatCtrl.selectedImage["image"]),
                          fit: BoxFit.fill)),
                ),
              )),
        ),
      );
    });
  }
}
