import 'package:DartCRUD/Person.dart';
import 'package:path/path.dart';
import 'dart:io';

List<Person> items;

main(List<String> arguments) {
  print('[Main] Started..');
  var optionFilepath =
      join(dirname(Platform.script.toFilePath()), '..', 'lib', 'Options.txt');
  final file = new File(optionFilepath);
  String options = file.readAsStringSync();

  // Initialize item
  items = getItems();

  bool isExit = false;

  while (!isExit) {
    // 1. Display option
    print(options);

    // 2. Key in option
    String selectedOption = stdin.readLineSync();

    switch (selectedOption) {
      case '1':
        create();
        break;
      case '2':
        update();
        break;
      case '3':
        read();
        break;
      case '4':
        delete();
        break;
      case '-1':
        isExit = true;
        break;
      default:
        print("Invalid option " + selectedOption);
    }
  }

  print('[Main] End..');
}

List<Person> getItems() {
  List<Person> items = new List();
  return items;
}

void create() {
  print('[Main] Create Start');
  stdout.write("choose who you want to add: 1 - student, 2 - worker, 3 - teacher.");
  String str = stdin.readLineSync();
  int num = int.parse(str);

  var newItem = Person(num);

  while (true) {
    stdout.write("ID : ");
    String id = stdin.readLineSync();
    newItem.id = id;

    if (!items.contains(newItem)) {
      break;
    }
    print('Item with ID $id already exist. Try again.');
  }

  stdout.write("Name : ");
  String name = stdin.readLineSync();
  stdout.write("Description : ");
  String description = stdin.readLineSync();

  newItem.firstName = name;
  newItem.lastName = description;

  print("Successfully create new item " + newItem.toString());
  newItem.createdDate = new DateTime.now();

  items.add(newItem);
  print('[Main] Create End');
}

void read() {
  print('[Main] Read Start');

  if (items != null) {
    for (Person item in items) {
      print(item);
    }
  }
  print('[Main] Read End');
}

void update() {
  print('[Main] Update Start');
  stdout.write("Choose who you want to update: 1 - student, 2 - worker, 3 - teacher.");
  String str = stdin.readLineSync();
  int num = int.parse(str);
  stdout.write("Enter Item ID to update : ");
  Person selectedItem = new Person(num);
  String id = stdin.readLineSync();
  selectedItem.id = id;

  if (!items.contains(selectedItem)) {
    print('Item with ID $id does not exist.');
  } else {
    selectedItem = items.singleWhere((item) => item.id == selectedItem.id);

    stdout.write("Name : ");
    String name = stdin.readLineSync();
    stdout.write("Description : ");
    String description = stdin.readLineSync();

    selectedItem.firstName = name;
    selectedItem.lastName = description;

    print('Successfully updated $id');
  }

  print('[Main] Update End');
}

void delete() {
  print('[Main] Delete Start');
  stdout.write("Choose who you want to delete: 1 - student, 2 - worker, 3 - teacher.");
  String str = stdin.readLineSync();
  int num = int.parse(str);
  stdout.write("Enter Item ID to delete : ");
  Person selectedItem = new Person(num);
  String id = stdin.readLineSync();
  selectedItem.id = id;

  if (!items.contains(selectedItem)) {
    print('Item with ID $id does not exist.');
  } else {
    items.remove(selectedItem);
    print('Successfully deleted $id');
  }

  print('[Main] Delete End');
}
