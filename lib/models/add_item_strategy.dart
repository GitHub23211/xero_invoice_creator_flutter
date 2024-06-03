abstract class AddItemStrategy {
  late Map<String, dynamic> pricing;
  late Map<String, dynamic> fixedInfo;

  AddItemStrategy(
    Map<String, dynamic> p,
    Map<String, dynamic> f,
  ) {
    pricing = p;
    fixedInfo = f;
  }

  void add(Map<String, dynamic> data, List<Map<String, dynamic>> lineItems);
}
