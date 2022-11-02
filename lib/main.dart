import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:   MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);


  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var inputWidth = MediaQuery.of(context).size.width / 5;

    return Scaffold(
      body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: inputWidth,
            child: TextField(
              controller: textEditingController1,
              focusNode: focus1,
              textAlign: TextAlign.center,
              onChanged: (value) {
//4562
                  if(value.length==4){
                      var nums = value.split('');
                      textEditingController1.text = nums[0];
                      textEditingController2.text = nums[1];
                      textEditingController3.text = nums[2];
                      textEditingController4.text = nums[3];

                  }
                  
                  value.length==1?
                    FocusScope.of(context).nextFocus()
                      :value.isEmpty
                          ? FocusScope.of(context).requestFocus(focus1)
                            :null;

              },
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            width: inputWidth,
            child: TextField(
              controller: textEditingController2,
              focusNode: focus2,
              textAlign: TextAlign.center,
              onChanged: (value) {
                  value.length==1?
                    FocusScope.of(context).nextFocus()
                      :value.isEmpty
                          ? FocusScope.of(context).previousFocus()
                            :null;

              },
              keyboardType: TextInputType.number,
            ),
          ),

          SizedBox(
            width: inputWidth,
            child: TextField(
              controller: textEditingController3,
              focusNode: focus3,
              textAlign: TextAlign.center,
              onChanged: (value) {

                 value.length==1?
                    FocusScope.of(context).nextFocus()
                      :value.isEmpty
                          ? FocusScope.of(context).previousFocus()
                            :null;

              },
              keyboardType: TextInputType.number,
            ),
          ),

          SizedBox(
            width: inputWidth,
            child: TextField(
              controller: textEditingController4,
              focusNode: focus4,
              textAlign: TextAlign.center,
              onChanged: (value) {
                  //

                 value.length==1?
                    FocusScope.of(context).unfocus()
                      :value.isEmpty
                          ? FocusScope.of(context).previousFocus()
                            :null;

              },
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    ));
  }
}
