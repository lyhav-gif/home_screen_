import 'package:flutter/material.dart';

class SubjectDetailScreen extends StatelessWidget {
  final String titleName;
  final String time;
  final int index;
  final String teacher;
  final String duration;
  final String date;
  const SubjectDetailScreen({
    super.key,
    required this.titleName,
    required this.time,
    required this.index,
    required this.teacher,
    required this.duration,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleName, style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: _buildBody,
    );
  }

  get _buildBody => Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(index.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Time: $time', style: TextStyle(fontWeight: FontWeight.bold)),
        Text(
          'Title Name : $titleName',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Teacher Name : $teacher',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Duration : $duration',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('Date : $date', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
