import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:nike_shoes/AllItemsWidget.dart';
import 'package:nike_shoes/HomeBottomNavBar.dart';
import 'package:nike_shoes/RowItemsWidget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<http.Response>(
        future: getWebFromServer(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
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
                          child: const Icon(
                            Icons.sort,
                            size: 30,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
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
                          child: const badges.Badge(
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
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.search,
                          size: 27,
                          color: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const RowItemsWidget(),
                  const SizedBox(height: 20),
                  const AllItemsWidget(),
                ],
              ),
            );
          }
          else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                    child:
                    CircularProgressIndicator()),
                SizedBox(
                  height: 5,
                ),
                Text("Loading..",style: TextStyle(color: Colors.black,fontSize: 20)),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }

  Future<http.Response> getWebFromServer() async {
    var response = await http.get(
        Uri.parse("https://63f743a0e8a73b486af41620.mockapi.io/nike_shoes"));
    return response;
  }
}
