import 'package:flutter/material.dart';

class BiologyData extends StatelessWidget {
  final String description;
  final String value;

  const BiologyData({Key key, this.description, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          child: Text(
            description,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Container(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
