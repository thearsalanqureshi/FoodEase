import '/components/navigator_widget.dart';
import '/components/voucher_item/voucher_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'voucher_widget.dart' show VoucherWidget;
import 'package:flutter/material.dart';

class VoucherModel extends FlutterFlowModel<VoucherWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for VoucherItem component.
  late VoucherItemModel voucherItemModel;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    voucherItemModel = createModel(context, () => VoucherItemModel());
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    voucherItemModel.dispose();
    navigatorModel.dispose();
  }
}
