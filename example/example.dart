import 'package:flutter/material.dart';
import 'package:sliver_glue/sliver_glue.dart';

final List<String> text = <String>[
  'A',
  'B'
];

class MyApp extends StatelessWidget {
  Widget _itemBuilder(BuildContext context, String data, _, __, ___) =>
    Text(data, key: Key(data.toString()));
 
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
