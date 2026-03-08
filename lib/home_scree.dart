import 'package:flutter/material.dart';

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

  final List<IconData> _slideRowIcon = [
    Icons.shopping_basket_outlined,
    Icons.book,
    Icons.bookmarks_outlined,
    Icons.school_outlined,
    Icons.slideshow_outlined,
  ];

  final List<Color> _slideRowColor = [
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.red,
  ];
  get _buildBody => Column(
    children: [
      SizedBox(height: 68),
      Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            height: 370,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 14, 66, 156),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  spacing: 5,
                  children: [
                    Text(
                      "Voerun Lyhav",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "9th Grade",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white54,
                      ),
                    ),
                    SizedBox(),
                    _slideRow,
                    _bottomCard,
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -40,
            child: Container(
              margin: EdgeInsets.all(20),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
        ],
      ),
    ],
  );
  get _slideRow => SingleChildScrollView(
    padding: EdgeInsets.only(left: 10),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(
        5,
        (index) => Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(10),
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            spacing: 10,
            children: [
              Container(
                height: 60,
                width: 40,
                decoration: BoxDecoration(
                  color: _slideRowColor[index],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(_slideRowIcon[index], color: Colors.white),
              ),
              Text(
                _slideRowTitle[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ),
  );
  get _bottomCard =>
      Container(color: const Color.fromARGB(255, 8, 50, 114), height: 128);
}
