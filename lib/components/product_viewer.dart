import 'package:flutter/material.dart';
import 'package:flutter_cubit/data/model/data_model.dart';

class ProductViewer extends StatelessWidget {
  const ProductViewer({
    Key? key,
    required this.result,
    required this.index,
  }) : super(key: key);

  final List<DataModel> result;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          result[index].name,
        ),
        subtitle: Text(
          result[index].id,
        ),
        trailing: Text(
          result[index].salary.toString(),
        ),
      ),
    );
  }
}
