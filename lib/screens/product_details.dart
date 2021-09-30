import 'package:flutter/material.dart';
import 'package:flutter_cubit/data/model/data_model.dart';

class ProductDetails extends StatefulWidget {
  final DataModel? model;
  const ProductDetails({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          widget.model!.name,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
