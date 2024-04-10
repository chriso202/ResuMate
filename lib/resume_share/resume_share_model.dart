import '/flutter_flow/flutter_flow_util.dart';
import 'resume_share_widget.dart' show ResumeShareWidget;
import 'package:flutter/material.dart';

class ResumeShareModel extends FlutterFlowModel<ResumeShareWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
