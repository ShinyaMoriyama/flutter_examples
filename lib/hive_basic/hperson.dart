import 'package:hive/hive.dart';

part 'hperson.g.dart';

@HiveType(typeId: 0)
class Hperson extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  int? age;

  @HiveField(2)
  List<Hperson>? friends;

  Hperson({this.name, this.age, this.friends});
}
