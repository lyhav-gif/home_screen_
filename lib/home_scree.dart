import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:home_screen_/widget/card_home_widget.dart';

class HomeScree extends StatelessWidget {
  HomeScree({super.key});

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

        EasyDateTimeLine(
              
              activeColor: const Color.fromARGB(255, 3, 42, 74),
              initialDate: DateTime.now(),
              onDateChange: (value) {},
              
            ),
       
      ],
    );
  }
}
