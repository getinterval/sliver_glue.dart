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
/// - Make items dismissible via [dismiss].
/// - Provide bottom-border dividers via [divided].
class SliverGlueList<T> extends StatelessWidget {
  final List<T> data;
  final ScrollGlueWidgetBuilder<T> builder;

  final EdgeInsets? padding;

  final Widget? header;
  final Widget? footer;

  final bool reversed;

  final GlueDismiss dismiss;
  final GlueDivider divider;

  int get extraItems {
    int count = 0;

    if (header != null) { count++; }

    if (footer != null) { count++; }

    return count;
  }

  SliverGlueList(
      {Key? key,
      required this.data,
      required this.builder,
      this.padding,
      this.header,
      this.footer,
      this.reversed: false,
      this.dismiss: const GlueDismiss(),
      this.divider: const GlueDivider()})
      :
      super(key: key);

  Widget? _itemBuilder(BuildContext context, int index) {
    if (footer != null && index == data.length + extraItems - 1) {
      return footer;
    }

    if (header != null) {
      if (index == 0) {
        return header;
      }

      index--;
    }

    if (reversed) {
      index = data.length - 1 - index;
    }

    final entry = data[index];

    final first = index == 0;
    final last = index == data.length - 1;

    Widget widget = builder(context, entry, index, first, last);

    if (dismiss.enabled) {
      widget = dismiss.builder(context, widget, entry, dismiss.onDismiss ?? () {});
    }

    if (divider.enabled && (divider.trailingDivider || !last)) {
      widget = divider.builder(context, widget, entry);
    }

    return widget;
  }

  Widget build(BuildContext context) => _wrapPadding(context, padding, SliverList(
    delegate: SliverChildBuilderDelegate(_itemBuilder,
      childCount: data.length + extraItems
    )
  ));
}