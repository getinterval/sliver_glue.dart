part of sliver_glue;

typedef Widget GlueDividerBuilder<T>(BuildContext context, Widget widget, T? entry);

Widget _defaultDividerBuilder(BuildContext context, Widget widget, entry) {
  return DecoratedBox(
    key: ValueKey("${entry.hashCode.toString()}_divider"),
    child: widget,
    position: DecorationPosition.foreground,
    decoration: BoxDecoration(
      border: Border(
        bottom: Divider.createBorderSide(context, width: 1.0)
      ),
    ),
  );
}

/// Provides options for how a glue sliver component widget should
/// divide it's items.
/// 
/// It accomplishes this by adding a bottom border
/// to every element except the last one. This functionality can
/// be overwritten by the [trailingDivider] option.
class GlueDivider {
  final bool enabled;
  final bool trailingDivider;
  final GlueDividerBuilder builder;

  const GlueDivider({
    this.enabled: false,
    this.trailingDivider: false,
    this.builder: _defaultDividerBuilder
  });
}