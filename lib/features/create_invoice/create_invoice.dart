import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/core/widgets/custom_text_field.dart';
import 'package:invoice/features/view_invoice/data/model.dart';
import 'package:invoice/controllers/invoices_controller.dart';
import 'package:invoice/features/view_invoice/presentaion/view_invoice.dart';

class CreateInvoice extends StatefulWidget {
  const CreateInvoice({
    super.key,
  });

  @override
  State<CreateInvoice> createState() => _CreateInvoiceState();
}

class _CreateInvoiceState extends State<CreateInvoice> {
  List<InvoiceModel> data = [];

  //injec repo make it accesible in view
  final repo = Get.put(Repository());

  final _client = TextEditingController();
  final _description = TextEditingController();
  final _quantit = TextEditingController();
  final _taxes = TextEditingController();
  final _total = TextEditingController();

  final _formKe = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = SizeConfig().size(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: const Text('Generate Invoice'),
      ),
      body: Center(
        child: Form(
          key: _formKe,
          child: Container(
            color: Colors.white,
            width: size.width * 0.7,
            height: size.height,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextFieldWidget(
                    labelText: 'Name',
                    controller: _client,
                    validator: (value) => value!.isEmpty ? "  required" : null),
                CustomTextFieldWidget(
                    labelText: 'Description',
                    controller: _description,
                    validator: (value) => value!.isEmpty ? "  required" : null),
                CustomTextFieldWidget(
                    labelText: 'Quantity',
                    controller: _quantit,
                    validator: (value) => value!.isEmpty ? "  required" : null),
                CustomTextFieldWidget(
                    labelText: 'Unit Price',
                    controller: _taxes,
                    validator: (value) => value!.isEmpty ? "  required" : null),
                CustomTextFieldWidget(
                    labelText: 'Totals',
                    controller: _total,
                    validator: (value) => value!.isEmpty ? "  required" : null),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: size.width * .6,
                  child: TextButton(
                    onPressed: () {
                      if (_formKe.currentState!.validate()) {
                        Get.to(const InvoicesHome());
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent)),
                    child: const Text('Submit'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
