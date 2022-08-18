import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constants/images.dart';
import '../../controller/HomeController.dart';
import '../../widget/myList.dart';
import '../../widget/my_chart.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (controller) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/pexels.jpg'),
                  fit: BoxFit.fill)),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter:
                          ColorFilter.mode(Colors.black38, BlendMode.darken),
                      image: AssetImage(
                        'assets/images/climate_weather.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          leading: IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                        child: TextField(
                          onChanged: (value) => controller.city = value,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) => controller.updateWeather(),
                          decoration: InputDecoration(
                            suffix: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: 'Search',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.0, 1.2),
                        child: SizedBox(
                          height: 5,
                          width: 10,
                          child: OverflowBox(
                            maxWidth: MediaQuery.of(context).size.width,
                            maxHeight:
                                (MediaQuery.of(context).size.height / 3.5),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.yellow,
                                            Colors.green,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Card(
                                      elevation: 0,
                                      color: Colors.transparent,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 3, left: 20, right: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Center(
                                                    child: Text(
                                                      '${controller.currentWeatherData.name}'
                                                          .toUpperCase(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      DateFormat()
                                                          .add_MMMMEEEEd()
                                                          .format(
                                                              DateTime.now()),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 50),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        '${controller.currentWeatherData.weather![0].description}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption!
                                                            .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 22,
                                                            ),
                                                      ),
                                                      Text(
                                                        '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline2!
                                                            .copyWith(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                      ),
                                                      Text(
                                                        'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption!
                                                            .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      right: 20),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        width: 120,
                                                        height: 120,
                                                        child: LottieBuilder
                                                            .asset(Images
                                                                .cloudyAnim),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          'wind ${controller.currentWeatherData.wind!.speed} m/s',
                                                          style:Theme.of(context) .textTheme.caption!
                                                                  .copyWith(
                                                                    color: Colors.white,
                                                                    fontSize:14,
                                                                    fontWeight:FontWeight.bold,
                                                           ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Expanded(
                  flex: 2,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          padding: EdgeInsets.only(top: 120),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  child: Text(
                                    'other city'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                MyList(),
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        ' next 5 days'.toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                      ),
                                      Icon(
                                        Icons.next_plan_outlined,
                                        color: Colors.black45,
                                      ),
                                    ],
                                  ),
                                ),
                                MyChart(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
