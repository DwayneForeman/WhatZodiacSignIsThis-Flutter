class PurchaseModel {
  late String uid;
  late String productId;
  late DateTime? subscriptionDate;

  PurchaseModel() {
    uid = "";
    productId = "";
    subscriptionDate = null;
  }

  PurchaseModel.fromJson(Map<String, dynamic> json) {
    uid = json["uid"] ?? "";
    productId = json["product_id"];
    subscriptionDate = json["subscription_date"].toDate();
  }
}
