import '/components/button_order_status/button_order_status_widget.dart';
import '/components/my_order_item/my_order_item_widget.dart';
import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_order_widget.dart' show MyOrderWidget;
import 'package:flutter/material.dart';

class MyOrderModel extends FlutterFlowModel<MyOrderWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for MyOrderItem component.
  late MyOrderItemModel myOrderItemModel1;
  // Model for MyOrderItem component.
  late MyOrderItemModel myOrderItemModel2;
  // Model for MyOrderItem component.
  late MyOrderItemModel myOrderItemModel3;
  // Model for ButtonOrderStatus component.
  late ButtonOrderStatusModel buttonOrderStatusModel;
  // Model for MyOrderItem component.
  late MyOrderItemModel myOrderItemModel4;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    myOrderItemModel1 = createModel(context, () => MyOrderItemModel());
    myOrderItemModel2 = createModel(context, () => MyOrderItemModel());
    myOrderItemModel3 = createModel(context, () => MyOrderItemModel());
    buttonOrderStatusModel =
        createModel(context, () => ButtonOrderStatusModel());
    myOrderItemModel4 = createModel(context, () => MyOrderItemModel());
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    myOrderItemModel1.dispose();
    myOrderItemModel2.dispose();
    myOrderItemModel3.dispose();
    buttonOrderStatusModel.dispose();
    myOrderItemModel4.dispose();
    navigatorModel.dispose();
  }
}
