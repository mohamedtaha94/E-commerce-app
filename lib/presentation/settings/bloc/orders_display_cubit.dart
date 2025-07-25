
import 'package:e_commerce/domain/order/usecases/get_orders.dart';
import 'package:e_commerce/presentation/settings/bloc/orders_display_state.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersDisplayCubit extends Cubit<OrdersDisplayState> {
  OrdersDisplayCubit() : super(OrdersLoading()){    print('[Cubit] OrdersDisplayCubit constructor called');
}

  void displayOrders() async {
    print('[Cubit] Fetching orders...');
    var returnedData = await sl<GetOrdersUseCase>().call();
    returnedData.fold(
      
      (error){
        print('[Cubit] Error: $error');
        emit(LoadOrdersFailure(errorMessage: error));
      }, 
      (orders) {
              print('[Cubit] Orders fetched: ${orders.length}');

        emit(OrdersLoaded(orders: orders));
        
      }
    );
  }
}