import 'package:flutter/material.dart';
import 'package:xero_app_flutter/pages/local_invoicing/components/text_form_input.dart';

class StoreNumForm extends StatelessWidget {
  const StoreNumForm({super.key});

  @override
  Widget build(BuildContext context) {
    double mQueryWidth = MediaQuery.of(context).size.width * 0.3;
    return Row(children: [
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: mQueryWidth,
            child: TextFormInput(labelText: 'Store'),
          ),
          SizedBox(
            width: mQueryWidth,
            child: TextFormInput(labelText: 'Store'),
          ),
          SizedBox(
            width: mQueryWidth,
            child: TextFormInput(labelText: 'Store'),
          ),
        ],
      )),
      Expanded(
        child: ExcludeFocus(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => {}, child: Text('Test')),
            ElevatedButton(onPressed: () => {}, child: Text('Test')),
            ElevatedButton(onPressed: () => {}, child: Text('Test')),
          ],
        )),
      )
    ]);
  }
}
