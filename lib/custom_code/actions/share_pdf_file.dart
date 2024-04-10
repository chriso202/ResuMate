// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'dart:io';

Future<void> sharePdfFile(String firstName) async {
  // Get the temporary directory
  final output = await getTemporaryDirectory();
  final filePath = "${output.path}/resume.pdf";

  // Check if the file exists
  final bool exists = await File(filePath).exists();
  if (!exists) {
    print('File does not exist');
    return;
  }

  // Share the file
  await Share.shareFiles([filePath], text: "$firstName's Resume");
}
