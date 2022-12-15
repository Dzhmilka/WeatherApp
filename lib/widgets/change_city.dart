import 'package:flutter/material.dart';

class ChangeCity extends StatefulWidget {
  const ChangeCity({Key? key}) : super(key: key);

  @override
  State<ChangeCity> createState() => _ChangeCityState();
}

class _ChangeCityState extends State<ChangeCity> {
  final _textController = TextEditingController();
  late String textInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text('Weather App', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Write the city',
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10.0),
              Ink(
                decoration: ShapeDecoration(
                  color: Colors.blue[400],
                  shape: const CircleBorder()
                ),
                child: IconButton(onPressed: () {
                  textInput = _textController.text;
                  Navigator.of(context).pop(textInput);
                },
                    icon: const Icon(Icons.search)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
