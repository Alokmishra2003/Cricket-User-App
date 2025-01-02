import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class SuccessScreen extends StatelessWidget {
  final String studentName;
  final String batchName;
  final String dateOfTransaction;
  final String phoneNumber;
  final String amount;
  final String remark;

  const SuccessScreen({
    Key? key,
    required this.studentName,
    required this.batchName,
    required this.dateOfTransaction,
    required this.phoneNumber,
    required this.amount,
    required this.remark,
  }) : super(key: key);

  // Method to generate the PDF document
  Future<pw.Document> _generatePdf() async {
    final pw.Document pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => pw.Container(
          padding: const pw.EdgeInsets.all(16),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Transaction Receipt',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 16),
              pw.Divider(),
              pw.SizedBox(height: 16),
              pw.Text('Student Name: $studentName',
                  style: pw.TextStyle(fontSize: 18)),
              pw.Text('Batch Name: $batchName',
                  style: pw.TextStyle(fontSize: 18)),
              pw.Text('Date of Transaction: $dateOfTransaction',
                  style: pw.TextStyle(fontSize: 18)),
              pw.Text('Phone Number: $phoneNumber',
                  style: pw.TextStyle(fontSize: 18)),
              pw.Text('Amount: ₹$amount',
                  style: pw.TextStyle(fontSize: 18, color: PdfColors.green)),
              pw.Text('Remark: $remark', style: pw.TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );

    return pdf;
  }

  // Method to save the PDF to a file in the Downloads folder
  Future<String> _savePdfToDownloads(pw.Document pdf) async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      final Directory? directory = await getExternalStorageDirectory();
      final String downloadsPath = '${directory?.parent.parent.parent.parent.path}/Download';
      final String filePath = '$downloadsPath/transaction_receipt.pdf';
      final File file = File(filePath);

      await file.writeAsBytes(await pdf.save());

      print('PDF saved at $filePath');
      return filePath;
    } else {
      throw 'Permission denied';
    }
  }

  // Method to handle the download action
  Future<void> _downloadPdf(BuildContext context) async {
    try {
      final pdf = await _generatePdf();
      final filePath = await _savePdfToDownloads(pdf);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF saved at $filePath')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save PDF: $e')),
      );
    }
  }

  // Method to handle the share action
  Future<void> _sharePdf() async {
    final pdf = await _generatePdf();
    await Printing.sharePdf(
        bytes: await pdf.save(), filename: 'transaction_receipt.pdf');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payments"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(height: 16),
            const Text(
              "Payment Successfully Added!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "₹$amount",
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 16),
            Text(
              "₹$amount received from $studentName",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon:
                      const Icon(Icons.download, size: 40, color: Colors.purple),
                  onPressed: () {
                    _downloadPdf(context);
                  },
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon:
                      const Icon(Icons.share, size: 40, color: Colors.purple),
                  onPressed: () {
                    _sharePdf();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}