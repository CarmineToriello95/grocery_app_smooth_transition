import 'package:flutter/material.dart';

import '../bloc/bloc.dart';
import '../bloc/bloc_provider.dart';
import '../models/product.dart';
import 'cart_page.dart';
import 'product_description_page.dart';
import 'products_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController animation;
  final Bloc _bloc = Bloc();

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  GlobalKey<AnimatedListState> listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          bloc: _bloc,
          child: GestureDetector(
            onVerticalDragStart: _onDragStart,
            onVerticalDragUpdate: _onDragUpdate,
            onVerticalDragEnd: _onDragEnd,
            child: AnimatedBuilder(
                animation: animation,
                builder: (context, snapshot) {
                  return Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(
                          0.0,
                          (MediaQuery.of(context).size.height * 0.8) *
                              (1 - animation.value),
                        ),
                        child: CartPage(
                          listKey: listKey,
                          headerOpacity: 1 - animation.value,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            0.0,
                            -MediaQuery.of(context).size.height *
                                0.75 *
                                animation.value),
                        child: StreamBuilder<bool>(
                          stream: _bloc.sShowTransitionAnimation,
                          builder: (_, snapshot) {
                            return ProductsListPage(
                              productSelected: (product) async {
                                var value = await Navigator.of(context)
                                    .push(_createRoute(product));
                                Future.delayed(Duration(milliseconds: 200),
                                    () => _bloc.triggerTransitionAnimation());
                                if (value) {
                                  listKey.currentState.insertItem(
                                    0,
                                    duration: Duration(milliseconds: 500),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  Route _createRoute(Product product) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
        bloc: _bloc,
        child: ProductDescriptionPage(
            imageHeroTag: product.id, animation: animation, product: product),
      ),
      transitionDuration: const Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // var begin = Offset(0.0, 1.0);
        // var end = Offset.zero;
        // var curve = Curves.ease;

        // var tween = Tween(begin: begin, end: end);
        // var curvedAnimation = CurvedAnimation(
        //   parent: animation,
        //   curve: curve,
        // );
        return child;
      },
    );
  }

  bool _isDraggable;

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromBottom =
        animation.isDismissed && details.globalPosition.dy > 0.0;
    bool isDragCloseFromTop =
        animation.isCompleted && details.globalPosition.dy < 600;
    _isDraggable = isDragOpenFromBottom || isDragCloseFromTop;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_isDraggable) {
      double delta = details.primaryDelta / MediaQuery.of(context).size.height;
      animation.value -= delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (animation.isDismissed || animation.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dy.abs() >=
        MediaQuery.of(context).size.height) {
      double visualVelocity = -(details.velocity.pixelsPerSecond.dy /
          MediaQuery.of(context).size.height);
      animation.fling(velocity: visualVelocity);
    } else if (animation.value > 0.5) {
      animation.forward();
    } else {
      animation.reverse();
    }
  }
}
