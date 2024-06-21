import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/features/create_invoice/create_invoice.dart';
import 'package:invoice/features/pdf-invoice/pdf_print_invoice.dart';
import 'package:invoice/features/view_invoice/data/model.dart';
import 'package:invoice/controllers/invoices_controller.dart';
import 'package:invoice/features/view_invoice/presentaion/view_invoice_details.dart';
import 'package:printing/printing.dart';

class InvoicesHome extends StatefulWidget {
  const InvoicesHome({super.key});

  @override
  State<InvoicesHome> createState() => _InvoicesHomeState();
}

class _InvoicesHomeState extends State<InvoicesHome> {
  List<InvoiceModel> data = [];

  final repo = Get.put(Repository());

  @override
  void initState() {
    data.addAll(repo.getInvoice());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = SizeConfig().size(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "INVOICES",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              width: size.width * 0.7,
              height: size.height * 0.6,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: ListTile(
                            onTap: () => Get.to(() => ViewPdf()),
                            title: Row(
                              children: [
                                Text(
                                  '${data[index].clientName.toString()}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'KSH ${data[index].price.toString()}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              'Date Generated : ${DateFormat().add_MMMMEEEEd().format(data[index].invoiceDate)}',
                            ),
                          ),
                        ),
                        Divider()
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.3),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                  ),
                  onPressed: () {
                    Get.to(() => CreateInvoice());
                  },
                  child: Text(
                    "Generate Invoice",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class ViewPdf extends StatelessWidget {
  const ViewPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
        shareActionExtraSubject: "filtronic invoice",
        pdfFileName: "invoice_filtronic.pdf",
        build: (context) => generateInvoice());
  }
}
