// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: unused_import
import 'dart:async';

import 'package:covid_tracker/models/services/state_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:covid_tracker/utils/colors.dart';

import '../models/world_states_model.dart';
import '../widgets/reusable_row.dart';

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
    //! services
    StateServices _stateServices = StateServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .01),
                FutureBuilder(
                  future: _stateServices.fetchWorldStateRecords(),
                  builder: (BuildContext context,
                      AsyncSnapshot<WorldStatesModels> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 50.0,
                          controller: _animationController,
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          PieChart(
                  dataMap:  {
                    "Total": double.parse(snapshot.data!.cases!.toString()),
                    "Recover": double.parse(snapshot.data!.recovered!.toString()),
                    "Death": double.parse(snapshot.data!.deaths!.toString()),
                  },
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValuesInPercentage: true
                  ),
                  chartType: ChartType.ring,
                  colorList: colorList,
                  chartRadius: MediaQuery.of(context).size.width / 3.2,
                  legendOptions: const LegendOptions(
                    legendPosition: LegendPosition.left,
                    //legendShape: BoxShape.circle
                  ),
                  animationDuration: const Duration(milliseconds: 1200),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .05,
                      horizontal: MediaQuery.of(context).size.height * .03),
                  child: Card(
                    child: Column(
                      children: [
                        ReusableRow(title: 'Updated', value: snapshot.data!.updated.toString()),
                        ReusableRow(title: 'Cases', value: snapshot.data!.cases.toString()),
                        ReusableRow(title: 'Today Cases', value: snapshot.data!.todayCases.toString()),
                        ReusableRow(title: 'Deaths', value: snapshot.data!.deaths.toString()),
                        ReusableRow(title: 'Today Deaths', value: snapshot.data!.todayDeaths.toString()),
                        ReusableRow(title: 'Recovers', value: snapshot.data!.recovered.toString()),
                        ReusableRow(title: 'Today Recoverd', value: snapshot.data!.todayRecovered.toString()),
                        ReusableRow(title: 'Active', value: snapshot.data!.active.toString()),
                        ReusableRow(title: 'Critical', value: snapshot.data!.critical.toString()),
                        ReusableRow(title: 'CasesPerOneMilliom', value: snapshot.data!.casesPerOneMillion.toString()),
                        ReusableRow(title: 'DeathPerOneMillion', value: snapshot.data!.deathsPerOneMillion.toString()),
                        ReusableRow(title: 'Tests', value: snapshot.data!.tests.toString()),
                        ReusableRow(title: 'TestPerOneMillion', value: snapshot.data!.testsPerOneMillion.toString()),
                        ReusableRow(title: 'Population', value: snapshot.data!.population.toString()),
                        ReusableRow(title: 'OneCasesPerPeople', value: snapshot.data!.oneCasePerPeople.toString()),
                        ReusableRow(title: 'OneDeathPerPeople', value: snapshot.data!.oneDeathPerPeople.toString()),
                        ReusableRow(title: 'OneTestPerPeople', value: snapshot.data!.oneTestPerPeople.toString()),
                        ReusableRow(title: 'ActivePerOneMillion', value: snapshot.data!.activePerOneMillion.toString()),
                        ReusableRow(title: 'RecoveredPerOneMillion', value: snapshot.data!.recoveredPerOneMillion.toString()),
                        ReusableRow(title: 'CriticalPerOneMillion', value: snapshot.data!.criticalPerOneMillion.toString()),
                        ReusableRow(title: 'AffectedCountries', value: snapshot.data!.affectedCountries.toString()),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .05,
                      horizontal: MediaQuery.of(context).size.height * .03),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  height: 50,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      'Track Countries',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                        ],
                      );
                    }
                  },
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

