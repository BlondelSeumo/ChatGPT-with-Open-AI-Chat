
import 'package:intl/intl.dart';

import '../../../../config.dart';

class ChatCommonWidget{

  //social layout
  Widget socialLayout(image,text)=> Column(
    children: [
      SvgPicture.asset(image,height: Sizes.s60,),
      const VSpace(Sizes.s8),
      Text(text,
          style: AppCss.outfitMedium14
              .textColor(appCtrl.appTheme.txt)
              .textDecoration(TextDecoration.none))
    ],
  );

  //time text layout
  Widget timeTextLayout(time) => Text(
      DateFormat('hh:mm a').format(
          DateTime.fromMillisecondsSinceEpoch(int.parse(
              time))),
      style: AppCss.outfitMedium12
          .textColor(appCtrl.appTheme.lightText));

  //user image
  Widget userImage(image) => Container(
      margin: const EdgeInsets.only(top: Insets.i5),
      height: Sizes.s40,
      width: Sizes.s40,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(image))));

  // common svg icon
  Widget commonSvgIcon(icon,{GestureTapCallback? onTap}) =>  SvgPicture.asset(
    icon,
    colorFilter:
    ColorFilter.mode(appCtrl.appTheme.sameWhite, BlendMode.srcIn),
  ).inkWell(onTap: onTap);
}