import 'package:flutter/material.dart';

class FlexibleCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center
            ,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Divider(), // Add a divider for visual separation
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Description goes here.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              ButtonBar(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Action 1'),
                    style: ButtonStyle(

                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    );

  }
}

void main() {
  runApp(MaterialApp(
    home: FlexibleCardWidget(),
  ));
}
