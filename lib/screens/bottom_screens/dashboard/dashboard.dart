import '../../../config.dart';
import 'layouts/tab_common.dart';

class Dashboard extends StatelessWidget {
  final dashboardCtrl = Get.put(DashboardController());

  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (_) {
      return DirectionalityRtl(
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            backgroundColor: appCtrl.appTheme.bg1,
            body: dashboardCtrl.widgetOptions
                .elementAt(dashboardCtrl.selectedIndex),
            bottomNavigationBar: Container(
              height: Sizes.s50,
              decoration: BoxDecoration(
                  color: appCtrl.appTheme.boxBg,
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(53, 193, 255, 0.08),
                        blurRadius: 20,
                        offset: Offset(4, -1))
                  ],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.r10),
                      topRight: Radius.circular(AppRadius.r10))),
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TabCommon(
                      title: "home",
                      sImage: eSvgAssets.homeColor,
                      usImage: eSvgAssets.home,
                      index: 0),
                  if (appCtrl.firebaseConfigModel!.isChatShow!)
                    TabCommon(
                        title: "chat",
                        sImage: eSvgAssets.chatColor,
                        usImage: eSvgAssets.chat,
                        index: 1),
                  if (appCtrl.firebaseConfigModel!.isImageGeneratorShow!)
                    TabCommon(
                        title: "image",
                        sImage: eSvgAssets.galleryColor,
                        usImage: eSvgAssets.gallery,
                        index: 2),
                  if (appCtrl.firebaseConfigModel!.isTextCompletionShow!)
                    TabCommon(
                        title: "content",
                        sImage: eSvgAssets.contentColor,
                        usImage: eSvgAssets.content,
                        index: 3),
                  TabCommon(
                      title: "setting",
                      sImage: eSvgAssets.settingColor,
                      usImage: eSvgAssets.setting,
                      index: 4)
                ]
              )
            )/*dashboardCtrl.bottomList.isNotEmpty
                ? const BottomNavBarLayout()
                : Container()*/
          )
        )
      );
    });
  }
}
