import 'package:e_commerce/domain/product/entities/product.dart';


abstract class ProductsDisplayState {}

class ProductsInitialState extends ProductsDisplayState {}
class ProductsLoading extends ProductsDisplayState {}

class ProductsLoaded extends ProductsDisplayState {
  final List<ProductEntity> products;
  ProductsLoaded({required this.products});
}

class LoadProductsFailure extends ProductsDisplayState {}