import 'package:covid_tracker/models/services/state_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Countries extends StatefulWidget {
  const Countries({Key? key}) : super(key: key);

  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StateServices _stateServices = StateServices();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Added crossAxisAlignment
            children: [
              TextFormField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: 'Search with country name',
                ),
              ),
              Expanded(
                // Wrap FutureBuilder with Expanded
                child: FutureBuilder(
                  future: _stateServices.countriesListApi(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      //return const Center(child: CircularProgressIndicator());
                      return ListView.builder(
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Container(height: 50, width: 50, color: Colors.white,),
                                    title:
                                        Container(height: 10, width: 89, color: Colors.white,),
                                    subtitle: Container(height: 10, width: 89, color: Colors.white,),
                                  ),
                                ],
                              ),
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100);
                        },
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {

                          String name = snapshot.data![index]['country'];

                          if (_searchController.text.isEmpty) {
                            return Column(
                            children: [
                              ListTile(
                                leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(
                                    snapshot.data![index]['countryInfo']['flag'],
                                  ),
                                ),
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(
                                    'Cases: ${snapshot.data![index]['cases']}'),
                              ),
                            ],
                          );
                          } else if (name.toLowerCase().contains(_searchController.text.toLowerCase())) {
                            return Column(
                            children: [
                              ListTile(
                                leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(
                                    snapshot.data![index]['countryInfo']['flag'],
                                  ),
                                ),
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(
                                    'Cases: ${snapshot.data![index]['cases']}'),
                              ),
                            ],
                          );
                          } else {
                            return Container();
                          }
                          
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
