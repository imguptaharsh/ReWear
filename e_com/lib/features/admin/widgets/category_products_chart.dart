// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
// import 'package:flutter_chart/flutter_chart.dart' as charts;
import '../models/sales.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
// import 'package:fl_chart/fl_chart.dart' as charts;
// import 'package:charts_common/common.dart' as char

class CategoryProductsChart extends StatelessWidget {
  final List<charts.Series<Sales, String>> seriesList;
  const CategoryProductsChart({
    Key? key,
    required this.seriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: false,
    );
  }
}
