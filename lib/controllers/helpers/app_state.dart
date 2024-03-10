import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
 
/// Alternative [State] implementation that separates GUI from logic.
/// 
/// Creates a state that mainly wraps the widgets that compound the GUI, and
/// then gets a binded [ChangeNotifier] class that wraps the logic to be applyed
/// in this state.
abstract class AppState<TWidget extends StatefulWidget,
    TBind extends ChangeNotifier> extends State<TWidget> {
  final TBind _state = Modular.get<TBind>();

  /// The binded component that wraps this class logic.
  TBind get state => _state;

  @override
  void initState() {
    super.initState();

    _state.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _state.dispose();
    Modular.dispose<TBind>();
  }
}