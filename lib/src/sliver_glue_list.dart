part of sliver_glue;

/// A sliver that shows a linear list.
/// 
/// This works very similar to [ListView.builder], and is a wrapper
/// around [SliverList] and [SliverChildBuilderDelegate].
/// 
/// [data] and [builder] must be specified for the list.
/// 
/// Optionally, [SliverGlueList] can...
/// - Wrap the entire list in [padding].
/// - Show a [header] [Widget] before the content.
/// - Make items dismissible via [dismissible] and [dismissibleBuilder]. If [dismissible] is true, [onDismissed] **must** be specified.
/// - Provide bottom-border dividers via [divided] and [dividerBuilder].
class SliverGlueList<T> extends StatelessWidget {
  final List<T> data;
  final ScrollGlueWidgetBuilder<T> builder;

  final EdgeInsets padding;

  final Widget header;

  final bool dismissible;
  final VoidCallback onDismissed;
  final ScrollGlueDismissibleBuilder<T> dismissibleBuilder;

  final bool divided;
  final ScrollGlueDividerBuilder<T> dividerBuilder;

  SliverGlueList(
      {Key key,
      @required this.data,
      @required this.builder,
      this.padding,
      this.header,
      this.dismissible: false,
      this.onDismissed,
      this.dismissibleBuilder,
      this.divided: false,
      this.dividerBuilder})
      :
      assert(!dismissible || onDismissed != null),
      super(key: key);

  Widget _itemBuilder(BuildContext context, int index) {
    if (header != null) {
      if (index == 0) {
        return header;
      }

      index--;
    }

    final entry = data[index];

    final first = index == 0;
    final last = index == data.length - 1;

    Widget widget = builder(context, entry, index, first, last);

    if (dismissible) {
      widget = (dismissibleBuilder ?? _defaultDismissibleBuilder)(context, widget, entry, onDismissed);
    }

    if (divided && !last) {
      widget = (dividerBuilder ?? _defaultDividerBuilder)(context, widget, entry);
    }

    return widget;
  }

  Widget build(BuildContext context) => _wrapPadding(context, padding, SliverList(
    delegate: SliverChildBuilderDelegate(_itemBuilder,
      childCount: data.length + (header != null ? 1 : 0)
    )
  ));
}