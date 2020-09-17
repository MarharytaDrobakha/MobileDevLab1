import 'package:DartCRUD/Person.dart';

class Worker extends Person{
    Worker() : super.empty();

    @override
    String toString() {
      return 'Worker{id: $id, firstName: $firstName, lastName: $lastName, createdDate: $createdDate}';
    }
}