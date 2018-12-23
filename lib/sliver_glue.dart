library sliver_glue;

import "package:flutter/material.dart";
import "package:flutter/foundation.dart";

part "src/sliver_glue_fixed_list.dart";
part "src/sliver_glue_list.dart";
part "src/sliver_glue_grid.dart";

abstract class GlueKeyedData {
  String getKey();
}

typedef Widget ScrollGlueWidgetBuilder<T extends GlueKeyedData>(BuildContext context, T entry, int i, bool first, bool last);

typedef Widget ScrollGlueDismissibleBuilder<T extends GlueKeyedData>(BuildContext context, Widget widget, T entry, VoidCallback onDismissed);
typedef Widget ScrollGlueDividerBuilder<T extends GlueKeyedData>(BuildContext context, Widget widget, T entry);

Widget _wrapPadding(BuildContext context, EdgeInsets padding, Widget sliver) {
  if (padding == null) {
    return sliver;
  }

  return SliverPadding(
    padding: padding,
    sliver: sliver,
  );
}

Widget _defaultDismissibleBuilder(BuildContext context, Widget widget, GlueKeyedData entry, VoidCallback onDismissed) {
  return Dismissible(
    key: ValueKey("${entry.getKey()}_dismissible"),
    child: widget,
    onDismissed: (_) => onDismissed(),
  );
}

Widget _defaultDividerBuilder(BuildContext context, Widget widget, GlueKeyedData entry) {
  return DecoratedBox(
    key: ValueKey("${entry.getKey()}_divider"),
    child: widget,
    position: DecorationPosition.foreground,
    decoration: BoxDecoration(
      border: Border(
        bottom: Divider.createBorderSide(context, width: 1.0)
      ),
    ),
  );
}
