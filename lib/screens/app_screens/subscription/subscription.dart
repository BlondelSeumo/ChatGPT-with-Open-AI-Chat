import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../config.dart';

class Subscription extends StatelessWidget {
  final subscribeCtrl = Get.put(SubscriptionController());

  Subscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(builder: (_) {
      return Scaffold(
          backgroundColor: appCtrl.appTheme.bg1,
          appBar: AppAppBarCommon(
            title: appFonts.subscriptionPlan,
            actionIcon: eSvgAssets.currency,
            isAction: true,
            leadingOnTap: () => Get.back(),
            actionOnTap: () => subscribeCtrl.currencyListDialog(),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("subscriptionPlan")
                        .orderBy("price", descending: false)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Container();
                      } else if (!snapshot.hasData) {
                        return Center(
                            child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              appCtrl.appTheme.primary),
                        )).height(MediaQuery.of(context).size.height);
                      } else {
                        log("has : ${snapshot.data!.docs}");
                        return Column(children: [
                          ...snapshot.data!.docs.asMap().entries.map((e) {
                            SubscribeModel subscribe =
                                SubscribeModel.fromJson(e.value.data());

                            return SubscriptionList(
                                    subscribeModel: subscribe,
                                    onTap: () => subscribeCtrl.paymentDialog(
                                        subscribe.price.toString(),subscribe))
                                .subscribeExtension()
                                .marginOnly(bottom: Insets.i20)
                                .inkWell(onTap: () {});
                          }).toList()
                        ]);
                      }
                    })
              ],
            ).marginSymmetric(vertical: Insets.i25, horizontal: Insets.i20),
          ));
    });
  }
}
