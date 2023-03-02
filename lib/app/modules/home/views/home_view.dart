import 'package:cuaca_app/app/modules/home/views/home_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> jam = ['00:00', '06:00', '12:00', '18:00'];
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 150),
            child: Text(
              "Yogyakarta",
              style: TextStyle(fontSize: 40),
            ),
          ),
          Text(
            '30\u00B0',
            style: TextStyle(fontSize: 90),
          ),
          Image.network('https://ibnux.github.io/BMKG-importer/icon/0.png'),
          Text("2 Maret 2022"),
          Text(
            'Cerah',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "Hari ini",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 150,
                      child: FutureBuilder(
                        future: homeController.getData(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                var post =
                                    (snapshot.data as List<HomeModel>)[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    width: 130,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        children: [
                                          Text(jam[index]),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Icon(post.cuaca == "Berawan"
                                              ? Icons.cloud_outlined
                                              : Icons.cloudy_snowing),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(post.cuaca),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(post.tempC + '\u00B0'),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          } else {
                            return Center(
                              child: Text("Data Masih Kosong"),
                            );
                          }
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
