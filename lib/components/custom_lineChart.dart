import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatefulWidget {
  final AppColors appColors;
  CustomLineChart({super.key, required this.appColors});

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        decoration: BoxDecoration(
          color: widget.appColors.primary,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: widget.appColors.onSecondary.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 37),
                Text(
                  'STATS',
                  style: TextStyle(
                    color: widget.appColors.onSecondary,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 37),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16, left: 6),
                    child: _LineChart(
                      isShowingMainData: isShowingMainData,
                      appColors: widget.appColors,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white.withValues(
                  alpha: isShowingMainData ? 1.0 : 0.5,
                ),
              ),
              onPressed: () {
                setState(() {
                  isShowingMainData = !isShowingMainData;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  final AppColors appColors;
  const _LineChart({required this.isShowingMainData, required this.appColors});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      isShowingMainData ? sampleData1 : sampleData2,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
    lineTouchData: lineTouchData1,
    gridData: gridData,
    titlesData: titlesData1,
    borderData: borderData,
    lineBarsData: lineBarsData1,
    minX: 0,
    maxX: 7,
    maxY: 7,
    minY: 0,
  );

  LineChartData get sampleData2 => LineChartData(
    lineTouchData: lineTouchData2,
    gridData: gridData,
    titlesData: titlesData2,
    borderData: borderData,
    lineBarsData: lineBarsData2,
    minX: 0,
    maxX: 7,
    maxY: 7,
    minY: 0,
  );

  LineTouchData get lineTouchData1 => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      getTooltipColor: (touchedSpot) => Colors.blueGrey.withValues(alpha: 0.8),
    ),
  );

  FlTitlesData get titlesData1 => FlTitlesData(
    bottomTitles: AxisTitles(sideTitles: bottomTitles),
    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    leftTitles: AxisTitles(sideTitles: leftTitles()),
  );

  List<LineChartBarData> get lineBarsData1 => [
    lineChartBarData1_1,
    lineChartBarData1_2,
  ];

  LineTouchData get lineTouchData2 => const LineTouchData(enabled: false);

  FlTitlesData get titlesData2 => FlTitlesData(
    bottomTitles: AxisTitles(sideTitles: bottomTitles),
    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    leftTitles: AxisTitles(sideTitles: leftTitles()),
  );

  List<LineChartBarData> get lineBarsData2 => [
    lineChartBarData2_1,
    lineChartBarData2_2,
  ];

  Widget leftTitleWidgets(double value, TitleMeta meta, AppColors appColors) {
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: appColors.onSecondaryHeading,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1';
        break;
      case 2:
        text = '2';
        break;
      case 3:
        text = '3';
        break;
      case 4:
        text = '5';
        break;
      case 5:
        text = '6';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      meta: meta,
      child: Text(text, style: style, textAlign: TextAlign.center),
    );
  }

  SideTitles leftTitles() => SideTitles(
    getTitlesWidget: (value, meta) => leftTitleWidgets(value, meta, appColors),
    showTitles: true,
    interval: 1,
    reservedSize: 40,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: appColors.onSecondaryHeading,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('MON', style: style);
        break;
      case 1:
        text = Text('TUE', style: style);
        break;
      case 2:
        text = Text('WED', style: style);
        break;
      case 3:
        text = Text('THR', style: style);
        break;
      case 4:
        text = Text('FRI', style: style);
        break;
      case 5:
        text = Text('SAT', style: style);
        break;
      case 6:
        text = Text('SUN', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(meta: meta, space: 10, child: text);
  }

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
    show: true,
    border: Border(
      bottom: BorderSide(
        color: appColors.primary.withValues(alpha: 0.2),
        width: 4,
      ),
      left: const BorderSide(color: Colors.transparent),
      right: const BorderSide(color: Colors.transparent),
      top: const BorderSide(color: Colors.transparent),
    ),
  );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
    isCurved: true,
    color: appColors.onSecondary,
    barWidth: 8,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(0, 4),
      FlSpot(1, 3),
      FlSpot(2, 6),
      FlSpot(3, 2),
      FlSpot(4, 1),
      FlSpot(5, 6),
      FlSpot(6, 2),
    ],
  );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
    isCurved: true,
    color: appColors.onPrimary,
    barWidth: 8,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(
      show: false,
      color: appColors.onPrimary.withValues(alpha: 0.2),
    ),
    spots: const [
      FlSpot(0, 2),
      FlSpot(1, 4),
      FlSpot(2, 2),
      FlSpot(3, 2),
      FlSpot(4, 4),
      FlSpot(5, 6),
      FlSpot(6, 4),
    ],
  );

  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
    isCurved: true,
    curveSmoothness: 0,
    color: appColors.onSecondaryHeading.withValues(alpha: 0.5),
    barWidth: 4,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 0),
      FlSpot(3, 1),
      FlSpot(5, 2),
      FlSpot(7, 3),
      FlSpot(10, 4),
      FlSpot(12, 5),
      FlSpot(13, 6),
    ],
  );

  LineChartBarData get lineChartBarData2_2 => LineChartBarData(
    isCurved: true,
    color: appColors.onPrimary.withValues(alpha: 0.5),
    barWidth: 4,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(
      show: true,
      color: appColors.onPrimary.withValues(alpha: 0.2),
    ),
    spots: const [
      FlSpot(1, 0),
      FlSpot(3, 1),
      FlSpot(7, 2),
      FlSpot(10, 3),
      FlSpot(12, 4),
      FlSpot(13, 5),
      FlSpot(13, 6),
    ],
  );
}
