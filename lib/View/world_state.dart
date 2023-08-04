// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:covid_tracker/utils/colors.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({Key? key}) : super(key: key);

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen>
    with SingleTickerProviderStateMixin {
  //! To controll animatiom
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              PieChart(
                dataMap: const {
                  "Total": 200,
                  "Recover": 105,
                  "Death": 70,
                },
                chartType: ChartType.ring,
                colorList: colorList,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                legendOptions: const LegendOptions(
                  legendPosition: LegendPosition.left,
                  //legendShape: BoxShape.circle
                ),
                animationDuration: const Duration(milliseconds: 1200),
              ),
              //SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .05,
                    horizontal: MediaQuery.of(context).size.height * .03),
                child: Card(
                  child: Column(
                    children: [
                      ReusableRow(title: 'Total', value: '200'),
                      ReusableRow(title: 'Recover', value: '105'),
                      ReusableRow(title: 'Total', value: '70'),
                    ],
                  ),
                ),
              ),
              Container(
                margin:  EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .05,
                    horizontal: MediaQuery.of(context).size.height * .03),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                height: 50,
                width: double.infinity,
                child: const Center(
                  child: Text('Track Countries', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title;
  String value;
  ReusableRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            
          ),
        ],
      ),
    );
  }
}
