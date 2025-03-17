class TemperatureUtil {
  static String getTemperature(double temperature) {
    return '${temperature.toStringAsFixed(1)}°C';
  }

  static double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }
}
