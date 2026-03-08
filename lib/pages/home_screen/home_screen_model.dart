import '/components/navigator_widget.dart';
import '/components/top_of_week_item/top_of_week_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_screen_widget.dart' show HomeScreenWidget;
import 'package:flutter/material.dart';

class HomeScreenModel extends FlutterFlowModel<HomeScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TopOfWeekItem component.
  late TopOfWeekItemModel topOfWeekItemModel1;
  // Model for TopOfWeekItem component.
  late TopOfWeekItemModel topOfWeekItemModel2;
  // Model for TopOfWeekItem component.
  late TopOfWeekItemModel topOfWeekItemModel3;
  // Model for TopOfWeekItem component.
  late TopOfWeekItemModel topOfWeekItemModel4;
  // Model for TopOfWeekItem component.
  late TopOfWeekItemModel topOfWeekItemModel5;
  // Model for TopOfWeekItem component.
  late TopOfWeekItemModel topOfWeekItemModel6;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    topOfWeekItemModel1 = createModel(context, () => TopOfWeekItemModel());
    topOfWeekItemModel2 = createModel(context, () => TopOfWeekItemModel());
    topOfWeekItemModel3 = createModel(context, () => TopOfWeekItemModel());
    topOfWeekItemModel4 = createModel(context, () => TopOfWeekItemModel());
    topOfWeekItemModel5 = createModel(context, () => TopOfWeekItemModel());
    topOfWeekItemModel6 = createModel(context, () => TopOfWeekItemModel());
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    topOfWeekItemModel1.dispose();
    topOfWeekItemModel2.dispose();
    topOfWeekItemModel3.dispose();
    topOfWeekItemModel4.dispose();
    topOfWeekItemModel5.dispose();
    topOfWeekItemModel6.dispose();
    navigatorModel.dispose();
  }
}
