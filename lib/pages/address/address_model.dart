import '/components/navigator_widget.dart';
import '/components/select_location_item/select_location_item_widget.dart';
import '/components/select_location_item_copy/select_location_item_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'address_widget.dart' show AddressWidget;
import 'package:flutter/material.dart';

class AddressModel extends FlutterFlowModel<AddressWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for SelectLocationItem component.
  late SelectLocationItemModel selectLocationItemModel1;
  // Model for SelectLocationItem component.
  late SelectLocationItemModel selectLocationItemModel2;
  // Model for SelectLocationItemCopy component.
  late SelectLocationItemCopyModel selectLocationItemCopyModel;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    selectLocationItemModel1 =
        createModel(context, () => SelectLocationItemModel());
    selectLocationItemModel2 =
        createModel(context, () => SelectLocationItemModel());
    selectLocationItemCopyModel =
        createModel(context, () => SelectLocationItemCopyModel());
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    selectLocationItemModel1.dispose();
    selectLocationItemModel2.dispose();
    selectLocationItemCopyModel.dispose();
    navigatorModel.dispose();
  }
}
