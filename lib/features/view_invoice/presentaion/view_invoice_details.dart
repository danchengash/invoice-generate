import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/features/view_invoice/data/model.dart';
import 'package:invoice/controllers/invoices_controller.dart';

class ViewInvoiceDetails extends StatefulWidget {
  final InvoiceModel data;
  const ViewInvoiceDetails({super.key, required this.data});

  @override
  State<ViewInvoiceDetails> createState() => _ViewInvoiceDetailsState();
}

class _ViewInvoiceDetailsState extends State<ViewInvoiceDetails> {
  List<InvoiceModel> data = [];

  //injec repo make it accesible in view
  final repo = Get.put(Repository());

  @override
  void initState() {
    // TODO: implement initState
    data.addAll(repo.getInvoice());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = SizeConfig().size(context);

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          width: size.width * 0.7,
          height: size.height,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Client : ${widget.data.clientName.toString()}'),
                Text('Created On : ${widget.data.invoiceDate.toString()}'),
                Text('Description: ${widget.data.description.toString()}'),
                Text('Quantity: ${widget.data.quantity.toString()}'),
                Text('Taxes: ${widget.data.taxes.toString()}'),
                const Divider(),
                Text(
                  'Totals: ${widget.data.totals.toString()}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
