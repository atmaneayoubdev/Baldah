class Settings {
  String upgradeAmount;
  String facebook;
  String twitter;
  String whatsAppPhone;
  String termsAndConditioins;
  String publicQuistions;
  String privacyPolicy;

  Settings({
    required this.upgradeAmount,
    required this.facebook,
    required this.twitter,
    required this.whatsAppPhone,
    required this.termsAndConditioins,
    required this.publicQuistions,
    required this.privacyPolicy,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        upgradeAmount: json["upgrade_amount"].toString(),
        facebook: json["facebook"].toString(),
        twitter: json["twitter"].toString(),
        whatsAppPhone: json["whatsApp_phone"].toString(),
        termsAndConditioins: json["terms_and_conditions"].toString(),
        publicQuistions: json["public_questions"].toString(),
        privacyPolicy: json["privacy_polices"].toString(),
      );
}
