import 'dart:io';

void main(List<String> arguments) {
  Students? s = Students();

  for (var i = 0; i < 100; i++) {
    print(
        'Want to? \n1-add student\t2-remove student\t3-add subject\t4-end\t5-print student data\t 6-calculate grade ');
    int n = int.parse(stdin.readLineSync()!);
    if (n == 1) {
      int age, phone, id;
      print('Enter Student:');
      print('NAME:');
      String name = stdin.readLineSync()!;
      print('ID:');
      id = int.parse(stdin.readLineSync()!);
      print('AGE:');
      age = int.parse(stdin.readLineSync()!);
      print('ADDRESS:');
      String address = stdin.readLineSync()!;
      print('EMAIL:');
      String email = stdin.readLineSync()!;
      print('PHONE:');
      phone = int.parse(stdin.readLineSync()!);

      s.addStudent(Student(
          name: name,
          id: id,
          age: age,
          address: address,
          email: email,
          phone: phone));
    }
    if (n == 2) {
      print('Enter id');
      int id = int.parse(stdin.readLineSync()!);
      if (s.checkExist(id)) {
        s.removeStudent(id);
      } else {
        print('no student to remove');
      }
    }
    if (n == 3) {
      print('Enter id');
      int id = int.parse(stdin.readLineSync()!);
      if (s.checkExist(id)) {
        print('Enter subject');

        String subject = stdin.readLineSync()!;
        print('Enter grade');
        double grade = double.parse(stdin.readLineSync()!);

        s.addSubject(id, subject, grade);
      } else {
        print('no student to add subject');
        continue;
      }
    }
    if (n == 5) {
      print("Enter id:");
      int id = int.parse(stdin.readLineSync()!);
      if (s.checkExist(id)) {
        s.printStudentdata(id);
      } else {
        print('no student to show data');
      }
    }
    if (n == 4) {
      break;
    }
    if (n == 6) {
      print("Enter id:");
      int id = int.parse(stdin.readLineSync()!);
      if (s.checkExist(id)) {
        s.calculateStudentgrade(id);
      } else {
        print('no student to calculate grade');
      }
    }
  }
}

class Person {
  String name, address;
  int age, id;

  Person({
    required this.name,
    required this.id,
    required this.age,
    required this.address,
  });
}

class Student extends Person {
  String email;
  int phone;
  //List<Map<String, double>> grades = [];
  Map<String, double> grades = {};
  Student({
    required String name,
    required int id,
    required int age,
    required String address,
    required this.email,
    required this.phone,
  }) : super(name: name, id: id, age: age, address: address);

  void addSubject(String name, double grade) {
    grades[name] = grade;
  }

  void studentData() {
    grades.forEach((key, value) {
      print('$key : $value');
    });
  }
}

class Students {
  List<Student> students = [];
  void addStudent(Student s) {
    students.add(s);
  }

  void removeStudent(int id) {
    students.removeWhere((element) => element.id == id);
  }

  void printStudentdata(int id) {
    print(
        'Name:${students.singleWhere((element) => element.id == id).name}\n ID:${students.singleWhere((element) => element.id == id).id}\n Age:${students.singleWhere((element) => element.id == id).age}  ');
    students.singleWhere((element) => element.id == id).studentData();
  }

  void addSubject(int id, String subject, double grade) {
    students
        .singleWhere((element) => element.id == id)
        .addSubject(subject, grade);
  }

  void calculateStudentgrade(int id) {
    students
        .singleWhere((element) => element.id == id)
        .grades
        .forEach((key, value) {
      if (value >= 50.0) {
        print('$key : PASS');
      } else {
        print('$key : FAIL');
      }
    });
  }

  bool checkExist(int id) {
    Student? s = students.singleWhere((element) => element.id == id);
    if (students.contains(s)) {
      return true;
    } else {
      return false;
    }
  }
}
