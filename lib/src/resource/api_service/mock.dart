import 'dart:convert';

import 'package:pest_gpt/src/models/tempature/forecast_weather_response.dart';
import 'package:pest_gpt/src/models/user/user_info_response.dart';

class MockWeatherResponse {
  static const userInfoJson = """
{"id":"630f4718d997b428f967597e","username":"gaoshanbi","fullName":"Gaoshan Bi","email":"gaoshanbi95@gmail.com","phone":"44 07300950735","gender":"Male","birth":"1995-07-08","scopeId":"630f4718d997b428f967597b","note":"test","avatar":"https://www.gravatar.com/avatar/88dd52d641bc12ba657b9ee017dce4b2.jpg?s=150&d=identicon","createTime":"2022-08-31 11:33","updateTime":"2024-07-31 18:48","role":{"id":"630f4718d997b428f967597c","name":"Admin","permissions":["task:check","field:check","user:check","user:update","farm:check","crop:check","user:add"],"menus":[{"id":"62deaec4e4405051a22b9db3","path":{"name":"home"},"icon":"mdi-view-dashboard-variant"},{"id":"62deafc2e4405051a22b9db7","path":{"name":"farm"},"icon":"mdi-tractor"},{"id":"62deb002e4405051a22b9db9","path":{"name":"crops"},"icon":"mdi-barley"},{"id":"62deaeeee4405051a22b9db5","path":{"name":"analysis decision"},"icon":"mdi-google-analytics","children":[{"id":"62deb818e4405051a22b9dbd","path":{"name":"task"}},{"id":"62deb827e4405051a22b9dbe","path":{"name":"report"}}]},{"id":"62deafade4405051a22b9db6","path":{"name":"message"},"icon":"mdi-forum","children":[{"id":"62ea0343a88f301f210e0b51","path":{"name":"push template"}},{"id":"62ea0f5aa88f301f210e0b52","path":{"name":"messages sent"}}]},{"id":"65e10044302d434f8b57d545","path":{"name":"ai models"},"icon":"mdi-google-analytics","children":[{"id":"64bdcd05626fa8ae7d7861ec","path":{"name":"visualisation"}},{"id":"65d7d4b87da3945d792ed242","path":{"name":"visualisation_2"}}]},{"id":"62deafede4405051a22b9db8","path":{"name":"user"},"icon":"mdi-account-multiple","children":[{"id":"62deb845e4405051a22b9dbf","path":{"name":"all users"}},{"id":"62deb851e4405051a22b9dc0","path":{"name":"role"}}]}],"createTime":"2022-08-31 11:33","scopeId":"630f4718d997b428f967597b","priority":-1,"note":"Admin"},"extral":{"lastLogin":{"time":"2024-07-31 18:48","place":"Sheffield, United Kingdom"}}}
""";

  static UserInfoResponse get userInfo =>
      UserInfoResponse.fromJson(jsonDecode(userInfoJson));

