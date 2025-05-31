import 'dart:core';

import 'package:covid19_tracker/Provider/stats_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {

  

  const DetailScreen() ;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StatsProvider>(builder: (context, StatsProvider value, child){
          return Scaffold(
      appBar: AppBar(
        title: Text('Details of ${value.countrylist.last['name']}'),
        centerTitle: true,

      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
          
                  Padding(
                    padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * .06,),
                          ReusableRow(title: 'Total Cases', value: value.countrylist.last['totalCases'].toString()),
                          ReusableRow(title: 'Total Deaths', value: value.countrylist.last['totalDeaths'].toString()),
                          ReusableRow(title: 'Total Recovered', value: value.countrylist.last['totalRecovered'].toString()),
          
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: Image(
                      height: 80,
                      width: 150,
                      image: NetworkImage(value.countrylist.last['image']), ),
                       
                    
                  ),
                ],
              )
          
            ],
          ),
        
      
        
      ),
    );
    });
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