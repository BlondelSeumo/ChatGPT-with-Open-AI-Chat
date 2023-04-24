
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../config.dart';

class SettingController extends GetxController {
  List drawerList = [];
  List settingList = [];
  String? name, userName, firebaseUser;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onReady() {
    // TODO: implement onReady

    drawerList = appArray.drawerList;
    settingList = appArray.settingList;

    userName = appCtrl.storage.read("userName");
    update();

    super.onReady();
  }

  //on option tap function
  onOptionTap(index) {
    final dashboardCtrl = Get.find<DashboardController>();
    if (index == 0) {
      dashboardCtrl.onBottomTap(1);
    } else if (index == 1) {
      dashboardCtrl.onBottomTap(2);
    } else {
      dashboardCtrl.onBottomTap(3);
    }
    dashboardCtrl.update();
  }

  onSettingTap(data) async {
    if (data['title'] == "myAccount") {
      if(appCtrl.isGuestLogin){
        Get.offAllNamed(routeName.signInScreen);
      }else {
        Get.toNamed(routeName.myAccountScreen);
      }
    } else if (data['title'] == "notification") {
      Get.toNamed(routeName.notificationScreen);
    } else if (data['title'] == "fingerprintLock") {
      Get.toNamed(routeName.fingerprintAndLockSecurity);
    } else if (data['title'] == "privacyTerm") {
      Get.toNamed(routeName.privacyPolicyScreen);
    } else if (data['title'] == "language") {
      Get.toNamed(routeName.selectLanguageScreen, arguments: true);
    } else if (data['title'] == "selectCharacter") {
      Get.toNamed(routeName.selectCharacterScreen, arguments: true);
    } else if (data['title'] == "subscriptionPlan") {
      if(appCtrl.isGuestLogin){
        Get.offAllNamed(routeName.signInScreen);
      }else {
        FirebaseFirestore.instance
            .collection("userSubscribe")
            .where("email", isEqualTo: appCtrl.storage.read("userName"))
            .limit(1)
            .get()
            .then((value) {
          if (value.docs.isNotEmpty) {
            Get.toNamed(routeName.subscriptionPlan);
          } else {
            Get.toNamed(routeName.subscriptionPlanList);
          }
        });
      }
    } else if (data['title'] == "logout") {
      FirebaseAuth.instance.signOut();
      appCtrl.storage.erase();
      appCtrl.storage.remove(session.envConfig);
      appCtrl.storage.remove(session.isGuestLogin);
      appCtrl.update();
      Get.forceAppUpdate();
      Get.offAllNamed(routeName.signInScreen);
    }
    appCtrl.update();
  }
}
