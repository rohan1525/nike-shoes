import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class RowItemsWidget extends StatelessWidget {
  const RowItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 1; i < 5; i++)
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10,left: 15),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey,
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20,right: 40),
                      height: 110,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Image.asset(
                      "images/$i.png",
                      height: 150,
                      width: 150,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nike Shoe",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Men's Shoe",
                        style: TextStyle(
                          color: Colors.blueGrey.withOpacity(0.8),
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            "\₹3,995",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 70),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              CupertinoIcons.cart_fill_badge_plus,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
