import 'package:flutter/material.dart';

class BugisPlus extends StatefulWidget {
  const BugisPlus({Key? key}) : super(key: key);

  @override
  State<BugisPlus> createState() => _BugisPlusState();
}

class _BugisPlusState extends State<BugisPlus> {
  Map data = {};
  List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  String value = 'Sunday';
  //keeps track of what the user is typing
  final _textControllerStart = TextEditingController();
  final _textControllerEnd = TextEditingController();
  String startTime = '0';
  String endTime = '0';

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            data['location'],
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          //centerTitle: true,
          elevation: 0,
        ),
        //extendBodyBehindAppBar: true,
        body: ListView(padding: EdgeInsets.all(20), children: <Widget>[
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                  child: Image.asset(
                'assets/${data['location']}.jpg',
                height: 360,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              )),
              SizedBox(
                height: 30,
              ),
              ListTile(
                title: Text(
                  'No. of lots',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.grey[800]),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                  child: Text(
                    data['lotscount'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 31,
                    ),
                  ),
                ),
                subtitle: Text(
                  '201 Victoria Street',
                  style: TextStyle(letterSpacing: 1, color: Colors.black),
                ),
              )
            ],
          )),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0, 25.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Weekdays before 5/6pm:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(r'8am-5.59pm: $1.28 for 1st hr;'),
                Text(r'$0.54 for sub. 15 mins.'),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Weekdays after 5/6pm:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(r'Mon-Thu: 6pm-7.59am: $3.21 per entry;'),
                Text(r'Fri: $3.21 for 1st 2hrs;'),
                Text(r'$0.54 for sub. 15 mins.'),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Weekends/Public Holidays:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    letterSpacing: 1.5,
                  ),
                ),
                Text(r'$3.21 for 1st 2hrs;'),
                Text(r'$0.54 for sub. 15 mins.'),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                'Parking Fee Calculator',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              'Please choose day of week:',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 4),
              ),
              child: DropdownButton(
                value: value,
                items: days.map(buildMenuItem).toList(),
                onChanged: (value) =>
                    setState(() => this.value = value as String),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              'Please input the start time',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                TextField(
                  controller: _textControllerStart,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Enter Start Time (24hr format)',
                      border: OutlineInputBorder()),
                ),
                MaterialButton(
                    onPressed: () {
                      //update startTime
                      setState(() => startTime = _textControllerStart.text);
                      print(startTime);
                    },
                    color: Colors.blue,
                    child: Text('Submit'))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              'Please input the end time',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                TextField(
                  controller: _textControllerEnd,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Enter End Time (24hr format)',
                      border: OutlineInputBorder()),
                ),
                MaterialButton(
                    onPressed: () {
                      //update startTime
                      setState(() => endTime = _textControllerEnd.text);
                      debugPrint(endTime);
                    },
                    color: Colors.blue,
                    child: Text('Submit'))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              "This is the parking fare:       " +
                  calculate(value, startTime, endTime) +
                  ' dollars',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ]));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );

  String calculate(String day, String startTime, String endTime) {
    double start = double.parse(startTime);
    double end = double.parse(endTime);
    if ((day == 'Monday') ||
        day == 'Tuesday' ||
        day == 'Wednesday' ||
        day == 'Thursday') {
      if (start >= 800 && end < 1800) {
        int counter = (end - start) ~/ (100);
        double diff = counter.toDouble();
        double total_time = 60 * diff;
        total_time += ((end - start) - diff * 100);
        print(total_time);
        if (total_time <= 60.0) {
          return 1.28.toString();
        } else {
          var sum = 1.28 + ((total_time - 60.0) / 15.0) * 0.54;
          return sum.toString();
        }
      } else {
        return '3.21';
      }
    } else if (day == 'Friday') {
      int counter = (end - start) ~/ (100);
      double diff = counter.toDouble();
      double total_time = 60 * diff;
      total_time += ((end - start) - diff * 100);
      print(total_time);
      if (start >= 800 && end < 1800) {
        if (total_time <= 60.0) {
          return 1.28.toString();
        } else {
          var sum = 1.28 + ((total_time - 60.0) / 15.0) * 0.54;
          return sum.toString();
        }
      } else {
        if (total_time / 120.0 < 1) {
          return 3.21.toString();
        } else {
          var sum = 3.21 + ((total_time - 120.0) / 15.0) * 0.54;
          return sum.toString();
        }
      }
    } else {
      int counter = (end - start) ~/ (100);
      double diff = counter.toDouble();
      double total_time = 60 * diff;
      total_time += ((end - start) - diff * 100);
      print(total_time);
      if (total_time / 120.0 < 1) {
        return 3.21.toString();
      } else {
        var sum = 3.21 + ((total_time - 120.0) / 15.0) * 0.54;
        return sum.toString();
      }
    }
  }
}
