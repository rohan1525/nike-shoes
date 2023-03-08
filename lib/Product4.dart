import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nike_shoes/ItemBottomNavBar.dart';
import 'package:http/http.dart' as http;

class Product4 extends StatelessWidget {
  const Product4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: getWebFromServer(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return  Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
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
                                Icons.arrow_back,
                                size: 30,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.43,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 230,
                            width: 230,
                            margin: const EdgeInsets.only(top: 20,right: 70),
                          ),
                          Image.network(
                            (jsonDecode(
                                snapshot.data!.body.toString())[3]
                            ['Product_Image']),
                            height: 350,
                            width: 350,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Text(
                                (jsonDecode(
                                    snapshot.data!.body.toString())[3]
                                ['Product_Name']),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Text(
                                (jsonDecode(
                                    snapshot.data!.body.toString())[3]
                                ['Product_Price']),
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemSize: 20,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (index) {},
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            (jsonDecode(
                                snapshot.data!.body.toString())[3]
                            ['Product_Description']),
                            style: const TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Text(
                                "Size:",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Row(
                                children: [
                                  for (int i = 7;i < 12;i++)
                                    Container(
                                      height: 35,
                                      width: 35,
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.blueGrey.withOpacity(0.3),
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        i.toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const ItemBottomNavBar(),
          );
        }
        else{
          return  Scaffold(
            body: Container(
              padding:
              EdgeInsets
                  .only(
                  top: MediaQuery.of(context).size.width),
              child: Column(
                children: const [
                  Center(
                      child:
                      CircularProgressIndicator()),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Loading...",
                    style: TextStyle(
                        color: Colors
                            .black,
                        fontSize:
                        25),
                  )
                ],
              ),
            ),
          );
        }
      },

    );
  }
  Future<http.Response> getWebFromServer() async {
    var response = await http.get(
        Uri.parse("https://63f743a0e8a73b486af41620.mockapi.io/nike_shoes"));
    return response;
  }
}
