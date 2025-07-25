/*
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'products_display_state.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase useCase;
  ProductsDisplayCubit({required this.useCase}) : super(ProductsInitialState());
  
  void displayProducts({dynamic params}) async {
    emit(
      ProductsLoading()
    );
    var returnedData = await useCase.call(
      params: params
    );
    returnedData.fold(
      (error) {
        emit(
          LoadProductsFailure()
        );
      },
      (data) {
        emit(
          ProductsLoaded(products: data)
        );
      }
    );
  }

  void displayInitial() {
    emit(
      ProductsInitialState()
    );
  }

}*/
/*import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'products_display_state.dart';
import '../../../domain/product/entities/product.dart'; // ✅ make sure this import exists

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase useCase;

  ProductsDisplayCubit({required this.useCase}) : super(ProductsInitialState());

  void displayProducts({dynamic params}) async {
    emit(ProductsLoading());

    var returnedData = await useCase.call(params: params);

    print('🔎 UseCase returned: $returnedData');

    returnedData.fold(
      (error) {
        print('❌ Failed to load products: $error');
        emit(LoadProductsFailure());
      },
      (data) {
        // ✅ Ensure data is a List<ProductEntity>
        if (data is List<ProductEntity>) {
          print('✅ Products fetched: ${data.length} items');
          for (var product in data) {
            print('➡️ Product: ${product.title}');
          }
          emit(ProductsLoaded(products: data));
        } else {
          print('❗ Unexpected data type from useCase: ${data.runtimeType}');
          emit(LoadProductsFailure());
        }
      },
    );
  }

  void displayInitial() {
    emit(ProductsInitialState());
  }
}*/
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'products_display_state.dart';
import '../../../domain/product/entities/product.dart'; // ✅ Make sure this import exists

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase useCase;

  ProductsDisplayCubit({required this.useCase}) : super(ProductsInitialState());

  void displayProducts({dynamic params}) async {
    print('📥 Calling displayProducts with: $params'); // ✅ Added
    emit(ProductsLoading());

    var returnedData = await useCase.call(params: params);

    print('🔎 UseCase returned: $returnedData'); // ✅ Debug useCase result

    returnedData.fold(
      (error) {
        print('❌ Failed to load products: $error');
        emit(LoadProductsFailure());
      },
      (data) {
        if (data is List<ProductEntity>) {
          print('✅ Products fetched: ${data.length} items');
          for (var product in data) {
            print('➡️ Product: ${product.title}');
          }
          emit(ProductsLoaded(products: data));
        } else {
          print('❗ Unexpected data type from useCase: ${data.runtimeType}');
          emit(LoadProductsFailure());
        }
      },
    );
  }

  void displayInitial() {
    emit(ProductsInitialState());
  }
}

