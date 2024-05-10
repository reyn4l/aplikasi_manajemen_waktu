import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Analog Clock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnalogClock(),
    );
  }
}

class AnalogClock extends StatefulWidget {
  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  DateTime _currentTime = DateTime.now();
  late Timer _timer;
  late DateTime _alarmTime;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentTime = DateTime.now();
        _checkAlarm();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _currentTime = DateTime.now();
    });
  }

  void _setAlarm(DateTime time) {
    setState(() {
      _alarmTime = time;
    });
  }

  void _setAlarmTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _alarmTime = DateTime(
          _currentTime.year,
          _currentTime.month,
          _currentTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }

  void _checkAlarm() {
    if (_alarmTime != null &&
        _currentTime.hour == _alarmTime.hour &&
        _currentTime.minute == _alarmTime.minute) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alarm'),
            content: Text('Wake up! It\'s time!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analog Clock'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 8),
            ),
            child: CustomPaint(
              painter: ClockPainter(dateTime: _currentTime),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setAlarmTime,
        child: Icon(Icons.alarm),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final DateTime dateTime;

  ClockPainter({required this.dateTime});

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);
    double radius = centerX;

    // Draw clock face
    canvas.drawCircle(center, radius, Paint()..color = Colors.white);
    canvas.drawCircle(center, radius * 0.05, Paint()..color = Colors.black);

    // Draw hour hand
    double hourX = centerX +
        radius *
            0.4 *
            math.cos((dateTime.hour % 12 * 30 + dateTime.minute * 0.5) *
                math.pi /
                180);
    double hourY = centerY +
        radius *
            0.4 *
            math.sin((dateTime.hour % 12 * 30 + dateTime.minute * 0.5) *
                math.pi /
                180);
    canvas.drawLine(
        center,
        Offset(hourX, hourY),
        Paint()
          ..color = Colors.black
          ..strokeWidth = 8);

    // Draw minute hand
    double minuteX =
        centerX + radius * 0.6 * math.cos(dateTime.minute * 6 * math.pi / 180);
    double minuteY =
        centerY + radius * 0.6 * math.sin(dateTime.minute * 6 * math.pi / 180);
    canvas.drawLine(
        center,
        Offset(minuteX, minuteY),
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 6);

    // Draw second hand
    double secondX =
        centerX + radius * 0.7 * math.cos(dateTime.second * 6 * math.pi / 180);
    double secondY =
        centerY + radius * 0.7 * math.sin(dateTime.second * 6 * math.pi / 180);
    canvas.drawLine(
        center,
        Offset(secondX, secondY),
        Paint()
          ..color = Colors.red
          ..strokeWidth = 3);

    // Draw hour numbers
    TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    for (int i = 1; i <= 12; i++) {
      double hourAngle = math.pi / 6 * (i - 3);
      double x = centerX +
          math.cos(hourAngle) * radius * 0.8 -
          10; // 10 is text width / 2
      double y = centerY +
          math.sin(hourAngle) * radius * 0.8 -
          10; // 10 is text height / 2
      textPainter.text = TextSpan(
        text: i.toString(),
        style: TextStyle(color: Colors.black, fontSize: 20),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x, y));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
