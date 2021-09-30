class DataModel {
  final String name, id;
  final double salary;
  const DataModel({
    required this.id,
    required this.name,
    required this.salary,
  });
}

const List<DataModel> products = [
  DataModel(
    id: "1",
    name: "product1",
    salary: 120,
  ),
  DataModel(
    id: "2",
    name: "product2",
    salary: 130,
  ),
  DataModel(
    id: "3",
    name: "product3",
    salary: 140,
  ),
  DataModel(
    id: "4",
    name: "product4",
    salary: 150,
  ),
  DataModel(
    id: "5",
    name: "product5",
    salary: 160,
  ),
  DataModel(
    id: "6",
    name: "product6",
    salary: 170,
  ),
  DataModel(
    id: "7",
    name: "product7",
    salary: 180,
  ),
  DataModel(
    id: "8",
    name: "product8",
    salary: 190,
  ),
  DataModel(
    id: "9",
    name: "product9",
    salary: 200,
  ),
];
