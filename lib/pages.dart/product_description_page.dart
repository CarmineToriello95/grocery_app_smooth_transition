import 'package:flutter/material.dart';
import 'package:grocery_app_smooth_transition/bloc/bloc.dart';
import 'package:grocery_app_smooth_transition/bloc/bloc_provider.dart';
import 'package:grocery_app_smooth_transition/models/product.dart';

class ProductDescriptionPage extends StatefulWidget {
  final Object imageHeroTag;
  final Product product;
  final Animation<double> animation;
  ProductDescriptionPage(
      {@required this.imageHeroTag,
      @required this.animation,
      @required this.product});

  @override
  _ProductDescriptionPageState createState() => _ProductDescriptionPageState();
}

class _ProductDescriptionPageState extends State<ProductDescriptionPage> {
  Object heroTag;
  @override
  void initState() {
    super.initState();
    heroTag = widget.product.id;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (_, child) {
        return Scaffold(
          backgroundColor:
              widget.animation.isCompleted ? Colors.white : Colors.transparent,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ),
          body: Padding(
            padding:
                const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
            child: Opacity(
              opacity: widget.animation.value >= 0.9 ? 1 : 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 8,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Hero(
                            tag: heroTag,
                            child: Image.asset(
                              widget.product.imagePath,
                              height: 250.0,
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.product.name,
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                widget.product.weight,
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 32.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  QuantityButton(),
                                  Text(
                                    '\$ ${widget.product.price}',
                                    style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 32.0,
                              ),
                              Text(
                                'About the product',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(widget.product.description),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                            height: 50.0,
                            width: 250.0,
                            child: RaisedButton(
                              color: Colors.yellow[700],
                              onPressed: () {
                                setState(() {
                                  heroTag = '${widget.product.id}c';
                                });
                                (BlocProvider.of(context).bloc as Bloc)
                                    .addProductToCart(widget.product, 1);
                                Navigator.pop(context, true);
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                'Add to cart',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class QuantityButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {},
          ),
          Text(
            '1',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
