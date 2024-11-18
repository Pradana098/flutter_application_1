import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/record.dart';
import 'package:flutter_application_1/siswa.dart';

class AttendanceProvider with ChangeNotifier {
  List<Student> _students = [
    Student(name: 'Ali'),
    Student(name: 'Budi'),
    Student(name: 'Citra'),
  ];

  List<AttendanceRecord> _records = [];

  List<Student> get students => _students;
  List<AttendanceRecord> get records => _records;

  void toggleAttendance(int index) {
    _students[index].isPresent = !_students[index].isPresent;
    notifyListeners();
  }

  void saveAttendance() {
    final presentCount = _students.where((s) => s.isPresent).length;
    final absentCount = _students.length - presentCount;

    _records.insert(
      0,
      AttendanceRecord(
        date: DateTime.now(),
        present: presentCount,
        absent: absentCount,
      ),
    );

    // Reset attendance
    for (var student in _students) {
      student.isPresent = false;
    }

    notifyListeners();
  }

  bool get hasStudents => _students.isNotEmpty;
  bool get hasCheckedStudents => _students.any((student) => student.isPresent);
}