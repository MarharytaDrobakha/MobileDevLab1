import 'package:DartCRUD/Person.dart';

class Student extends Person {
    Student() : super.empty();

    @override
    String toString() {
      return 'Student{id: $id, firstName: $firstName, lastName: $lastName, createdDate: $createdDate}';
    }
}