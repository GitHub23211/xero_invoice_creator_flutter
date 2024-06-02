import 'package:xero_app_flutter/models/invoice_model.dart';

abstract class InvoiceStrategy {
  late InvoiceModel invoice;
  late Map<String, dynamic> pricing;
  late Map<String, dynamic> fixedInfo;

  InvoiceStrategy(
    Map<String, dynamic> p,
    Map<String, dynamic> f,
  ) {
    pricing = p;
    fixedInfo = f;
    invoice = InvoiceModel(fixedInfo['HEADERS']);
  }

  void processManInfo(Map<String, dynamic> data);

  void saveInvoice() {
    invoice.saveToCSV();
  }
}
