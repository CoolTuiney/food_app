class Utils {
  static int formatPrice(double? price) {
    if (price == null) return 0;
    var priceStr = price % 1 == 0 ? price.toStringAsFixed(0) : price.toString();
    return int.parse(priceStr);
  }
}
