import 'package:flutter/material.dart';
import 'package:flutter_application_1/siswa_provider.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Kehadiran'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Consumer<AttendanceProvider>(
        builder: (context, provider, child) {
          if (provider.records.isEmpty) {
            return Center(
              child: Text('Belum ada riwayat kehadiran'),
            );
          }

          return ListView.builder(
            itemCount: provider.records.length,
            itemBuilder: (context, index) {
              final record = provider.records[index];
              return ListTile(
                title: Text(
                  '${record.date.day} ${_getMonthName(record.date.month)} ${record.date.year}',
                ),
                subtitle: Text(
                  'Hadir: ${record.present}, Tidak Hadir: ${record.absent}',
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
      'Jul', 'Ags', 'Sep', 'Okt', 'Nov', 'Des'
    ];
    return months[month - 1];
  }
}
