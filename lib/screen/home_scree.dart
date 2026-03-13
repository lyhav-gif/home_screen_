import 'package:flutter/material.dart';
import 'package:home_screen_/widget/DateTimeLineWidget.dart';
import 'package:home_screen_/widget/card_home_widget.dart';
import 'package:home_screen_/widget/schedule_card_widget.dart';

class HomeScree extends StatefulWidget {
  HomeScree({super.key});

  @override
  State<HomeScree> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody);
  }

  final List<String> _slideRowTitle = [
    "Academix success",
    "Test success",
    "Exam success",
    "Final success",
    "Graduation success",
  ];

  DateTime selectDate = DateTime.now();

  void onChangeDate(DateTime dateValue) {
    setState(() {
      selectDate = dateValue;
    });
  }

  Column get _buildBody {
    return Column(
      children: [
        CardHomeWidget(
          name: 'Voeurn Lyhav',
          urlImage: "assets/images/ai2.jpg",
          isUrlNetwork: false,
          // urlImage:'https://masterpiecer-images.s3.yandex.net/71ec09467d0211eea51192669a1675b3:upscaled',
          slideRowTitle: _slideRowTitle,
        ),
        Datetimelinewidget(
          activeColor: Colors.black,
          initialDate: DateTime.now(),
          onDateChange: onChangeDate,
        ),
        _buildSchedule(selectDate),
      ],
    );
  }

  Widget _buildSchedule(DateTime dateValue) {
    final Map<String, List<Map<String, String>>> schedules = {
      "2026-03-13": [
        {
          "time": "07:30 - 09:00",
          "subject": "Networks",
          "teacher": "Dr. Ouk Khean",
          "duration": "90 min",
        },
        {
          "time": "09:00 - 10:30",
          "subject": "Back-End",
          "teacher": "Mr Meng Hann",
          "duration": "90 min",
        },
      ],
      "2026-03-16": [
        {
          "time": "07:30 - 09:00",
          "subject": ".Net",
          "teacher": "Mr.Heng Sam An",
          "duration": "90 mn",
        },
        {
          "time": "09:00 - 10:30",
          "subject": "Statistics",
          "teacher": "Dr. Chor Chandara",
          "duration": "90 min",
        },
      ],
      "2026-03-17": [
        {
          "time": "07:30 - 09:00",
          "subject": "Networks",
          "teacher": "Dr. Ouk Khean",
          "duration": "90 min",
        },
        {
          "time": "09:00 - 10:30",
          "subject": "ISDD",
          "teacher": "Mr. Oussaphea",
          "duration": "90 min",
        },
      ],
      "2026-03-18": [
        {
          "time": "07:30 - 09:00",
          "subject": "ISDD",
          "teacher": "Mr. Oussaphea",
          "duration": "90 min",
        },
        {
          "time": "09:00 - 10:30",
          "subject": "Statistics",
          "teacher": "Dr. Chor Chandara",
          "duration": "90 min",
        },
      ],
      "2026-03-19": [
        {
          "time": "07:30 - 09:00",
          "subject": ".Net",
          "teacher": "Mr. Heng Sam An",
          "duration": "90 min",
        },
        {
          "time": "09:00 - 10:30",
          "subject": "Back-End",
          "teacher": "Mr. Meng Hann",
          "duration": "90 min",
        },
      ],
      "2026-03-20": [
        {
          "time": "07:30 - 09:00",
          "subject": "Networks",
          "teacher": "Dr. Ouk Khean",
          "duration": "90 min",
        },
        {
          "time": "09:00 - 10:30",
          "subject": "Back-End",
          "teacher": "Mr Meng Hann",
          "duration": "90 min",
        },
      ],
    };

    String dateKey =
        "${dateValue.year}-${dateValue.month.toString().padLeft(2, '0')}-${dateValue.day.toString().padLeft(2, '0')}";

    List<Map<String, String>> selectedSchedule = schedules[dateKey] ?? [];

    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(left: 8, right: 8, top: 15),
        itemCount: selectedSchedule.length,
        itemBuilder: (context, index) {
          return ScheduleCardWidget(
            time: selectedSchedule[index]["time"]!,
            subject: selectedSchedule[index]["subject"]!,
            teacher: selectedSchedule[index]["teacher"]!,
            duration: selectedSchedule[index]["duration"]!,
            onTap: () {
              // _navigateAndDisplaySelection(
              //   context,
              //   index: index,
              //   titleName: selectedSchedule[index]["subject"]!,
              //   time: selectedSchedule[index]["time"]!,
              //   teacher: selectedSchedule[index]["teacher"]!,
              //   data: dateKey,
              // );
            },
          );
        },
      ),
    );
  }
}
