import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pest_gpt/src/common_widget/common_card.dart';
import 'package:pest_gpt/src/common_widget/common_tab_header.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';
import 'package:pest_gpt/src/models/tempature/forecast_weather_response.dart';
import 'package:pest_gpt/src/utils/tempature_util.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RangeChartData {
  RangeChartData(this.xValue, this.lowValue, this.highValue);
  final num xValue;
  final num lowValue;
  final num highValue;
}

class LineChartData {
  LineChartData(this.x, this.y);
  final num x;
  final double? y;
}

enum LineChartType { temperature, humidity, wind }

class LineChart extends StatefulWidget {
  final ForecastWeatherResponse weatherForecast;
  final LLMPestInfo pestInfo;
  final Function(int) onChangeTab;
  const LineChart(
      {super.key,
      required this.weatherForecast,
      required this.pestInfo,
      required this.onChangeTab});

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  LineChartType lineChartType = LineChartType.temperature;
  List<RangeChartData> getChartData(bool isForcasted) {
    List<RangeChartData> rangeChartData = [];
    switch (lineChartType) {
      case LineChartType.temperature:
        rangeChartData = widget.weatherForecast.list
            .map(
              (forecast) => RangeChartData(
                forecast.dt,
                isForcasted
                    ? TemperatureUtil.kelvinToCelsius(forecast.temperature.min)
                    : (widget.pestInfo.idealTemperature?.min ?? 0.0),
                isForcasted
                    ? TemperatureUtil.kelvinToCelsius(forecast.temperature.max)
                    : (widget.pestInfo.idealTemperature?.max ?? 0.0),
              ),
            )
            .toList();
        break;
      case LineChartType.humidity:
        rangeChartData = widget.weatherForecast.list
            .map(
              (forecast) => RangeChartData(
                forecast.dt,
                isForcasted
                    ? forecast.humidity
                    : widget.pestInfo.idealHumidity?.min ?? 0.0,
                isForcasted
                    ? forecast.humidity
                    : widget.pestInfo.idealHumidity?.max ?? 0.0,
              ),
            )
            .toList();
        break;
      case LineChartType.wind:
        rangeChartData = widget.weatherForecast.list
            .map(
              (forecast) => RangeChartData(
                forecast.dt,
                isForcasted
                    ? forecast.speed
                    : widget.pestInfo.idealWindSpeed?.min ?? 0.0,
                isForcasted
                    ? forecast.speed
                    : widget.pestInfo.idealWindSpeed?.max ?? 0.0,
              ),
            )
            .toList();
        break;
    }
    return rangeChartData;
  }

  @override
  Widget build(BuildContext context) {
    final List<RangeChartData> pestRangeData = getChartData(false);

    final List<RangeChartData> forecastedRangeData = getChartData(true);

    final pestMin = pestRangeData
        .map((e) => e.lowValue)
        .reduce((value, element) => value < element ? value : element);
    final pestMax = pestRangeData
        .map((e) => e.highValue)
        .reduce((value, element) => value > element ? value : element);

    final forecastedMin = forecastedRangeData
        .map((e) => e.lowValue)
        .reduce((value, element) => value < element ? value : element);
    final forecastedMax = forecastedRangeData
        .map((e) => e.highValue)
        .reduce((value, element) => value > element ? value : element);

    final min = pestMin < forecastedMin ? pestMin : forecastedMin;
    final max = pestMax > forecastedMax ? pestMax : forecastedMax;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTabHeader(
          numberOfTab: 3,
          tabHeaders: const [
            'Temperature',
            'Humidity',
            'Wind',
          ],
          onChangeTab: (index) {
            setState(() {
              lineChartType = LineChartType.values[index];
            });
            widget.onChangeTab(index);
          },
        ),
        const SizedBox(height: 10),
        CommonCard(
          child: Stack(
            children: [
              Container(
                height: 240,
                alignment: Alignment.bottomCenter,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    buildRangeChart(
                      forecastedRangeData,
                      context,
                      min - 10,
                      max + 10,
                      Colors.red,
                    ),
                    buildRangeChart(pestRangeData, context, min - 10, max + 10,
                        Theme.of(context).primaryColor.withOpacity(0.2)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  SfCartesianChart buildRangeChart(
    List<RangeChartData> rangeChartData,
    BuildContext context,
    double min,
    double max,
    Color color,
  ) {
    return SfCartesianChart(
      backgroundColor: Colors.transparent,
      plotAreaBackgroundColor: Colors.transparent,
      plotAreaBorderColor: Colors.transparent,
      borderColor: Colors.transparent,
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
        majorGridLines:
            const MajorGridLines(width: 0, color: Colors.transparent),
        minorGridLines:
            const MinorGridLines(width: 0, color: Colors.transparent),
        majorTickLines:
            const MajorTickLines(width: 0, color: Colors.transparent),
        minorTickLines:
            const MinorTickLines(width: 0, color: Colors.transparent),
        axisLine: const AxisLine(width: 0, color: Colors.transparent),
        labelFormat: '{value}', // Default format for label values
        interval:
            86400, // Set an appropriate interval (e.g., one day in seconds)
        axisLabelFormatter: (AxisLabelRenderDetails details) {
          DateTime date =
              DateTime.fromMillisecondsSinceEpoch(details.value.toInt() * 1000);
          String formattedDate = DateFormat('dd').format(date);
          return ChartAxisLabel(
            formattedDate,
            TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          );
        },
      ),
      primaryYAxis: NumericAxis(
        maximum: max.toDouble(),
        minimum: min.toDouble(),
        labelFormat: '{value}', // Default format for label values
        majorGridLines:
            const MajorGridLines(width: 0, color: Colors.transparent),
        minorGridLines:
            const MinorGridLines(width: 0, color: Colors.transparent),
        majorTickLines:
            const MajorTickLines(width: 0, color: Colors.transparent),
        minorTickLines:
            const MinorTickLines(width: 0, color: Colors.transparent),

        axisLabelFormatter: (AxisLabelRenderDetails details) {
          return ChartAxisLabel(
            getLabelforYAxis(details.value),
            TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          );
        },
      ),
      series: <CartesianSeries<RangeChartData, num>>[
        SplineRangeAreaSeries<RangeChartData, num>(
          animationDuration: 500,
          dataSource: rangeChartData,
          color: color.withOpacity(0.4),
          borderDrawMode: RangeAreaBorderMode.excludeSides,
          borderColor: color,
          borderWidth: 2,
          xValueMapper: (RangeChartData data, _) => data.xValue,
          lowValueMapper: (RangeChartData data, _) => data.lowValue,
          highValueMapper: (RangeChartData data, _) => data.highValue,
        ),
      ],
    );
  }

  String getLabelforYAxis(num data) {
    switch (lineChartType) {
      case LineChartType.temperature:
        return '${data.toInt()}°C';
      case LineChartType.humidity:
        return '${data.toInt()}%';
      case LineChartType.wind:
        return '${data.toInt()}km/h';
    }
  }
}
