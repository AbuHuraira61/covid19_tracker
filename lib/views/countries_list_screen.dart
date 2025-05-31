import 'package:covid19_tracker/Provider/stats_provider.dart';
import 'package:covid19_tracker/views/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search Country',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: Consumer<StatsProvider>(
              builder: (BuildContext context, StatsProvider value, Widget? child) {
                return FutureBuilder(
                  future: value.countriesListApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.white,
                                  ),
                                  title: Container(
                                    width: 100,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index].country;

                          if (searchController.text.isEmpty) {
                            return InkWell(
                              onTap: () {
                                value.updateCountryList(
                                  image:
                                      snapshot.data![index].countryInfo!.flag
                                          ?? '',
                                  name: snapshot.data![index].country,
                                  totalCases: snapshot.data![index].cases,
                                  totalRecovered:
                                      snapshot.data![index].recovered,
                                  totalDeaths: snapshot.data![index].deaths,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading:
                                    snapshot.data![index].countryInfo == null ? SizedBox() : snapshot.data![index]!.countryInfo!.flag !=
                                        null
                                    ? Image(
                                        height: 50,
                                        width: 80,
                                        image: NetworkImage(
                                          snapshot
                                              .data![index]
                                              .countryInfo!
                                              .flag!,
                                        ),
                                      )
                                    : SizedBox(
                                        height: 50,
                                        width: 80,
                                        child:
                                            Placeholder(), // or any default widget/image
                                      ),

                                title: Text(snapshot.data![index].country),
                                subtitle: Text(
                                  'Cases: ${snapshot.data![index].cases}',
                                ),
                              ),
                            );
                          } else if (name.toLowerCase().contains(
                            searchController.text.toLowerCase(),
                          )) {
                            return InkWell(
                              onTap: () {
                                value.updateCountryList(
                                  image: snapshot.data![index].countryInfo!.flag
                                      .toString(),
                                  name: snapshot.data![index].country
                                      .toString(),
                                  totalCases: snapshot.data![index].cases
                                      .toInt(),
                                  totalRecovered: snapshot
                                      .data![index]
                                      .recovered
                                      .toInt(),
                                  totalDeaths: snapshot.data![index].deaths
                                      .toInt(),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: Image(
                                  height: 50,
                                  width: 80,
                                  image: NetworkImage(
                                    snapshot.data![index].countryInfo!.flag
                                        as String,
                                  ),
                                ),

                                title: Text(snapshot.data![index].country),
                                subtitle: Text(
                                  'Cases: ${snapshot.data![index].cases}',
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return Center(child: Text('No data available'));
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
