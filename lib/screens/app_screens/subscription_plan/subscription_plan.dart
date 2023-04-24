import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../config.dart';

class SubscriptionPlan extends StatelessWidget {
  const SubscriptionPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appCtrl.appTheme.bg1,
        appBar: AppAppBarCommon(
            title: appFonts.subscriptionPlan,
            actionIcon: eSvgAssets.currency,
            leadingOnTap: () => Get.back()),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("userSubscribe")
                .where("email", isEqualTo: appCtrl.storage.read("userName"))
                .limit(1)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                log("DATA : ${snapshot.data!.docs[0].data()}");
                return StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("subscriptionPlan")
                        .where("type",
                            isEqualTo: snapshot.data!.docs[0]
                                ["subscriptionType"])
                        .limit(1)
                        .snapshots(),
                    builder: (context, snapshotData) {
                      if (snapshotData.hasData) {
                        SubscribeModel subscribeModel = SubscribeModel.fromJson(
                            snapshotData.data!.docs[0].data());
                        log("COUNT : ${appCtrl.envConfig}");
                        log("COUNT 1: ${(int.parse(snapshot.data!.docs[0]["imageCount"]))}");
                        return Column(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonSubscribeTitle(
                                    subscribeModel: subscribeModel),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CommonCircularIndicator(
                                          percent: double.parse((int.parse(snapshot.data!.docs[0]["chatCount"]) /int.parse(appCtrl.envConfig["chatTextCount"].toString()) /100).toStringAsFixed(2)),
                                          title: "${snapshot.data!.docs[0]["chatCount"]} chat\nremaining"),
                                       CommonCircularIndicator(
                                          percent: double.parse((int.parse(snapshot.data!.docs[0]["imageCount"]) /int.parse(appCtrl.envConfig["imageCount"].toString()) /100).toStringAsFixed(2)),
                                          title: "${snapshot.data!.docs[0]["imageCount"]} images\nremaining"),
                                       CommonCircularIndicator(
                                          percent: (int.parse(snapshot.data!.docs[0]["textCompletionCount"]) /int.parse(appCtrl.envConfig["textCompletionCount"].toString())),
                                          title: "${snapshot.data!.docs[0]["textCompletionCount"]} topics\nremaining")
                                    ]).marginSymmetric(
                                    horizontal: Insets.i20,
                                    vertical: Insets.i20),
                                SubscriptionPlanCommonWidget().dottedLine(),
                                SubscriptionPlanCommonWidget()
                                    .noOfDaysLeftText("three"),
                                ButtonCommon(
                                    onTap: () {},
                                    title: appFonts.renewNow.tr,
                                    margin: Insets.i15,
                                    isGradient: false,
                                    style: AppCss.outfitMedium16
                                        .textColor(appCtrl.appTheme.primary),
                                    color: appCtrl.appTheme.trans,
                                    borderColor: appCtrl.appTheme.primary),
                                const VSpace(Sizes.s15)
                              ],
                            ).subscribeExtension().marginOnly(
                                top: Insets.i25, bottom: Insets.i15),
                            SubscriptionPlanCommonWidget().noteTextWidget()
                          ],
                        ).marginSymmetric(horizontal: Insets.i20);
                      } else {
                        return Container();
                      }
                    });
              } else {
                return Container();
              }
            }));
  }
}
