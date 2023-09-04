import 'package:equatable/equatable.dart';

class MyCategory extends Equatable {
  final String name;
  const MyCategory({required this.name});
  @override
  List<Object?> get props => [name];
}
