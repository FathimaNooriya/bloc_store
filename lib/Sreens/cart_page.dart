import 'package:bloc_store/controller/bloc/bloc_bloc.dart';
import 'package:bloc_store/controller/cart_bloc/bloc/cart_bloc_bloc.dart';
import 'package:bloc_store/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//int cartNumber = 15;

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartBlocBloc>().add(getCartEvent());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 114, 190, 155),
          title: Text("My Cart"),
          scrolledUnderElevation: 5,
          toolbarOpacity: .9,
          //forceMaterialTransparency: false,
          bottomOpacity: .5,
          toolbarHeight: 75,
        ),
        body: BlocBuilder<CartBlocBloc, CartBlocState>(
          builder: (context, state) {
            return Center(
                child: state.cartProducts.isEmpty
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        itemCount: state.cartProducts.length,
                        itemBuilder: (Context, index) {
                          final cartProduct = state.cartProducts[index];
                          return CartIteam(
                            cartProduct: cartProduct,
                          );
                        }));
          },
        ));
  }
}

class CartIteam extends StatelessWidget {
  const CartIteam({
    required this.cartProduct,
    super.key,
  });
  final CartModel cartProduct;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IteamImage(cartProduct: cartProduct),
                  AboutIteam(cartProduct: cartProduct),
                ],
              ),
              DeleteFromCart()
            ],
          ),
          Quantity(cartProduct: cartProduct),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}

class DeleteFromCart extends StatelessWidget {
  const DeleteFromCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.delete),
      ),
    );
  }
}

class IteamImage extends StatelessWidget {
  const IteamImage({
    required this.cartProduct,
    super.key,
  });
  final CartModel cartProduct;

  @override
  Widget build(BuildContext context) {
    // cartNumber--;
    return SizedBox(
      height: 130,
      width: 150,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BlocConsumer<BlocBloc, BlocState>(
              listener: (context, state) {
                // cartNumber;
              },
              builder: (context, state) {
                return Image.network(
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * .25,
                  state.products[cartProduct.cartProduct![0].productId!].image!,
                  // "https://rukminim2.flixcart.com/image/850/1000/xif0q/shirt/z/g/d/xl-st2-vebnor-original-imagpw72vhqfczsp.jpeg?q=90",
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AboutIteam extends StatelessWidget {
  const AboutIteam({
    required this.cartProduct,
    super.key,
  });
  final CartModel cartProduct;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .50,
        child: BlocBuilder<BlocBloc, BlocState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.products[cartProduct.cartProduct![0].productId!].title!,
                  overflow: TextOverflow.ellipsis,
                  // "Mens Wear",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(cartProduct.date!),
                Text(((state.products[cartProduct.cartProduct![0].productId!]
                            .price!) *
                        84)
                    .ceil()
                    .toString()),
              ],
            );
          },
        ),
      ),
    );
  }
}

class Quantity extends StatelessWidget {
  const Quantity({
    required this.cartProduct,
    super.key,
  });
  final CartModel cartProduct;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Container(
        child: Row(children: [
          Card(
            shape: CircleBorder(
              eccentricity: 0,
            ),
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text("-"),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              cartProduct.cartProduct!.isEmpty
                  ? '100'
                  : cartProduct.cartProduct![0].quantity.toString(),
              style: TextStyle(color: Colors.black),
            ),
          ),
          Card(
            shape: CircleBorder(
              eccentricity: 0,
            ),
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text("+"),
            ),
          ),
        ]),
      ),
    );
  }
}
