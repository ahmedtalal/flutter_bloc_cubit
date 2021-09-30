import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/data/model/data_model.dart';
import 'package:flutter_cubit/data/repository/product_repo_model.dart';
import 'package:flutter_cubit/providers/product_states.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductRepositoryModel repositoryModel;
  ProductCubit({
    required this.repositoryModel,
  }) : super(InitialProductState());

  static ProductCubit get(BuildContext context) {
    return BlocProvider.of<ProductCubit>(context);
  }

  void getProducts() {
    try {
      emit(ProductLoadingState());
      List<DataModel> response = repositoryModel.fetchData();
      print("response is ${response.length}");
      emit(ProductLoadedState(response: response));
    } catch (e) {
      emit(ProductExceptionState(error: "No Data at this time"));
    }
  }
}
