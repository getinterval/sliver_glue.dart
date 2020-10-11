## 1.3.0

- Upgrade `MobX` version, fix bug.

## 1.2.0

Breaking changes:

* Abstract out `dismissable` and `divided` properties
into their own classes, `GlueDismiss` and `GlueDivider`
respectively.

New additions:

* Added `package:sliver_glue/mobx.dart` with a
`SliverGlueObservableList` widget. Due to Dart tree shaking
this will not pull MobX into your project if you don't
explicitly import the `mobx.dart` file.
* Added `footer` and `reversed` options to `SliverGlueObservableList`.
* Added support for `trailingDivider` to `GlueDivider`.

## 1.1.0

* Use built-in `hashCode` instead of `GlueKeyedData`.

## 1.0.0

* Initial release.
