import 'package:bloc/bloc.dart';
import 'package:bloc_store/api_integration/api_functions.dart';
import 'package:bloc_store/model/cart_model.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
    on<getCartEvent>((event, emit) async {
      final cartProducts = await StoreApi().getCartItems();
      return emit(CartBlocState(cartProducts: cartProducts));
    });
  }
}
