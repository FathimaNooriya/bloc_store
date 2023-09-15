import 'package:bloc/bloc.dart';
import 'package:bloc_store/api_integration/api_functions.dart';

import '../../model/store_model.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocInitial()) {
    on<GetAllProductsEvent>((event, emit) async {

      final products = await StoreApi().getProducts();
    return emit(BlocState(products:products ));

    });
  }
}
