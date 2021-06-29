import 'package:flutter/material.dart';
import 'calculation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Love Calculator',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String firstName;
  String secondName;
  int score;
  void loveScore() {
    // score = Random().nextInt(40) + 40;
    score = calculation(firstName: firstName, secondName: secondName);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ScorePage(score: score)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue.shade100,
          title: Text(
            'LOVE CALCULATOR',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: 'lovegif',
                  child: Image(image: AssetImage('assets/images/logo.gif')),
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  onChanged: (value) {
                    firstName = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  onChanged: (value) {
                    secondName = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your parterner\'s name',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  loveScore();
                },
                child: Text('Calculate'),
                color: Colors.lightBlue.shade100,
              ),
            ]),
      ),
    );
  }
}

class ScorePage extends StatelessWidget {
  const ScorePage({
    Key key,
    @required this.score,
  }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Flexible(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Hero(
            tag: 'lovegif',
            child: Image(image: AssetImage('assets/images/logo.gif')),
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Your Score is : $score',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
        ),
      ]),
    );
  }
}
