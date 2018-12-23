import 'package:flutter/material.dart';
import 'package:sliver_glue/sliver_glue.dart';

class TextData with GlueKeyedData {
  final String text;

  TextData(this.text);

  String getKey() => text;
}

final List<TextData> text = <TextData>[
  TextData('A'),
  TextData('B')
];

class MyApp extends StatelessWidget {
  Widget _itemBuilder(BuildContext context, TextData data, _, __, ___) =>
    Text(data.text, key: Key(data.getKey()));
 
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverGlueFixedList(
          widgets: <Widget>[
            Container(
              height: 200,
              child: Placeholder()
            )
          ],
        ),
        SliverGlueList(
          data: text,
          header: Text('Our List Header'),
          builder: _itemBuilder,
          divided: true,
        ),
        SliverGlueGrid(
          data: text,
          builder: _itemBuilder,
          dismissible: true
        )
      ],
    );
  }
}

void main() => runApp(MyApp());
