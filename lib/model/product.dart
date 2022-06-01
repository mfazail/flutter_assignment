import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  String? productName;

  @HiveField(1)
  String? productUrl;

  @HiveField(2)
  int? productRating;

  @HiveField(3)
  String? productDescription;
}
