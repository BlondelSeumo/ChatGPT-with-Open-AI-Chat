
import 'package:intl/intl.dart';

import '../../../../config.dart';

class Sender extends StatelessWidget {
  final ChatMessage? chatListModel;
  final int? dateWiseIndex, index;

  const Sender({Key? key, this.chatListModel, this.index, this.dateWiseIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatLayoutController>(builder: (chatCtrl) {
      return Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              chatListModel!.text!.length > 40
                  ? SenderWidthText(text: chatListModel!.text!,index: index,time: Text(
                DateFormat('hh:mm a').format(
                    DateTime.fromMillisecondsSinceEpoch(
                        int.parse(chatListModel!.time!.toString()))),
                style:
                AppCss.outfitMedium12.textColor(appCtrl.appTheme.sameWhite),
              ),)
                  : CommonContent(text: chatListModel!.text!,index: index,time: Text(
                DateFormat('hh:mm a').format(
                    DateTime.fromMillisecondsSinceEpoch(
                        int.parse(chatListModel!.time!.toString()))),
                style:
                AppCss.outfitMedium12.textColor(appCtrl.appTheme.sameWhite),
              )),
              const VSpace(Sizes.s3),

            ],
          ).marginSymmetric(horizontal: Insets.i20, vertical: Insets.i5)).onLongPressTap(onLongPress: () {

        chatCtrl.isLongPress = true;
        if (!chatCtrl.selectedIndex.contains(index)) {
          chatCtrl.selectedIndex.add(index);
          chatCtrl.selectedData.add(chatCtrl.selectedMessages[index!]);
          chatCtrl.update();
        }
      });
    });
  }
}
