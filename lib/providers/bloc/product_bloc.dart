import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/data/model/data_model.dart';
import 'package:flutter_cubit/data/repository/product_repo_model.dart';
import 'package:flutter_cubit/providers/bloc/product_events.dart';
import 'package:flutter_cubit/providers/product_states.dart';

class ProductBloc extends Bloc<ProductEvents, ProductStates> {
  ProductRepositoryModel repositoryModel;
  var number;
  ProductBloc({required this.repositoryModel}) : super(InitialProductState());

  static ProductBloc getInstance(BuildContext context) {
    return BlocProvider.of<ProductBloc>(context);
  }

  @override
  Stream<ProductStates> mapEventToState(ProductEvents event) async* {
    if (event is FetchProductsEvent) {
      yield ProductLoadingState();
      try {
        List<DataModel> response = repositoryModel.fetchData();
        yield ProductLoadedState(response: response);
      } catch (e) {
        yield ProductExceptionState(error: "no data at this time");
      }
    }
  }
}
