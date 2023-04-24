class FirebaseConfigModel {
  String? bannerAddId;
  String? bannerIOSId,
      rewardAndroidId,
      rewardIOSId,
      razorPayKey,
      razorPaySecret;
  String? chatGPTKey;
  String? interstitialAdIdAndroid;
  String? interstitialAdIdIOS;
  String? payPalClientId;
  String? payPalSecret;
  String? stripeKey;
  String? stripePublishKey;
  bool? isChatShow;
  bool? isImageGeneratorShow;
  bool? isTextCompletionShow;
  bool? isAddShow, isRazorPay, isStripe, isPaypal, isChatHistory;

  FirebaseConfigModel(
      {this.bannerAddId,
      this.bannerIOSId,
      this.chatGPTKey,
      this.interstitialAdIdAndroid,
      this.interstitialAdIdIOS,
      this.payPalClientId,
      this.payPalSecret,
      this.stripeKey,
      this.stripePublishKey,
      this.isChatShow,
      this.isImageGeneratorShow,
      this.rewardAndroidId,
      this.rewardIOSId,
      this.razorPayKey,
      this.razorPaySecret,
      this.isTextCompletionShow,
      this.isAddShow,
      this.isPaypal,
      this.isRazorPay,
      this.isStripe,
      this.isChatHistory});

  FirebaseConfigModel.fromJson(Map<String, dynamic> json) {
    bannerAddId = json['bannerAddId'] ?? "";
    bannerIOSId = json['bannerIOSId'] ?? "";
    rewardAndroidId = json['rewardAndroidId'] ?? "true";
    rewardIOSId = json['rewardIOSId'] ?? "";
    chatGPTKey = json['chatGPTKey'];
    interstitialAdIdAndroid = json['interstitialAdIdAndroid'] ?? "";
    interstitialAdIdIOS = json['interstitialAdIdIOS'] ?? "";
    payPalClientId = json['payPalClientId'] ?? "";
    payPalSecret = json['payPalSecret'] ?? "";
    stripeKey = json['stripeKey'] ?? "";
    stripePublishKey = json['stripePublishKey'] ?? "";
    isChatShow = json['isChatShow'] ?? true;
    isImageGeneratorShow = json['isImageGeneratorShow'] ?? true;
    isTextCompletionShow = json['isTextCompletionShow'] ?? true;
    isChatHistory = json['isChatHistory'] ?? true;
    isAddShow = json['isAddShow'] ?? true;
    isRazorPay = json['isRazorPay'] ?? true;
    isPaypal = json['isPayPal'] ?? true;
    isStripe = json['isStripe'] ?? true;
    razorPayKey = json['razorPayKey'] ?? "";
    razorPaySecret = json['razorPaySecret'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bannerAddId'] = bannerAddId;
    data['bannerIOSId'] = bannerIOSId;
    data['chatGPTKey'] = chatGPTKey;
    data['interstitialAdIdAndroid'] = interstitialAdIdAndroid;
    data['interstitialAdIdIOS'] = interstitialAdIdIOS;
    data['payPalClientId'] = payPalClientId;
    data['payPalSecret'] = payPalSecret;
    data['stripeKey'] = stripeKey;
    data['stripePublishKey'] = stripePublishKey;
    data['isChatShow'] = isChatShow;
    data['isImageGeneratorShow'] = isImageGeneratorShow;
    data['isTextCompletionShow'] = isTextCompletionShow;
    data['isAddShow'] = isAddShow;
    data['isStripe'] = isStripe;
    data['isPayPal'] = isPaypal;
    data['isRazorPay'] = isRazorPay;
    data['rewardIOSId'] = rewardIOSId;
    data['rewardAndroidId'] = rewardAndroidId;
    data['razorPayKey'] = razorPayKey;
    data['razorPaySecret'] = razorPaySecret;
    data['isChatHistory'] = isChatHistory;
    return data;
  }
}
