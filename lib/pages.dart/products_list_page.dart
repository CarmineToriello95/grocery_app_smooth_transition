import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../bloc/bloc_provider.dart';
import '../models/product.dart';

import '../bloc/bloc.dart';
import '../constants.dart';
import '../widget/product_card.dart';

class ProductsListPage extends StatelessWidget {
  final Function(Product) productSelected;
  ProductsListPage({this.productSelected});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream:
            (BlocProvider.of(context).bloc as Bloc).sShowTransitionAnimation,
        builder: (_, snapshot) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            height: snapshot.hasData && snapshot.data
                ? MediaQuery.of(context).size.height
                : MediaQuery.of(context).size.height * 0.85,
            decoration: BoxDecoration(
              color: snapshot.hasData && snapshot.data
                  ? Colors.white
                  : primaryColor,
              borderRadius: snapshot.hasData && snapshot.data
                  ? BorderRadius.all(Radius.zero)
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
            ),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: snapshot.hasData && snapshot.data ? 0 : 1,
              child: Column(
                children: <Widget>[
                  HeaderSection(),
                  BodySection(
                    products:
                        (BlocProvider.of(context).bloc as Bloc).productsList,
                    productSelected: productSelected,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: NavigationToolbar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {},
        ),
        middle: Text(
          'Pasta & Noodles',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.sort),
          onPressed: () {},
        ),
        centerMiddle: false,
      ),
    );
  }
}

class FadingDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red, primaryColor.withOpacity(0.7)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class BodySection extends StatelessWidget {
  final List<Product> products;
  final Function(Product) productSelected;

  const BodySection({this.products, this.productSelected});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.7,
          children: List.generate(
            products.length,
            (index) => GestureDetector(
              onTap: () {
                (BlocProvider.of(context).bloc as Bloc)
                    .triggerTransitionAnimation();
                productSelected(products[index]);
              },
              child: ProductCard(
                imageHeroTag: products[index].id,
                product: products[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
