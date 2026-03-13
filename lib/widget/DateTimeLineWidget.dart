import 'package:easy_date_timeline/easy_date_timeline.dart'
    show
        DayStructure,
        DayStyle,
        EasyDateTimeLine,
        EasyDayProps,
        EasyHeaderProps;
import 'package:flutter/material.dart';

class Datetimelinewidget extends StatelessWidget {
  final void Function(DateTime)? onDateChange;
  final DateTime? initialDate;

  const Datetimelinewidget({
    super.key,
    this.onDateChange,
    this.initialDate,
    required Color activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      activeColor: Color.fromARGB(255, 3, 42, 74),

      initialDate: initialDate ?? DateTime.now(),

      onDateChange:
          onDateChange ??
          (selectDate) {
            debugPrint("select Date : ${selectDate.toLocal()}");
          },

      headerProps: const EasyHeaderProps(
        monthStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        showSelectedDate: false,
        showMonthPicker: false,
      ),

      dayProps: EasyDayProps(
        width: 50,
        height: 65,
        dayStructure: DayStructure.dayStrDayNum,

        todayStyle: DayStyle(
          borderRadius: 10,
          dayNumStyle: const TextStyle(
            color: Color.fromARGB(255, 3, 42, 74),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          dayStrStyle: const TextStyle(
            color: Color.fromARGB(255, 3, 42, 74),
            fontSize: 16,
          ),
        ),

        activeDayStyle: DayStyle(
          borderRadius: 10,
          dayNumStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          dayStrStyle: const TextStyle(color: Colors.white, fontSize: 16),
        ),

        inactiveDayStyle: DayStyle(
          borderRadius: 10,
          dayNumStyle: const TextStyle(
            color: Color.fromARGB(255, 3, 42, 74),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
