# sliver_glue.dart | 1.1.0

[![Pub](https://img.shields.io/pub/v/sliver_glue.svg)](https://pub.dartlang.org/packages/sliver_glue)

Helpers for easily mixing content in a Flutter CustomScrollView, simple as ListView & GridView.

## Inspiration

`sliver_glue` exists mostly for mixing different kinds of content in a `CustomScrollView`. For a scrolling application, this is a possible common pattern in the **same view.**

- Header widgets / AppBar
- Grid of items
- A list of items

To use all of these in a `CustomScrollView`, using `SliverList` and `SliverGrid` have more boilerplate than using `ListView` and `GridView`.

`sliver_glue` aims to help with that problem, and goes a little beyond this too (providing dismissable-ness and dividing lines, common use-cases).

## Getting Started

```dart
import 'package:flutter/material.dart';
import 'package:sliver_glue/sliver_glue.dart';

final List<String> text = ['A', 'B'];

class MyApp extends StatelessWidget {
  Widget _itemBuilder(BuildContext context, String str, _, __, ___) =>
    Text(data.text, key: Key(str));
 
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
```