  static final _weatherForecast = {
    "city": {
      "id": 3163858,
      "name": "Zocca",
      "coord": {"lon": 10.99, "lat": 44.34},
      "country": "IT",
      "population": 4593,
      "timezone": 7200
    },
    "cod": "200",
    "message": 4.336073,
    "cnt": 7,
    "list": [
      {
        "dt": 1719792000,
        "sunrise": 1719813600,
        "sunset": 1719864000,
        "temp": {
          "day": 299.05,
          "min": 290.88,
          "max": 303.79,
          "night": 292.28,
          "eve": 296.13,
          "morn": 296.66
        },
        "feels_like": {
          "day": 301.19,
          "night": 293.19,
          "eve": 298.23,
          "morn": 295.96
        },
        "pressure": 1012,
        "humidity": 45,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 4.4,
        "deg": 268,
        "gust": 2.06,
        "clouds": 8,
        "pop": 0
      },
      {
        "dt": 1719878400,
        "sunrise": 1719900000,
        "sunset": 1719950400,
        "temp": {
          "day": 300.13,
          "min": 290.81,
          "max": 304.53,
          "night": 293.34,
          "eve": 296.33,
          "morn": 292.52
        },
        "feels_like": {
          "day": 302.26,
          "night": 293.63,
          "eve": 296.45,
          "morn": 294.76
        },
        "pressure": 1015,
        "humidity": 42,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 3.3,
        "deg": 249,
        "gust": 2.23,
        "clouds": 10,
        "pop": 0
      },
      {
        "dt": 1719964800,
        "sunrise": 1719986400,
        "sunset": 1720036800,
        "temp": {
          "day": 299.99,
          "min": 291.2,
          "max": 303.67,
          "night": 294.28,
          "eve": 295.81,
          "morn": 296.01
        },
        "feels_like": {
          "day": 301.85,
          "night": 292.7,
          "eve": 296.28,
          "morn": 295.59
        },
        "pressure": 1004,
        "humidity": 50,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 3.3,
        "deg": 347,
        "gust": 2.68,
        "clouds": 5,
        "pop": 0
      },
      {
        "dt": 1720051200,
        "sunrise": 1720072800,
        "sunset": 1720123200,
        "temp": {
          "day": 300.74,
          "min": 290.97,
          "max": 303.38,
          "night": 291.2,
          "eve": 298.03,
          "morn": 292.06
        },
        "feels_like": {
          "day": 298.12,
          "night": 294.22,
          "eve": 294.15,
          "morn": 293.75
        },
        "pressure": 1017,
        "humidity": 49,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 2.16,
        "deg": 238,
        "gust": 2.03,
        "clouds": 5,
        "pop": 0
      },
      {
        "dt": 1720137600,
        "sunrise": 1720159200,
        "sunset": 1720209600,
        "temp": {
          "day": 302.34,
          "min": 292.95,
          "max": 304.33,
          "night": 295.14,
          "eve": 294.19,
          "morn": 294.65
        },
        "feels_like": {
          "day": 302.51,
          "night": 294.81,
          "eve": 294.02,
          "morn": 295.56
        },
        "pressure": 1019,
        "humidity": 45,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 3.8,
        "deg": 219,
        "gust": 3.19,
        "clouds": 9,
        "pop": 0
      },
      {
        "dt": 1720224000,
        "sunrise": 1720245600,
        "sunset": 1720296000,
        "temp": {
          "day": 298.2,
          "min": 290.69,
          "max": 304.55,
          "night": 291.23,
          "eve": 297.92,
          "morn": 292.48
        },
        "feels_like": {
          "day": 301.72,
          "night": 291.77,
          "eve": 296.7,
          "morn": 293.0
        },
        "pressure": 1014,
        "humidity": 48,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 3.97,
        "deg": 315,
        "gust": 4.04,
        "clouds": 2,
        "pop": 0
      },
      {
        "dt": 1720310400,
        "sunrise": 1720332000,
        "sunset": 1720382400,
        "temp": {
          "day": 301.22,
          "min": 293.63,
          "max": 303.88,
          "night": 292.75,
          "eve": 296.04,
          "morn": 292.57
        },
        "feels_like": {
          "day": 302.91,
          "night": 295.11,
          "eve": 296.44,
          "morn": 296.81
        },
        "pressure": 1005,
        "humidity": 41,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 4.73,
        "deg": 98,
        "gust": 3.38,
        "clouds": 6,
        "pop": 0
      },
      {
        "dt": 1720396800,
        "sunrise": 1720418400,
        "sunset": 1720468800,
        "temp": {
          "day": 298.59,
          "min": 291.52,
          "max": 302.37,
          "night": 295.15,
          "eve": 297.84,
          "morn": 296.58
        },
        "feels_like": {
          "day": 298.91,
          "night": 295.0,
          "eve": 295.37,
          "morn": 293.15
        },
        "pressure": 1010,
        "humidity": 60,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 3.19,
        "deg": 64,
        "gust": 4.18,
        "clouds": 9,
        "pop": 0
      },
      {
        "dt": 1720483200,
        "sunrise": 1720504800,
        "sunset": 1720555200,
        "temp": {
          "day": 302.42,
          "min": 294.53,
          "max": 304.4,
          "night": 295.64,
          "eve": 294.87,
          "morn": 295.26
        },
        "feels_like": {
          "day": 299.97,
          "night": 294.39,
          "eve": 296.59,
          "morn": 295.35
        },
        "pressure": 1002,
        "humidity": 43,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 3.12,
        "deg": 43,
        "gust": 3.35,
        "clouds": 0,
        "pop": 0
      },
      {
        "dt": 1720569600,
        "sunrise": 1720591200,
        "sunset": 1720641600,
        "temp": {
          "day": 299.27,
          "min": 291.44,
          "max": 304.57,
          "night": 292.62,
          "eve": 296.96,
          "morn": 296.13
        },
        "feels_like": {
          "day": 300.22,
          "night": 294.83,
          "eve": 296.28,
          "morn": 294.37
        },
        "pressure": 1001,
        "humidity": 57,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 4.71,
        "deg": 151,
        "gust": 3.48,
        "clouds": 9,
        "pop": 0
      },
      {
        "dt": 1720656000,
        "sunrise": 1720677600,
        "sunset": 1720728000,
        "temp": {
          "day": 300.58,
          "min": 292.97,
          "max": 300.46,
          "night": 295.99,
          "eve": 298.33,
          "morn": 292.76
        },
        "feels_like": {
          "day": 301.09,
          "night": 292.86,
          "eve": 298.74,
          "morn": 292.86
        },
        "pressure": 1000,
        "humidity": 40,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 2.28,
        "deg": 19,
        "gust": 2.67,
        "clouds": 8,
        "pop": 0
      },
      {
        "dt": 1720742400,
        "sunrise": 1720764000,
        "sunset": 1720814400,
        "temp": {
          "day": 301.52,
          "min": 294.93,
          "max": 301.39,
          "night": 295.26,
          "eve": 295.17,
          "morn": 297.0
        },
        "feels_like": {
          "day": 301.39,
          "night": 293.41,
          "eve": 297.51,
          "morn": 296.2
        },
        "pressure": 1012,
        "humidity": 53,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 3.43,
        "deg": 230,
        "gust": 3.01,
        "clouds": 6,
        "pop": 0
      },
      {
        "dt": 1720828800,
        "sunrise": 1720850400,
        "sunset": 1720900800,
        "temp": {
          "day": 302.71,
          "min": 290.71,
          "max": 303.42,
          "night": 291.26,
          "eve": 294.14,
          "morn": 293.84
        },
        "feels_like": {
          "day": 298.19,
          "night": 292.34,
          "eve": 298.33,
          "morn": 295.01
        },
        "pressure": 1014,
        "humidity": 53,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 2.45,
        "deg": 207,
        "gust": 2.36,
        "clouds": 9,
        "pop": 0
      },
      {
        "dt": 1720915200,
        "sunrise": 1720936800,
        "sunset": 1720987200,
        "temp": {
          "day": 301.34,
          "min": 293.58,
          "max": 302.4,
          "night": 291.74,
          "eve": 296.24,
          "morn": 295.84
        },
        "feels_like": {
          "day": 301.34,
          "night": 294.04,
          "eve": 298.29,
          "morn": 295.53
        },
        "pressure": 1000,
        "humidity": 57,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 2.36,
        "deg": 258,
        "gust": 2.89,
        "clouds": 8,
        "pop": 0
      },
      {
        "dt": 1721001600,
        "sunrise": 1721023200,
        "sunset": 1721073600,
        "temp": {
          "day": 298.46,
          "min": 294.3,
          "max": 304.13,
          "night": 293.92,
          "eve": 296.65,
          "morn": 293.82
        },
        "feels_like": {
          "day": 300.16,
          "night": 291.39,
          "eve": 296.14,
          "morn": 296.02
        },
        "pressure": 1020,
        "humidity": 50,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 2.11,
        "deg": 46,
        "gust": 2.81,
        "clouds": 4,
        "pop": 0
      },
      {
        "dt": 1721088000,
        "sunrise": 1721109600,
        "sunset": 1721160000,
        "temp": {
          "day": 301.45,
          "min": 294.55,
          "max": 304.39,
          "night": 291.02,
          "eve": 294.1,
          "morn": 292.84
        },
        "feels_like": {
          "day": 301.84,
          "night": 292.04,
          "eve": 295.37,
          "morn": 294.02
        },
        "pressure": 1003,
        "humidity": 44,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 3.04,
        "deg": 337,
        "gust": 4.69,
        "clouds": 0,
        "pop": 0
      },
      {
        "dt": 1721174400,
        "sunrise": 1721196000,
        "sunset": 1721246400,
        "temp": {
          "day": 299.13,
          "min": 290.97,
          "max": 302.15,
          "night": 291.86,
          "eve": 295.12,
          "morn": 295.01
        },
        "feels_like": {
          "day": 301.48,
          "night": 295.96,
          "eve": 297.37,
          "morn": 292.84
        },
        "pressure": 1012,
        "humidity": 42,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 4.62,
        "deg": 166,
        "gust": 2.12,
        "clouds": 10,
        "pop": 0
      },
      {
        "dt": 1721260800,
        "sunrise": 1721282400,
        "sunset": 1721332800,
        "temp": {
          "day": 300.86,
          "min": 290.27,
          "max": 301.57,
          "night": 291.26,
          "eve": 298.47,
          "morn": 295.4
        },
        "feels_like": {
          "day": 299.79,
          "night": 291.27,
          "eve": 297.3,
          "morn": 292.62
        },
        "pressure": 1019,
        "humidity": 60,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 2.43,
        "deg": 311,
        "gust": 3.95,
        "clouds": 5,
        "pop": 0
      },
      {
        "dt": 1721347200,
        "sunrise": 1721368800,
        "sunset": 1721419200,
        "temp": {
          "day": 300.61,
          "min": 293.78,
          "max": 302.75,
          "night": 294.47,
          "eve": 296.58,
          "morn": 293.03
        },
        "feels_like": {
          "day": 298.16,
          "night": 294.98,
          "eve": 296.66,
          "morn": 296.86
        },
        "pressure": 1008,
        "humidity": 51,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 2.39,
        "deg": 337,
        "gust": 2.18,
        "clouds": 8,
        "pop": 0
      },
      {
        "dt": 1721433600,
        "sunrise": 1721455200,
        "sunset": 1721505600,
        "temp": {
          "day": 298.52,
          "min": 292.46,
          "max": 302.47,
          "night": 294.9,
          "eve": 295.06,
          "morn": 295.4
        },
        "feels_like": {
          "day": 300.14,
          "night": 292.98,
          "eve": 294.72,
          "morn": 293.68
        },
        "pressure": 1009,
        "humidity": 54,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 3.42,
        "deg": 185,
        "gust": 4.62,
        "clouds": 7,
        "pop": 0
      },
      {
        "dt": 1721520000,
        "sunrise": 1721541600,
        "sunset": 1721592000,
        "temp": {
          "day": 301.26,
          "min": 294.25,
          "max": 304.56,
          "night": 291.81,
          "eve": 298.73,
          "morn": 296.89
        },
        "feels_like": {
          "day": 302.96,
          "night": 293.31,
          "eve": 295.27,
          "morn": 295.25
        },
        "pressure": 1019,
        "humidity": 55,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 3.29,
        "deg": 197,
        "gust": 4.45,
        "clouds": 0,
        "pop": 0
      },
      {
        "dt": 1721606400,
        "sunrise": 1721628000,
        "sunset": 1721678400,
        "temp": {
          "day": 298.76,
          "min": 292.71,
          "max": 303.85,
          "night": 295.23,
          "eve": 296.93,
          "morn": 294.36
        },
        "feels_like": {
          "day": 300.77,
          "night": 293.92,
          "eve": 297.51,
          "morn": 293.73
        },
        "pressure": 1007,
        "humidity": 60,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 4.57,
        "deg": 246,
        "gust": 4.69,
        "clouds": 10,
        "pop": 0
      },
      {
        "dt": 1721692800,
        "sunrise": 1721714400,
        "sunset": 1721764800,
        "temp": {
          "day": 302.61,
          "min": 291.68,
          "max": 301.47,
          "night": 295.84,
          "eve": 297.33,
          "morn": 294.0
        },
        "feels_like": {
          "day": 301.79,
          "night": 294.0,
          "eve": 296.02,
          "morn": 296.44
        },
        "pressure": 1012,
        "humidity": 59,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 2.97,
        "deg": 355,
        "gust": 3.6,
        "clouds": 0,
        "pop": 0
      },
      {
        "dt": 1721779200,
        "sunrise": 1721800800,
        "sunset": 1721851200,
        "temp": {
          "day": 302.2,
          "min": 293.16,
          "max": 300.84,
          "night": 291.19,
          "eve": 297.14,
          "morn": 293.63
        },
        "feels_like": {
          "day": 299.07,
          "night": 293.55,
          "eve": 296.63,
          "morn": 292.31
        },
        "pressure": 1007,
        "humidity": 52,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 4.33,
        "deg": 99,
        "gust": 4.76,
        "clouds": 1,
        "pop": 0
      },
      {
        "dt": 1721865600,
        "sunrise": 1721887200,
        "sunset": 1721937600,
        "temp": {
          "day": 301.16,
          "min": 292.1,
          "max": 302.06,
          "night": 291.13,
          "eve": 295.54,
          "morn": 294.79
        },
        "feels_like": {
          "day": 298.65,
          "night": 295.22,
          "eve": 294.4,
          "morn": 295.49
        },
        "pressure": 1013,
        "humidity": 59,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 4.18,
        "deg": 154,
        "gust": 3.84,
        "clouds": 10,
        "pop": 0
      },
      {
        "dt": 1721952000,
        "sunrise": 1721973600,
        "sunset": 1722024000,
        "temp": {
          "day": 302.43,
          "min": 292.25,
          "max": 302.09,
          "night": 293.63,
          "eve": 297.69,
          "morn": 292.57
        },
        "feels_like": {
          "day": 299.96,
          "night": 291.34,
          "eve": 296.11,
          "morn": 292.94
        },
        "pressure": 1017,
        "humidity": 56,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 4.28,
        "deg": 342,
        "gust": 4.76,
        "clouds": 3,
        "pop": 0
      },
      {
        "dt": 1722038400,
        "sunrise": 1722060000,
        "sunset": 1722110400,
        "temp": {
          "day": 300.42,
          "min": 294.72,
          "max": 300.49,
          "night": 295.94,
          "eve": 295.17,
          "morn": 295.0
        },
        "feels_like": {
          "day": 302.53,
          "night": 292.12,
          "eve": 298.38,
          "morn": 293.09
        },
        "pressure": 1005,
        "humidity": 40,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 2.69,
        "deg": 223,
        "gust": 2.56,
        "clouds": 8,
        "pop": 0
      },
      {
        "dt": 1722124800,
        "sunrise": 1722146400,
        "sunset": 1722196800,
        "temp": {
          "day": 300.91,
          "min": 290.63,
          "max": 305.0,
          "night": 295.66,
          "eve": 295.81,
          "morn": 296.52
        },
        "feels_like": {
          "day": 298.59,
          "night": 291.74,
          "eve": 298.68,
          "morn": 294.67
        },
        "pressure": 1006,
        "humidity": 45,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 2.68,
        "deg": 83,
        "gust": 2.42,
        "clouds": 2,
        "pop": 0
      },
      {
        "dt": 1722211200,
        "sunrise": 1722232800,
        "sunset": 1722283200,
        "temp": {
          "day": 299.57,
          "min": 294.9,
          "max": 304.86,
          "night": 291.26,
          "eve": 297.82,
          "morn": 295.5
        },
        "feels_like": {
          "day": 302.45,
          "night": 293.4,
          "eve": 294.43,
          "morn": 296.58
        },
        "pressure": 1006,
        "humidity": 44,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 4.15,
        "deg": 170,
        "gust": 3.63,
        "clouds": 7,
        "pop": 0
      },
      {
        "dt": 1722297600,
        "sunrise": 1722319200,
        "sunset": 1722369600,
        "temp": {
          "day": 302.31,
          "min": 292.66,
          "max": 300.81,
          "night": 295.34,
          "eve": 297.05,
          "morn": 292.02
        },
        "feels_like": {
          "day": 300.79,
          "night": 295.78,
          "eve": 297.0,
          "morn": 294.83
        },
        "pressure": 1004,
        "humidity": 58,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 2.42,
        "deg": 56,
        "gust": 3.46,
        "clouds": 3,
        "pop": 0
      },
      {
        "dt": 1722384000,
        "sunrise": 1722405600,
        "sunset": 1722456000,
        "temp": {
          "day": 300.19,
          "min": 292.44,
          "max": 303.1,
          "night": 293.39,
          "eve": 298.61,
          "morn": 293.23
        },
        "feels_like": {
          "day": 299.05,
          "night": 295.62,
          "eve": 295.22,
          "morn": 292.98
        },
        "pressure": 1006,
        "humidity": 42,
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "sky is clear",
            "icon": "01d"
          }
        ],
        "speed": 4.45,
        "deg": 34,
        "gust": 3.03,
        "clouds": 5,
        "pop": 0
      }
    ]
  };

  static final getWeatherResponse =
      ForecastWeatherResponse.fromJson(_weatherForecast);
}
