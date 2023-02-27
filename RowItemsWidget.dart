import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class RowItemsWidget extends StatelessWidget {
  const RowItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: FutureBuilder<http.Response>(
        future: getWebFromServer(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 10,bottom: 10,left: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
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
                              margin: const EdgeInsets.only(top: 20,right: 40),
                              height: 110,
                              width: 120,
                            ),
                            Image.network(
                              (jsonDecode(
                                  snapshot.data!.body.toString())[0]
                              ['Product_Image']),
                              height: 120,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text( (jsonDecode(
                                snapshot.data!.body.toString())[0]
                             ['Product_Name']),
                                style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                               (jsonDecode(
                                snapshot.data!.body.toString())[0]
                               ['Product_Information']),
                                style:  TextStyle(
                                  color: Colors.blueGrey.withOpacity(0.8),
                                  fontSize: 16,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                   Text(
                                    (jsonDecode(
                                        snapshot.data!.body.toString())[0]
                                    ['Product_Price']),
                                    style: const  TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 70),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
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
                Container(
                  margin: const EdgeInsets.only(top: 10,bottom: 10,left: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
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
                            margin: const EdgeInsets.only(top: 20,right: 40),
                            height: 110,
                            width: 120,
                          ),
                          Image.network(
                            (jsonDecode(
                                snapshot.data!.body.toString())[1]
                            ['Product_Image']),
                            height: 120,
                            width: 120,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text( (jsonDecode(
                                snapshot.data!.body.toString())[1]
                            ['Product_Name']),
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              (jsonDecode(
                                  snapshot.data!.body.toString())[1]
                              ['Product_Information']),
                              style:  TextStyle(
                                color: Colors.blueGrey.withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  (jsonDecode(
                                      snapshot.data!.body.toString())[1]
                                  ['Product_Price']),
                                  style: const  TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 70),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
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
                Container(
                  margin: const EdgeInsets.only(top: 10,bottom: 10,left: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
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
                            margin: const EdgeInsets.only(top: 20,right: 40),
                            height: 110,
                            width: 120,
                          ),
                          Image.network(
                            (jsonDecode(
                                snapshot.data!.body.toString())[2]
                            ['Product_Image']),
                            height: 120,
                            width: 120,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text( (jsonDecode(
                                snapshot.data!.body.toString())[2]
                            ['Product_Name']),
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              (jsonDecode(
                                  snapshot.data!.body.toString())[2]
                              ['Product_Information']),
                              style:  TextStyle(
                                color: Colors.blueGrey.withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  (jsonDecode(
                                      snapshot.data!.body.toString())[2]
                                  ['Product_Price']),
                                  style: const  TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 70),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
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
                Container(
                  margin: const EdgeInsets.only(top: 10,bottom: 10,left: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
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
                            margin: const EdgeInsets.only(top: 20,right: 40),
                            height: 110,
                            width: 120,
                          ),
                          Image.network(
                            (jsonDecode(
                                snapshot.data!.body.toString())[3]
                            ['Product_Image']),
                            height: 120,
                            width: 120,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text( (jsonDecode(
                                snapshot.data!.body.toString())[3]
                            ['Product_Name']),
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              (jsonDecode(
                                  snapshot.data!.body.toString())[3]
                              ['Product_Information']),
                              style:  TextStyle(
                                color: Colors.blueGrey.withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  (jsonDecode(
                                      snapshot.data!.body.toString())[3]
                                  ['Product_Price']),
                                  style: const  TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 70),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
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
    );
  }
  Future<http.Response> getWebFromServer() async {
    var response = await http.get(
        Uri.parse("https://63f743a0e8a73b486af41620.mockapi.io/nike_shoes"));
    return response;
  }
}
