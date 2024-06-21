import 'package:invoice/features/view_invoice/data/model.dart';

class Repository {
  Repository();
  List<InvoiceModel> invoiceList = [
    InvoiceModel(
        description: "Laptops",
        quantity: 1,
        clientName: "Nganga",
        invoiceDate: DateTime.now(),
        price: 1200.00,
        taxes: 96.00,
        totals: 1296.00),
    InvoiceModel(
        description: "Beer",
        quantity: 2,
        clientName: "John",
        invoiceDate: DateTime.now(),
        price: 25.00,
        taxes: 4.00,
        totals: 54.00),
    InvoiceModel(
        description: "Pens",
        quantity: 1,
        price: 45.00,
        invoiceDate: DateTime.now(),
        clientName: "James",
        taxes: 3.60,
        totals: 48.60),
    InvoiceModel(
        description: "Books",
        quantity: 2,
        invoiceDate: DateTime.now(),
        price: 150.00,
        clientName: 'Nandia',
        taxes: 12.00,
        totals: 312.00),
    InvoiceModel(
        description: "Mobile Phones",
        quantity: 1,
        invoiceDate: DateTime.now(),
        clientName: 'Mwangi',
        price: 200.00,
        taxes: 16.00,
        totals: 216.00),
  ];

  List<InvoiceModel> getInvoice() {
    return invoiceList;
  }
}
