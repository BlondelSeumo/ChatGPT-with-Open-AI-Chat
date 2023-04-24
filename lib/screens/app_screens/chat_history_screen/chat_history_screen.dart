import 'dart:developer';

import '../../../config.dart';
import 'layouts/chat_history_app_bar.dart';
import 'layouts/chat_layout.dart';

class ChatHistoryScreen extends StatelessWidget {
  final chatHistoryCtrl = Get.put(ChatHistoryController());

  ChatHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatHistoryController>(builder: (_) {
      return Scaffold(
          backgroundColor: appCtrl.appTheme.bg1,
          appBar:  ChatHistoryAppBar(index: chatHistoryCtrl.selectedIndex,onDeleteTap: () {

            /*chatHistoryCtrl.selectedIndex.asMap().entries.forEach((e) {
              chatHistoryCtrl.chatHistoryLists.removeAt(e.key);
              chatHistoryCtrl.update();
            });
            chatHistoryCtrl.chatHistoryLists.asMap().entries.forEach((e) {
              chatHistoryCtrl.selectedIndex.removeWhere((element) => element != e.value);
              chatHistoryCtrl.update();
            });*/

          }),
          body: SingleChildScrollView(
            child: Column(children: [
              ...chatHistoryCtrl.chatHistoryLists
                  .asMap()
                  .entries
                  .map((e) => ChatHistoryLayout(data: e.value,index: e.key,isLongPress: chatHistoryCtrl.isLongPress,onLongPressTap: () {
                    chatHistoryCtrl.isLongPress = true;
                    log("press: ${chatHistoryCtrl.isLongPress}");
                    log("index: ${!chatHistoryCtrl.selectedIndex.contains(e.key)}");
                    if (!chatHistoryCtrl.selectedIndex.contains(e.key)) {
                      chatHistoryCtrl.selectedIndex.add(e.key);
                      log("index2: ${chatHistoryCtrl.selectedIndex}");
                      chatHistoryCtrl.update();
                    }
                    chatHistoryCtrl.update();
              },onTap: () {
                    log("message");
                if (chatHistoryCtrl.isLongPress) {
                  if (!chatHistoryCtrl.selectedIndex.contains(e.key)) {
                    chatHistoryCtrl.selectedIndex.add(e.key);
                    chatHistoryCtrl.update();
                  }else{
                    if (chatHistoryCtrl.selectedIndex.contains(e.key)) {
                      chatHistoryCtrl.selectedIndex.remove(e.key);
                      chatHistoryCtrl.update();
                    }
                  }
                }
                if(chatHistoryCtrl.selectedIndex.isEmpty) {
                  chatHistoryCtrl.isLongPress == false;
                  chatHistoryCtrl.update();
                }
              },))
                  .toList()
            ]).paddingSymmetric(vertical: Insets.i25, horizontal: Insets.i20),
          ));
    });
  }
}
