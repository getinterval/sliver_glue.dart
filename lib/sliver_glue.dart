library sliver_glue;

import "package:flutter/material.dart";
import "package:flutter/foundation.dart";

part "src/glue_dismiss.dart";
part "src/glue_divider.dart";

part "src/sliver_glue_fixed_list.dart";
part "src/sliver_glue_list.dart";
part "src/sliver_glue_grid.dart";

typedef Widget ScrollGlueWidgetBuilder<T>(BuildContext context, T entry, int i, bool first, bool last);

Widget _wrapPadding(BuildContext context, EdgeInsets? padding, Widget sliver) {
  if (padding == null) {
    return sliver;
  }

  return SliverPadding(
    padding: padding,
    sliver: sliver,
  );
}
