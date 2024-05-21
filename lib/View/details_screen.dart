// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:covid_tracker/widgets/reusable_row.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsSecreen extends StatefulWidget {
  String name;
  String image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      todayRecovered,
      active,
      critical,
      updated,
      test;
  DetailsSecreen({
    Key? key,
    required this.name,
    required this.image,
    required this.totalDeaths,
    required this.totalCases,
    required this.totalRecovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.updated,
    required this.test,
  }) : super(key: key);

  @override
  State<DetailsSecreen> createState() => _DetailsSecreenState();
}

class _DetailsSecreenState extends State<DetailsSecreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * .05,
                    horizontal: MediaQuery.of(context).size.height * .03),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * .06,),
                      ReusableRow(title: 'Cases', value: widget.totalCases.toString()),
                      ReusableRow(title: 'Deaths', value: widget.totalDeaths.toString()),
                      ReusableRow(title: 'Recoverd Today', value: widget.todayRecovered.toString()),
                      ReusableRow(title: 'Total Recovered', value: widget.totalRecovered.toString()),
                      ReusableRow(title: 'Active', value: widget.active.toString()),
                      ReusableRow(title: 'Test', value: widget.test.toString()),
                      ReusableRow(title: 'Updated', value: widget.updated.toString()),
                      ReusableRow(title: 'Critical', value: widget.critical.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
