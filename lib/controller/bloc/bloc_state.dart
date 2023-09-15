part of 'bloc_bloc.dart';

class BlocState {
  final List<StoreModel> products;
  BlocState({required this.products});
}

final class BlocInitial extends BlocState {
  BlocInitial() : super(products: []);
}
