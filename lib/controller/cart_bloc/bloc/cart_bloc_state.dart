part of 'cart_bloc_bloc.dart';

class CartBlocState {
  final List<CartModel> cartProducts;
  CartBlocState({required this.cartProducts});
}

final class CartBlocInitial extends CartBlocState {
  CartBlocInitial() : super(cartProducts: []);
}
