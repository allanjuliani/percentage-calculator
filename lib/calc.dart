import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalcPage extends StatefulWidget {
  CalcPage({Key key}) : super(key: key);

  @override
  CalcState createState() => CalcState();
}

class CalcState extends State<CalcPage> {
  final _formKey = GlobalKey<FormState>();

  double value1 = 0.0;
  double value2 = 0.0;
  double value3 = 0.0;

  TextEditingController input1 = new TextEditingController();
  TextEditingController input2 = new TextEditingController();
  TextEditingController input3 = new TextEditingController();

  final List<String> entries = <String>[];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(AppLocalizations.of(context).percentageCalculator),
      ),

      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // First input
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: new TextFormField(
                controller: input1,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some number';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  border: UnderlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.delete),
                    tooltip: 'Clear',
                    onPressed: (){
                      value1 = 0.0;
                      input1.clear();
                    },
                  ),
                  hintText: AppLocalizations.of(context).typeNumber,
                  labelText: AppLocalizations.of(context).xis,
                ),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  if (value == "") value = "0";
                  value1 = double.parse(value);
                  doTheMath();
                },
              ),
            ),

            // Second input
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: new TextFormField(
                controller: input2,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some number';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  border: UnderlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.delete),
                    tooltip: 'Clear',
                    onPressed: (){
                      value2 = 0.0;
                      input2.clear();
                    },
                  ),
                  hintText: AppLocalizations.of(context).typeNumber,
                  labelText: AppLocalizations.of(context).x,
                ),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  if (value == "") value = "0";
                  value2 = double.parse(value);
                  doTheMath();
                },
              ),
            ),

            // Third input
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: new TextFormField(
                controller: input3,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some number';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  border: UnderlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.delete),
                    tooltip: 'Clear',
                    onPressed: (){
                      value3 = 0;
                      input3.clear();
                    },
                  ),
                  hintText: AppLocalizations.of(context).typeNumber,
                  labelText: AppLocalizations.of(context).ofx,
                ),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  if (value == "") value = "0";
                  value3 = double.parse(value);
                  doTheMath();
                },
              ),
            ),

            ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              ),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                final item = entries[index];
                return Dismissible(
                  key: Key(item),
                  onDismissed: (direction) {
                    setState(() {
                      entries.removeAt(index);
                    });
                    //Scaffold.of(context).showSnackBar(SnackBar(content: Text("$item dismissed")));
                  },
                  //background: Container(color: Colors.red),
                  child: Center(
                      heightFactor: 3,
                      child: Text('${entries[index]}')
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  doTheMath() {
    bool print = true;
    var math;
    var text;
    var iss = AppLocalizations.of(context).iss;
    var percentOf = AppLocalizations.of(context).percentOf;

    var number1 = numberFormat(value1);
    var number2 = numberFormat(value2);
    var number3 = numberFormat(value3);

    if (value1 == 0 && value2 > 0 && value3 > 0) {
      log('if 1');
      math = (value2*value3)/100;
      input1.text = numberFormat(math);
      number1 = numberFormat(math);

    } else if (value1 > 0 && value2 == 0 && value3 > 0) {
      log('if 2');
      math = (value1/value3)*100;
      input2.text = numberFormat(math);
      number2 = numberFormat(math);

    } else if (value1 > 0 && value2 > 0 && value3 == 0) {
      log('if 3');
      math = (value1/value2)*100;
      input3.text = numberFormat(math);
      number3 = numberFormat(math);

    } else if (value1 > 0 && value2 > 0 && value3 > 0) {
      print = false;
      setState(() {
        text = AppLocalizations.of(context).cleanSome;
        entries.insert(0, text);
      });

    } else {
      log('do nothing');
      print = false;
    }

    if (print) {
      setState(() {
        text = "$number1 $iss $number2$percentOf $number3";
        entries.insert(0, text);
      });
    }
  }

  String numberFormat(double number) {
    var rounded = number.round();

    if (number == rounded) {
      return rounded.toString();
    } else {
      return number.toStringAsFixed(2);
    }
  }
}
