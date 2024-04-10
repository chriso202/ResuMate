// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'dart:io';

Future newPDF(
  String firstName,
  String lastName,
  String schoolName,
  String schoolCity,
  String schoolState,
  String schoolOtherInfo,
  String club1Title,
  String club1StartDate,
  String club1EndDate,
  String club1OtherInfo,
  String club2Title,
  String club2StartDate,
  String club2EndDate,
  String club2OtherInfo,
  String work1Title,
  String work1StartDate,
  String work1EndDate,
  String work1OtherInfo,
  String work2Title,
  String work2StartDate,
  String work2EndDate,
  String work2OtherInfo,
  String volunteerTitle,
  String volunteerHours,
  String volunteerOtherInfo,
) async {
  final pdf = pw.Document();

  // Add content to PDF using the provided parameters
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Resume',
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              '$firstName $lastName',
              style: pw.TextStyle(
                fontSize: 16,
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              'School Information:',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              'School: $schoolName',
              style: pw.TextStyle(
                fontSize: 16,
              ),
            ),
            pw.Text(
              'City: $schoolCity',
              style: pw.TextStyle(
                fontSize: 16,
              ),
            ),
            pw.Text(
              'State: $schoolState',
              style: pw.TextStyle(
                fontSize: 16,
              ),
            ),
            pw.Text(
              'Other Information: $schoolOtherInfo',
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              'Clubs & Organizations:',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              '$club1Title ($club1StartDate - $club1EndDate)',
              style: pw.TextStyle(
                fontSize: 16,
              ),
            ),
            pw.Text(
              'Other Information: $club1OtherInfo',
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.Text(
              '$club2Title ($club2StartDate - $club2EndDate)',
              style: pw.TextStyle(
                fontSize: 16,
              ),
            ),
            pw.Text(
              'Other Information: $club2OtherInfo',
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              'Work Experience:',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              '$work1Title ($work1StartDate - $work1EndDate)',
              style: pw.TextStyle(
                fontSize: 16,
              ),
            ),
            pw.Text(
              'Other Information: $work1OtherInfo',
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.Text(
              '$work2Title ($work2StartDate - $work2EndDate)',
              style: pw.TextStyle(
                fontSize: 16,
              ),
            ),
            pw.Text(
              'Other Information: $work2OtherInfo',
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              'Volunteer Experience:',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              '$volunteerTitle (Hours Contributed: $volunteerHours)',
              style: pw.TextStyle(
                fontSize: 16,
              ),
            ),
            pw.Text(
              'Other Information: $volunteerOtherInfo',
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        );
      },
    ),
  );

  final output = await getTemporaryDirectory();
  final outputFile = File("${output.path}/$firstName'sResume.pdf");
  await outputFile.writeAsBytes(await pdf.save());

  await OpenFile.open(outputFile.path);
}
