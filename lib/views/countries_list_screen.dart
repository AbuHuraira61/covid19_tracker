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
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<StatsProvider>(context, listen: false);
      provider.fetchCountriesList();
    });
  }



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

                if (value.isLoading) {
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
                } else {
                  final countries = value.countriesList;
                  return ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (context, index) {
                    String name = countries[index].country;

                    if (searchController.text.isEmpty) {
                    return InkWell(
                      onTap: () {
                      value.updateCountryList(
                        image: countries[index].countryInfo?.flag ?? '',
                        name: countries[index].country,
                        totalCases: countries[index].cases,
                        totalRecovered: countries[index].recovered,
                        totalDeaths: countries[index].deaths,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => DetailScreen(),
                        ),
                      );
                      },
                      child: ListTile(
                      leading: countries[index].countryInfo == null
                        ? SizedBox()
                        : countries[index].countryInfo!.flag != null
                          ? Image(
                            height: 50,
                            width: 80,
                            image: NetworkImage(
                              countries[index].countryInfo!.flag!,
                            ),
                            )
                          : SizedBox(
                            height: 50,
                            width: 80,
                            child: Placeholder(),
                            ),
                      title: Text(countries[index].country),
                      subtitle: Text(
                        'Cases: ${countries[index].cases}',
                      ),
                      ),
                    );
                    } else if (name.toLowerCase().contains(
                    searchController.text.toLowerCase(),
                    )) {
                    return InkWell(
                      onTap: () {
                      value.updateCountryList(
                        image: countries[index].countryInfo?.flag ?? '',
                        name: countries[index].country,
                        totalCases: countries[index].cases,
                        totalRecovered: countries[index].recovered,
                        totalDeaths: countries[index].deaths,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => DetailScreen(),
                        ),
                      );
                      },
                      child: ListTile(
                      leading: countries[index].countryInfo != null &&
                          countries[index].countryInfo!.flag != null
                        ? Image(
                          height: 50,
                          width: 80,
                          image: NetworkImage(
                            countries[index].countryInfo!.flag!,
                          ),
                          )
                        : SizedBox(
                          height: 50,
                          width: 80,
                          child: Placeholder(),
                          ),
                      title: Text(countries[index].country),
                      subtitle: Text(
                        'Cases: ${countries[index].cases}',
                      ),
                      ),
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
    );
  }
}
