part of sliver_glue;

typedef Widget GlueDismissBuilder<T>(BuildContext context, Widget widget, T entry, VoidCallback onDismissed);

Widget _defaultDismissBuilder(BuildContext context, Widget widget, entry, VoidCallback onDismissed) {
  return Dismissible(
    key: ValueKey("${entry.hashCode.toString()}_dismissible"),
    child: widget,
    onDismissed: (_) => onDismissed(),
  );
}

/// Provides options for how a glue sliver component widget should
/// dismiss it's items.
/// 
/// If [dismissible] is true, [onDismissed] **must** be specified.
class GlueDismiss {
  final bool enabled;
  final VoidCallback onDismiss;
  final GlueDismissBuilder builder;

  const GlueDismiss({
    this.enabled: false,
    this.onDismiss,
    this.builder: _defaultDismissBuilder
  }): assert(!enabled || onDismiss != null);
}