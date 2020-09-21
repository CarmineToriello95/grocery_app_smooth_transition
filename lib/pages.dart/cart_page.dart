import 'package:flutter/material.dart';

import '../bloc/bloc.dart';
import '../bloc/bloc_provider.dart';
import '../constants.dart';

class CartPage extends StatefulWidget {
  final double headerOpacity;
  final GlobalKey listKey;

  const CartPage({this.headerOpacity = 1, this.listKey});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Bloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = BlocProvider.of(context).bloc;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Spacer(),
            Opacity(
              opacity: widget.headerOpacity,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(),
                leading: Text(
                  'Cart',
                  style: TextStyle(
                    color: cartPageTextColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                title: Container(
                  height: 50.0,
                  child: AnimatedList(
                    key: widget.listKey,
                    initialItemCount: _bloc.cartItems.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index, animation) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Hero(
                        tag: '${_bloc.cartItems[index].product.id}' + 'c',
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30.0,
                          child: Image.asset(
                            _bloc.cartItems[index].product.imagePath,
                            height: 35.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.yellow[700],
                  radius: 25.0,
                  child: Text(
                    '${_bloc.cartItems.length}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Cart',
                style: TextStyle(
                  color: cartPageTextColor,
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: _bloc.cartItems.length,
                itemBuilder: (_, index) => ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22.0,
                    child: Image.asset(
                      _bloc.cartItems[index].product.imagePath,
                      height: 35.0,
                    ),
                  ),
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        '${_bloc.cartItems[index].quantity}  x  ',
                        style: TextStyle(color: cartPageTextColor),
                      ),
                      Expanded(
                        child: Text(
                          _bloc.cartItems[index].product.name,
                          style: TextStyle(
                            color: cartPageTextColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  trailing: Text(
                    '${_bloc.cartItems[index].product.price}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
              leading: CircleAvatar(
                radius: 22.0,
                backgroundColor: Colors.grey[800],
                child: Icon(
                  Icons.directions_car,
                  color: Colors.yellow[700],
                ),
              ),
              title: Text(
                'Delivery',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Text(
                '\$30.00',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Spacer(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total:',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: cartPageTextColor,
                      fontSize: 22.0,
                    ),
                  ),
                  Text(
                    '\$59.97',
                    style: TextStyle(
                      color: cartPageTextColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: 50.0,
              child: RaisedButton(
                color: Colors.yellow[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}