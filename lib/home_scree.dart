import 'package:flutter/material.dart';

class HomeScree extends StatelessWidget {
  const HomeScree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody);
  }

  get _buildBody => Column(
    children: [
      SizedBox(height: 68),
      Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            height: 333,
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
                  spacing: 18,
                  children: [
                    Text(
                      "Voerun Lyhav",
                      style: TextStyle(
                        fontSize: 28,
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
                    _slideRow,
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
  get _slideRow => Row(
    children: [
      Container(
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
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.slideshow),
            ),
            Text(
              "Academix success",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ],
  );
}
