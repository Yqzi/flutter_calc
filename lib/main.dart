import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

enum Mod { add, mult, divide, subtract, equals, clear, none }

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String x = "0";
  String y = '0';
  bool showx = true;
  Mod mod = Mod.none;

  void addToX(String a) {
    showx = true;
    setState(() {
      if (x[0] == '0') x = "";
      x += a;
    });
  }

  void selectMod(Mod m) {
    showx = true;
    if (m == Mod.clear) {
      y = '0';
      setState(() {
        x = '0';
      });
      mod = Mod.none;
      return;
    } else if (mod != Mod.none) {
      doCalculation();
    } else {
      y = x;
      x = '0';
    }
    mod = m;
    print(y);
  }

  void doCalculation() {
    double z = double.parse(x);
    double k = double.parse(y);
    if (mod == Mod.add) {
      k += z;
    } else if (mod == Mod.divide) {
      k /= z;
    } else if (mod == Mod.mult) {
      k *= z;
    } else if (mod == Mod.subtract) {
      k -= z;
    }
    setState(() {
      y = k.toString();
      showx = false;
    });
    x = '0';
    mod = Mod.none;
    print(x);
  }

  @override
  Widget build(BuildContext context) {
    print(x);
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              color: Colors.deepPurple,
              child: Text(
                showx ? x : y,
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
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
                      ElevatedButton(
                          onPressed: () => selectMod(Mod.clear),
                          child: const Text('AC')),
                      ElevatedButton(onPressed: null, child: Text('+/-')),
                      ElevatedButton(onPressed: null, child: Text('%')),
                      ElevatedButton(
                          onPressed: () => selectMod(Mod.divide),
                          child: const Text('/'))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MathButton('7', add_to_x: addToX),
                      MathButton('8', add_to_x: addToX),
                      MathButton('9', add_to_x: addToX),
                      ElevatedButton(
                          onPressed: () => selectMod(Mod.mult),
                          child: const Text('*'))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MathButton('4', add_to_x: addToX),
                      MathButton('5', add_to_x: addToX),
                      MathButton('6', add_to_x: addToX),
                      ElevatedButton(
                          onPressed: () => selectMod(Mod.subtract),
                          child: const Text('-'))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MathButton('1', add_to_x: addToX),
                      MathButton('2', add_to_x: addToX),
                      MathButton('3', add_to_x: addToX),
                      ElevatedButton(
                          onPressed: () => selectMod(Mod.add),
                          child: const Text('+'))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MathButton('0', add_to_x: addToX),
                      MathButton('.', add_to_x: addToX),
                      ElevatedButton(
                          onPressed: () => selectMod(Mod.equals),
                          child: const Text('='))
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
  final String i;
  final void Function(String i2) add_to_x;
  const MathButton(this.i, {super.key, required this.add_to_x});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          add_to_x(i.toString());
        },
        child: Text(i.toString()));
  }
}
