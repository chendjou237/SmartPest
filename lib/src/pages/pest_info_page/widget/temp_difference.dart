import 'package:flutter/material.dart';
import 'package:pest_gpt/src/utils/tempature_util.dart';

class TemperatureDifference extends StatelessWidget {
  final double currentTemp;
  final double historicalTemp;

  const TemperatureDifference(
      {super.key, required this.currentTemp, required this.historicalTemp});

  @override
  Widget build(BuildContext context) {
    double tempDifference = currentTemp - historicalTemp;
    String tempDifferenceText = TemperatureUtil.getTemperature(tempDifference);
    IconData tempIcon =
        tempDifference >= 0 ? Icons.arrow_upward : Icons.arrow_downward;
    Color tempIconColor = tempDifference >= 0 ? Colors.red : Colors.blue;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Theme.of(context).colorScheme.onSurface,
          width: 1,
        ),
      ),
      child: Container(
        height: 100,
        width: 120,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _KeyValue(
              keyString: 'Current',
              valueString: TemperatureUtil.getTemperature(currentTemp),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(tempIcon, color: tempIconColor, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    tempDifferenceText,
                  ),
                ],
              ),
            ),
            _KeyValue(
              keyString: 'Historical',
              valueString: TemperatureUtil.getTemperature(historicalTemp),
            ),
          ],
        ),
      ),
    );
  }
}

class _KeyValue extends StatelessWidget {
  final String keyString;
  final String valueString;
  const _KeyValue({required this.keyString, required this.valueString});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(keyString),
        const SizedBox(width: 8),
        Text(valueString,),
      ],
    );
  }
}
