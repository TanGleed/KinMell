import 'package:app/models/product/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState(
      {@Default(<Product>[]) List<Product> products,
      @Default(true) bool hasNext,
      @Default(false) bool isLoading}) = _ProductsState;
}
