import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:nike_shoes/AllItemsWidget.dart';
import 'package:nike_shoes/HomeBottomNavBar.dart';
import 'package:nike_shoes/RowItemsWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.sort,
                        size: 30,
                          color: Colors.blueGrey,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: badges.Badge(
                          badgeStyle: badges.BadgeStyle(
                        shape: badges.BadgeShape.circle,
                        badgeColor: Colors.redAccent,
                            padding: EdgeInsets.all(7),
                          ),
                        badgeContent: Text(
                          "3",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: Icon(
                          Icons.notifications,
                          size: 30,
                          color: Colors.blueGrey,
                        ),
                      ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.search,
                      size: 27,
                      color: Colors.blueGrey,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              RowItemsWidget(),
              SizedBox(height: 20),
              AllItemsWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
