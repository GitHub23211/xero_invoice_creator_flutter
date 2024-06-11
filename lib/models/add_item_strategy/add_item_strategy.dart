abstract interface class AddItemStrategy {
  void add(Map<String, dynamic> data, List<Map<String, dynamic>> lineItems);

  bool isValidStoreNum(String storeNum);
}
