import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> myNums = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              color: Colors.deepPurple,
              child: Text('0'),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 2 / 3,
              color: Colors.amberAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: null, child: Text('AC')),
                      ElevatedButton(onPressed: null, child: Text('+/-')),
                      ElevatedButton(onPressed: null, child: Text('%')),
                      ElevatedButton(onPressed: null, child: Text('/'))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MathButton(7, addToMyNums: myNums.add),
                      MathButton(8, addToMyNums: myNums.add),
                      MathButton(9, addToMyNums: myNums.add),
                      ElevatedButton(onPressed: null, child: Text('x'))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MathButton(4, addToMyNums: myNums.add),
                      MathButton(5, addToMyNums: myNums.add),
                      MathButton(6, addToMyNums: myNums.add),
                      ElevatedButton(onPressed: null, child: Text('-'))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MathButton(1, addToMyNums: myNums.add),
                      MathButton(2, addToMyNums: myNums.add),
                      MathButton(3, addToMyNums: myNums.add),
                      ElevatedButton(onPressed: null, child: Text('+'))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MathButton(0, addToMyNums: myNums.add),
                      ElevatedButton(onPressed: null, child: Text('.')),
                      ElevatedButton(onPressed: null, child: Text('='))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MathButton extends StatelessWidget {
  final int i;
  final void Function(int i2) addToMyNums;
  const MathButton(this.i, {super.key, required this.addToMyNums});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          addToMyNums(i);
        },
        child: Text(i.toString()));
  }
}
