import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/components/product_viewer.dart';
import 'package:flutter_cubit/data/model/data_model.dart';
import 'package:flutter_cubit/providers/bloc/product_bloc.dart';
import 'package:flutter_cubit/providers/bloc/product_events.dart';
import 'package:flutter_cubit/providers/cubit/product_cubit.dart';
import 'package:flutter_cubit/providers/product_states.dart';
import 'package:flutter_cubit/screens/product_details.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowProducts(),
    );
  }
}

class ShowProducts extends StatelessWidget {
  const ShowProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = ProductCubit.get(context);
    bloc.getProducts();
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        List<DataModel> result = [];
        if (state is ProductLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductLoadedState) {
          result = state.response;
          print(state.response.length);
        } else if (state is ProductExceptionState) {
          return Center(
            child: Text(state.error),
          );
        }
        return ListView.builder(
          itemCount: result.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    model: result[index],
                  ),
                ),
              ),
              child: ProductViewer(
                result: result,
                index: index,
              ),
            );
          },
        );
      },
    );
  }
}
