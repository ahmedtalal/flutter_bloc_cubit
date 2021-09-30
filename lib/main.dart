import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/data/services/product_operations.dart';
import 'package:flutter_cubit/screens/home.dart';
import 'package:flutter_cubit/providers/bloc/product_bloc.dart';
import 'package:flutter_cubit/providers/cubit/product_cubit.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Cubit",
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ProductCubit>(
            create: (context) => ProductCubit(
              repositoryModel: ProductOperations(),
            ),
          ),
          BlocProvider<ProductBloc>(
            create: (context) => ProductBloc(
              repositoryModel: ProductOperations(),
            ),
          ),
        ],
        child: Home(),
      ),
    );
  }
}
