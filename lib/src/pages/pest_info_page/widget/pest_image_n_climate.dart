import 'package:flutter/material.dart';
import 'package:pest_gpt/src/models/pest/pest_info.dart';
import 'package:pest_gpt/src/models/pest/pest_model.dart';
import 'package:pest_gpt/src/pages/pest_info_page/widget/line_chart.dart';
import 'package:pest_gpt/src/resource/api_service/mock.dart';

class PestImageNClimate extends StatefulWidget {
  final PestModel pestModel;
  final LLMPestInfo pestInfo;
  const PestImageNClimate(
      {super.key, required this.pestModel, required this.pestInfo});

  @override
  State<PestImageNClimate> createState() => _PestImageNClimateState();
}

class _PestImageNClimateState extends State<PestImageNClimate> {
  LineChartType lineChartType = LineChartType.temperature;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Hero(
              tag: widget.pestModel.image,
              child: Image.memory(
                widget.pestModel.image,
                fit: BoxFit.scaleDown,
                height: 100,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                getIdealClimate(),
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        LineChart(
          weatherForecast: MockWeatherResponse.getWeatherResponse,
          pestInfo: widget.pestInfo,
          onChangeTab: (index){
            setState(() {
              lineChartType = LineChartType.values[index];
            });
          },
        ),
      ],
    );
  }

  String getIdealClimate() {
    switch (lineChartType) {
      case LineChartType.temperature:
      return 'Ideal Temperature: \n ${widget.pestInfo.idealTemperature?.min} - ${widget.pestInfo.idealTemperature?.max} °C';
      case LineChartType.humidity:
      return 'Ideal Humidity: \n ${widget.pestInfo.idealHumidity?.min} - ${widget.pestInfo.idealHumidity?.max} %';
      case LineChartType.wind:
      return 'Ideal Wind Speed: \n ${widget.pestInfo.idealWindSpeed?.min} - ${widget.pestInfo.idealWindSpeed?.max} km/h';
    }
  }
}
