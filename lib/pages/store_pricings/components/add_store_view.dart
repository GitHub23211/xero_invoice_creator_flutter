import 'package:flutter/material.dart';
import 'package:xero_app_flutter/pages/local_invoicing/add_local_manifests/components/elements/text_form_input.dart';

class AddStoreView extends StatelessWidget {
  final TextEditingController storeNum;
  final TextEditingController storeName;
  final TextEditingController storePricing;
  final Function onAdd;

  const AddStoreView({
    super.key,
    required this.storeNum,
    required this.storeName,
    required this.storePricing,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.3;
    double height = MediaQuery.of(context).size.height * 0.25;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: width, vertical: height),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Add New Store', style: TextStyle(fontSize: 20)),
              TextFormInput(
                controller: storeNum,
                labelText: 'Store Number',
              ),
              TextFormInput(
                controller: storeName,
                labelText: 'Store Name',
              ),
              TextFormInput(
                controller: storePricing,
                labelText: 'Store Pricing',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      onAdd();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Confirm'),
                  ),
                  TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
