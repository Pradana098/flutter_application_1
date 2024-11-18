import 'package:flutter/material.dart';
import 'package:flutter_application_1/siswa_provider.dart';
import 'package:provider/provider.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Presensi Siswa'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Consumer<AttendanceProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: provider.students.length,
                  itemBuilder: (context, index) {
                    final student = provider.students[index];
                    return CheckboxListTile(
                      title: Text(student.name),
                      value: student.isPresent,
                      onChanged: (_) => provider.toggleAttendance(index),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: provider.hasStudents && provider.hasCheckedStudents
                      ? () {
                          provider.saveAttendance();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Kehadiran tersimpan')),
                          );
                        }
                      : null,
                  child: Text('Simpan'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}