import '/flutter_flow/flutter_flow_util.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for firstName widget.
  final firstNameKey = GlobalKey();
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? firstNameSelectedOption;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)? confirmPasswordControllerValidator;
  // State field(s) for emailAddressLogIn widget.
  FocusNode? emailAddressLogInFocusNode;
  TextEditingController? emailAddressLogInController;
  String? Function(BuildContext, String?)? emailAddressLogInControllerValidator;
  // State field(s) for passwordLogIn widget.
  FocusNode? passwordLogInFocusNode;
  TextEditingController? passwordLogInController;
  late bool passwordLogInVisibility;
  String? Function(BuildContext, String?)? passwordLogInControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    confirmPasswordVisibility = false;
    passwordLogInVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    firstNameFocusNode?.dispose();

    lastNameFocusNode?.dispose();
    lastNameController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordController?.dispose();

    emailAddressLogInFocusNode?.dispose();
    emailAddressLogInController?.dispose();

    passwordLogInFocusNode?.dispose();
    passwordLogInController?.dispose();
  }
}
