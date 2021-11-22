import 'package:flutter/material.dart';
import 'package:text_scaling_example/scaler/text_scaler.dart';
import 'package:text_scaling_example/scaler/text_scaling_factor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextScaler<TextScalingFactor>(
      initialScaleFactor: TextScalingFactor(scaleFactor: 1.25),
      child: MaterialApp(
        title: 'Text Scaling Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Text Scaling Demo'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double sliderValue = 0.0;

  bool isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      if (TextScaler.of<TextScalingFactor>(context) != null) {
        sliderValue =
            TextScaler.of<TextScalingFactor>(context).scaleFactor - 1.0;
      }
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double _textScaleFactor = 1.0;
    if (TextScaler.of<TextScalingFactor>(context) != null) {
      _textScaleFactor = TextScaler.of<TextScalingFactor>(context).scaleFactor;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'This is a sample heading',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                        textScaleFactor: _textScaleFactor,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'This is sample text 1.',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                        ),
                        textScaleFactor: _textScaleFactor,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'This is sample text 2.',
                        style: TextStyle(fontSize: 16.0),
                        textScaleFactor: _textScaleFactor,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scale Factor ${(1 + sliderValue).toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Slider(
                      min: 0,
                      max: 1,
                      value: sliderValue,
                      onChanged: (value) {
                        if (TextScaler.of<TextScalingFactor>(context) != null) {
                          TextScaler.update(context,
                              TextScalingFactor(scaleFactor: 1.0 + value));
                          sliderValue = value;
                        } else {
                          setState(() {
                            sliderValue = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
