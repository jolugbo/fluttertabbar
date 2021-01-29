import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class PopulationData {
  int year;
  int population;
  charts.Color barColor;
  PopulationData({
    @required this.year,
    @required this.population,
    @required this.barColor
  });
}

final List<PopulationData> samplePopulationData = [
//  PopulationData(
//      year: 1880,
//      population: 50189209,
//      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)
//  ),
//  PopulationData(
//      year: 1890,
//      population: 62979766,
//      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)
//  ),
//  PopulationData(
//      year: 1900,
//      population: 76212168,
//      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)
//  ),
//  PopulationData(
//      year: 1910,
//      population: 92228496,
//      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue)
//  ),
  PopulationData(
      year: 1920,
      population: 106021537,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue)
  ),
  PopulationData(
      year: 1930,
      population: 123202624,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue)
  ),
  PopulationData(
      year: 1940,
      population: 132164569,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue)
  ),
  PopulationData(
      year: 1950,
      population: 151325798,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue)
  ),
  PopulationData(
      year: 1960,
      population: 179323175,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue)
  ),
  PopulationData(
      year: 1970,
      population: 203302031,
      barColor: charts.ColorUtil.fromDartColor(Colors.purple)
  ),
  PopulationData(
      year: 1980,
      population: 226542199,
      barColor: charts.ColorUtil.fromDartColor(Colors.purple)
  ),
  PopulationData(
      year: 1990,
      population: 248709873,
      barColor: charts.ColorUtil.fromDartColor(Colors.purple)
  ),
  PopulationData(
      year: 2000,
      population: 281421906,
      barColor: charts.ColorUtil.fromDartColor(Colors.purple)
  ),
  PopulationData(
      year: 2010,
      population: 307745538,
      barColor: charts.ColorUtil.fromDartColor(Colors.black)
  ),
  PopulationData(
      year: 2017,
      population: 323148586,
      barColor: charts.ColorUtil.fromDartColor(Colors.black)
  ),
];