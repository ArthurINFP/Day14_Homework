import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final mySizedBox = const SizedBox(
    height: 12,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_light.png'),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: mainBody(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> mainBody() {
    List<Widget> widgets = [];
    widgets.add(mySizedBox);
    widgets.add(optionBarSection());
    widgets.add(mySizedBox);
    widgets.addAll(generalWeatherSection());
    widgets.add(mySizedBox);
    widgets.add(detailWeatherSection());
    widgets.add(mySizedBox);
    widgets.add(forecastSection());
    return widgets;
  }

  Padding optionBarSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(
          width: 24,
        ),
        Text(
          '10.82, 206.24',
          style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8)),
        ),
        const Icon(
          Icons.menu,
          color: Colors.white,
        )
      ]),
    );
  }

  List<Widget> generalWeatherSection() {
    return [
      const Text(
        'Ho Chi Minh City',
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      mySizedBox,
      SvgPicture.asset(
        'assets/icons/daycloudylightning.svg',
        height: 115,
        width: 115,
      ),
      mySizedBox,
      Text(
        'Soft Light',
        style: TextStyle(fontSize: 24, color: Colors.white.withOpacity(0.7)),
      ),
      mySizedBox,
      const Text(
        '32°C',
        style: TextStyle(
            fontSize: 64, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      mySizedBox,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Text(
          'Dust storm, sandstorm, drifting or blowing snow',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7)),
        ),
      )
    ];
  }

  Widget detailWeatherSection() {
    const detailSizedBox = SizedBox(
      height: 20,
    );
    const textStyle = TextStyle(color: Colors.white, fontSize: 20);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black.withOpacity(0.3)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Humidity: 40%',
                style: textStyle,
              ),
              detailSizedBox,
              Text(
                'PM10 33.4μg/m3',
                style: textStyle,
              ),
              detailSizedBox,
              Text(
                'UV 2.2',
                style: textStyle,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Wind 2km/h',
                style: textStyle,
              ),
              detailSizedBox,
              Text(
                'Sunrise 6:35',
                style: textStyle,
              ),
              detailSizedBox,
              Text(
                'Sunset 17:55',
                style: textStyle,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget forecastSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black.withOpacity(0.3)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/icons/sunny.svg',
                width: 17,
                height: 17,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Forecast',
                style: TextStyle(
                    fontSize: 16, color: Colors.white.withOpacity(0.6)),
              )
            ],
          ),
          Divider(
            color: Colors.white.withOpacity(0.6),
            thickness: 1,
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Max: 36.4°C',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  'Min: 22.1°C',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: weatherPerHour(),
            ),
          )
        ],
      ),
    );
  }

  Widget weatherPerHour() {
    return Row(
      children: List.generate(24, (index) {
        String hour =
            "${(index == 0) ? 0 : (index == 12) ? 12 : index % 12} ${index < 12 ? 'AM' : 'PM'}";
        String iconPath = (index >= 6 && index <= 18)
            ? 'assets/icons/dayIcon.svg'
            : 'assets/icons/nightIcon.svg';
        return Container(
          margin: const EdgeInsets.only(right: 20),
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Text(
              hour,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SvgPicture.asset(
              iconPath,
              height: 24,
              width: 24,
            )
          ]),
        );
      }),
    );
  }
}
