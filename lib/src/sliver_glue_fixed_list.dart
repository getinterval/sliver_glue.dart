part of sliver_glue;

/// A sliver that shows a fixed list of widgets.
/// 
/// Optionally, [SliverGlueFixedList] can wrap the widgets in [padding].
class SliverGlueFixedList extends StatelessWidget {
  final List<Widget> widgets;

  final EdgeInsets padding;

  SliverGlueFixedList({Key key, @required this.widgets, this.padding: const EdgeInsets.all(0.0)}) : super(key: key);

  Widget build(BuildContext context) {
    if (widgets.length == 1) {
      return _wrapPadding(context, padding, SliverToBoxAdapter(
        child: widgets[0]
      ));
    }

    return _wrapPadding(context, padding, SliverList(
      delegate: SliverChildListDelegate(widgets),
    ));
  }
}