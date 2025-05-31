import 'package:covid19_tracker/Provider/stats_provider.dart';
import 'package:covid19_tracker/views/countries_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class WorldStatsScreen extends StatefulWidget {
  const WorldStatsScreen({super.key});

  @override
  State<WorldStatsScreen> createState() => _WorldStatsScreenState();
}

class _WorldStatsScreenState extends State<WorldStatsScreen>
    with TickerProviderStateMixin {

         @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<StatsProvider>(context, listen: false);
      provider.fetchWorldStatsList();
    });
  }

   

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<StatsProvider>(
        builder: (BuildContext context, value, Widget? child) { 
  return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                
                    if (value.isLoading)... {
                       Padding(
        
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.4),
                        child: Center(
                          child: SpinKitFadingCircle(
                            color: Colors.blue,
                            size: 50.0,
                            controller: _controller,
                          ),
                        ),
                      ),
                    }else if (value.worldStats == null)... {
                       Center(
                        child: Text(
                          "Error",
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ),
                    }
        
                   else if (value.worldStats != null)... {
                       Column(
                        children: [
                          
                           SizedBox(
                            height: MediaQuery.of(context).size.height * .05,
                          ),
                          PieChart(
                            dataMap: {
                              "Total": double.parse(
                                value.worldStats!.cases.toString(),
                              ),
                              "Recovered": double.parse(
                                value.worldStats!.recovered.toString(),
                              ),
                              "Deaths": double.parse(
                                value.worldStats!.deaths.toString(),
                              ),
                            },
        
                            animationDuration: const Duration(milliseconds: 1200),
                            chartRadius: 150,
                            chartType: ChartType.ring,
                            colorList: const [
                              Colors.blue,
                              Colors.green,
                              Colors.red,
                            ],
                            legendOptions: const LegendOptions(
                              showLegends: true,
                              legendPosition: LegendPosition.left,
                            ),
                            chartValuesOptions: const ChartValuesOptions(
                            
                              showChartValuesInPercentage: true
                            ),
        
                           
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .05,
                          ),
                          ReusableRow(
                            title: "Total",
                            value: value.worldStats!.cases.toString(),
                          ),
                            ReusableRow(
                            title: "Deaths",
                            value: value.worldStats!.deaths.toString(),
                          ),
                          ReusableRow(
                            title: "Recovered",
                            value: value.worldStats!.recovered.toString(),
                          ),
                            ReusableRow(
                            title: "Active",
                            value: value.worldStats!.active.toString(),
                          ),
                            ReusableRow(
                            title: "Critical",
                            value: value.worldStats!.critical.toString(),
                          ),
                            ReusableRow(
                            title: "Today Deaths",
                            value: value.worldStats!.todayDeaths.toString(),
                          ),  ReusableRow(
                            title: "Today Recovered",
                            value: value.worldStats!.todayRecovered.toString(),
                            
                          ),
        
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .05,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const CountriesListScreen();
                              },));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Countires List",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                                                  
                              
                            ),
                          ),
                            
                        ],
                      ),
                       
                     
        
                    } else ... {
                       const Center(child: Text("No data available")),
                    }
                 
              ],
            ),
          ),
        );
         },
      
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value ;
   ReusableRow({Key? key , required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10 , right: 10 , top: 10 , bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value)
            ],
          ),
          SizedBox(height: 5,),
          Divider()
        ],
      ),
    );
  }
}
