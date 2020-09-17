import 'package:DartCRUD/Teachers.dart';
import 'package:DartCRUD/Worker.dart';

import 'package:DartCRUD/Student.dart';

abstract class Person {
  String id;
  String firstName;
  String lastName;
  DateTime createdDate;


  Person.empty();

  // ignore: missing_return
  factory Person (int per) {
    switch (per) {
      case 1:
        return new Student();
      case 2:
        return new Worker();
      case 3:
        return new Teachers();
    }
  }
  Person.init(this.id, this.firstName, this.lastName, this.createdDate);

  @override
  bool operator == (Object other) {
    if(identical(this, other)) {
      return true;
    } else if (other is Person) {
      return id == other.id;
    }
    return false;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Person{id: $id, firstName: $firstName, lastName: $lastName, createdDate: $createdDate}';
  }
}
