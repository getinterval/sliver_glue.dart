part of sliver_glue;

// Used by ScrollGlueGrid.
const _kPadding = const EdgeInsets.all(16.0);
const _kSpacing = 8.0;
const _kAspectRatio = 3 / 4;
const _kCrossAxisCount = 2;

class ScrollGlueGrid<T extends GlueKeyedData> extends StatelessWidget {
  final List<T> data;
  final ScrollGlueWidgetBuilder<T> builder;

  final EdgeInsets padding;
  final num spacing;
  final num aspectRatio;
  final num crossAxisCount;

  final bool dismissible;
  final VoidCallback onDismissed;
  final ScrollGlueDismissibleBuilder<T> dismissibleBuilder;

  ScrollGlueGrid(
      {Key key,
      @required this.data,
      @required this.builder,
      this.padding: _kPadding,
      this.spacing: _kSpacing,
      this.aspectRatio: _kAspectRatio,
      this.crossAxisCount: _kCrossAxisCount,
      this.dismissible: false,
      this.onDismissed,
      this.dismissibleBuilder})
      :
      assert(!dismissible || onDismissed != null),
      super(key: key);

  Widget _itemBuilder(BuildContext context, int index) {
    final entry = data[index];

    final first = index == 0;
    final last = index == data.length - 1;

    Widget widget = builder(context, entry, index, first, last);

    if (dismissible) {
      widget = (dismissibleBuilder ?? _defaultDismissibleBuilder)(context, widget, entry, onDismissed);
    }

    return widget;
  }

  Widget build(BuildContext context) => _wrapPadding(context, padding, SliverGrid(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
      childAspectRatio: aspectRatio
    ),
    delegate: SliverChildBuilderDelegate(_itemBuilder, childCount: data.length),
  ));
}