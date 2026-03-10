import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardHomeWidget extends StatefulWidget {
  final String name;
  final String urlImage;
  final List slideRowTitle;
  final bool isUrlNetwork;
  // final void Function(DateTime)? onDateChange;
  const CardHomeWidget({
    super.key,
    required this.name,
    required this.urlImage,
    required this.slideRowTitle,
    this.isUrlNetwork = true,
    // this.onDateChange,
   
  });
  @override
  State<CardHomeWidget> createState() => _CardHomeWidgetState();
}

class _CardHomeWidgetState extends State<CardHomeWidget> {
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

  final List<String> _bottomCardTitle = ["A-", "90-92", "3.7"];
  final List<String> _bottomCardSubTitle = ["Letter grade", "Grade, %", "GPA"];

  @override
  Widget build(BuildContext context) {
    return _buildCard;
  }

  Column get _buildCard => Column(
    children: [
      SizedBox(height: 72),
      Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 1, 49, 121),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  spacing: 14,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "9th Grade",
                      style: GoogleFonts.poppins(
                        color: Colors.white.withAlpha(90),
                        fontSize: 14,
                      ),
                    ),

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
              margin: EdgeInsets.all(30),
              height: 85,
              width: 85,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image:
                      //widget.urlImage.startwith('http')?NetworkImage(widget.urlImage):AssetImage(widget.urlImage),
                      widget.isUrlNetwork == true
                      ? NetworkImage(widget.urlImage)
                      : AssetImage(widget.urlImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
        ],
      ),
    ],
  );
  SingleChildScrollView get _slideRow => SingleChildScrollView(
    padding: EdgeInsets.only(left: 10),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(
        widget.slideRowTitle.length,
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
                widget.slideRowTitle[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ),
  );
  Container get _bottomCard => Container(
    padding: EdgeInsets.all(16),
    height: 120,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: const Color.fromARGB(255, 4, 37, 87),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        _bottomCardSubTitle.length,
        (index) => Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(16),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _bottomCardTitle[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  _bottomCardSubTitle[index],
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white.withAlpha(90),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
