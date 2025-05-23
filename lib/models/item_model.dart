class ItemModel {
   String id;
  String itemImage;
  String itemName;
  int itemPrice;
  String catogeryId;
  int quantity;

  ItemModel({
    required this.id,
    required this.itemImage,
    required this.itemName,
    required this.itemPrice,
    required this.catogeryId,
    this.quantity = 0,
  });
}