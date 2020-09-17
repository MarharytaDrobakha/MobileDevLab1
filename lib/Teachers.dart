import 'package:DartCRUD/Person.dart';

class Teachers extends Person {
    Teachers() : super.empty();

    @override
    String toString() {
      return 'Teacher{id: $id, firstName: $firstName, lastName: $lastName, createdDate: $createdDate}';
    }
}