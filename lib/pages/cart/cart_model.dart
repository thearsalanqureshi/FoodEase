import '/components/my_cart_item/my_cart_item_widget.dart';
import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CountController widget.
  int? countControllerValue1;
  // State field(s) for CountController widget.
  int? countControllerValue2;
  // Model for MyCartItem component.
  late MyCartItemModel myCartItemModel1;
  // Model for MyCartItem component.
  late MyCartItemModel myCartItemModel2;
  // Model for MyCartItem component.
  late MyCartItemModel myCartItemModel3;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    myCartItemModel1 = createModel(context, () => MyCartItemModel());
    myCartItemModel2 = createModel(context, () => MyCartItemModel());
    myCartItemModel3 = createModel(context, () => MyCartItemModel());
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    myCartItemModel1.dispose();
    myCartItemModel2.dispose();
    myCartItemModel3.dispose();
    navigatorModel.dispose();
  }
}
