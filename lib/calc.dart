import 'package:flutter/material.dart';
import 'dart:developer';

class CalcPage extends StatefulWidget {
  CalcPage({Key key}) : super(key: key);

  @override
  CalcState createState() => CalcState();
}

class CalcState extends State<CalcPage> {
  final _formKey = GlobalKey<FormState>();

  double value1 = 0;
  double value2 = 0;
  double value3 = 0;

  TextEditingController mathReturn = new TextEditingController();
  TextEditingController input1 = new TextEditingController();
  TextEditingController input2 = new TextEditingController();
  TextEditingController input3 = new TextEditingController();

  final List<String> entries = <String>[];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Percentage Calculator'),
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
                      if (input1.text != "") value1 = double.parse(input1.text);
                      if (input2.text != "") value2 = double.parse(input2.text);
                      if (input3.text != "") value3 = double.parse(input3.text);
                    },
                  ),
                  hintText: 'Type a number',
                  labelText: 'X is',
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
                      value2 = 0;
                      input2.clear();
                      if (input1.text != "") value1 = double.parse(input1.text);
                      if (input2.text != "") value2 = double.parse(input2.text);
                      if (input3.text != "") value3 = double.parse(input3.text);
                    },
                  ),
                  hintText: 'Type a number',
                  labelText: 'X %',
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
                      if (input1.text != "") value1 = double.parse(input1.text);
                      if (input2.text != "") value2 = double.parse(input2.text);
                      if (input3.text != "") value3 = double.parse(input3.text);
                    },
                  ),
                  hintText: 'Type a number',
                  labelText: 'of X',
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
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text("$item dismissed")));
                    },
                    background: Container(color: Colors.red),
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
    var math;

    log('value1: $value1');
    log('value2: $value2');
    log('value3: $value3');

    if (value1 == 0 && value2 > 0 && value3 > 0) {
      log('if 1');
      math = (value2*value3)/100;
      input1.text = prettyPrint(math).toString();
      //mathReturn.text =  "$math is $value2 percent of $value3";
      setState(() {
        entries.add("$math is $value2 percent of $value3");
      });

    } else if (value1 > 0 && value2 == 0 && value3 > 0) {
      log('if 2');
      math = (value1/value3)*100;
      input2.text = prettyPrint(math).toString();
      //mathReturn.text =  "$value1 is $math percent of $value3";
      setState(() {
        entries.add("$value1 is $math percent of $value3");
      });

    } else if (value1 > 0 && value2 > 0 && value3 == 0) {
      log('if 3');
      math = (value1/value2)*100;
      input3.text = prettyPrint(math).toString();
      //mathReturn.text =  "$value1 is $value2 percent of $math";
      setState(() {
        entries.add("$value1 is $value2 percent of $math");
      });

    }  else  {
      log('else');
      //mathReturn.text =  "value1: $value1 - value2:$value2 - value3:$value3";
      //mathReturn.text =  "";
    }
  }

  String prettyPrint(double n) {
    //NumberFormat formatter = NumberFormat("00.00");
    //number = formatter.format(n);
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 3);
  }
}

//class AddInput extends StatelessWidget {
//  final String labels;
//  AddInput({Key key,  @required this.labels}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Container(
//      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
//      child: new TextFormField(
//        validator: (value) {
//          if (value.isEmpty) {
//            return 'Please enter some text';
//          }
//          return null;
//        },
//
//        decoration: const InputDecoration(
//          fillColor: Colors.transparent,
//          border: UnderlineInputBorder(),
//          filled: true,
//          icon: const Icon(
//            Icons.auto renew,
//            color: Colors.purpleAccent,
//          ),
//          hintText: 'this.labels',
//          labelText: 'labels',
//        ),
//        keyboardType: TextInputType.number,
//        onSaved: (String value) {
//          //person.email = value;
//        },
//      ),
//    );
//  }
//}
