main(List<String> arguments) {
  //assert
  int lineCount;
  assert(lineCount == null);

  //Lists
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);

  list[1] = 1;
  assert(list[1] == 1);

  var list2 = [0, ...list];
  assert(list2.length == 4);

  var listOfInts = [1, 2, 3];
  var listOfStrings = [
    '&&0',
    for (var i in listOfInts) '&&$i'
  ];
  print(listOfStrings);
  assert(listOfStrings[1] == '&&1');

  //foreach and anonymous functions
  listOfInts.forEach((item){
    print('${listOfInts.indexOf(item)}: $item');
  });;

  //Set
  var elements = <String>{};
  elements.add('&&-1');
  elements.addAll(listOfStrings);
  print(elements);

  //Map
  var mapOfInts = {
    1: 'one',
    2: 'two',
    3: 'three',
  };

  var mapOfStrings = Map();
  mapOfStrings['one'] = 1;
  mapOfStrings['two'] = 2;
  mapOfStrings['three'] = 3;

  print(mapOfInts);
  print(mapOfStrings);

  //functions
  String name(String name, String surname, [String age = "unknown age"]) {
    var result = '$name $surname';
    if (age != null) {
      result = '$result, $age';
    }
    return result;
  }
  assert(name("Rita", "Drobakha", "20") == "Rita Drobakha, 20");

  //assignment operators
  var b;
  var value;
  b ??= value;
  assert(b == null);

  Person per = Person.origin();
  print(per.toString());
}

// Named constructor
class Person {
  String name, surname;

  Person(this.name, this.surname);
  Person.origin() {
    name = "unknown";
    surname = "unknown";
  }

  @override
  String toString() {
    return 'Person{name: $name, surname: $surname}';
  }
}