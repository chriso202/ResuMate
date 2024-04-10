import '/flutter_flow/flutter_flow_util.dart';
import 'generate_resume_widget.dart' show GenerateResumeWidget;
import 'package:flutter/material.dart';

class GenerateResumeModel extends FlutterFlowModel<GenerateResumeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
