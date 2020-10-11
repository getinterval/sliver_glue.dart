part of sliver_glue.mobx;

void noOp() {}

/// A sliver that shows a linear observable list from MobX.
/// Changes to the list will trigger a re-render automatically.
/// 
/// Otherwise, this sliver exposes the same properties as
/// [SliverGlueList].
class SliverGlueObservableList<T> extends StatefulWidget {
  final ObservableList<T> data;
  final ScrollGlueWidgetBuilder<T> builder;

  final EdgeInsets padding;

  final Widget header;
  final Widget footer;

  final bool reversed;

  final GlueDismiss dismiss;
  final GlueDivider divider;

  SliverGlueObservableList(
      {Key key,
      @required this.data,
      @required this.builder,
      this.padding,
      this.header,
      this.footer,
      this.reversed: false,
      this.dismiss: const GlueDismiss(),
      this.divider: const GlueDivider()})
      :
      super(key: key);

  _SliverGlueObservableListState<T> createState() => _SliverGlueObservableListState<T>();
}

class _SliverGlueObservableListState<T> extends State<SliverGlueObservableList<T>> {
  Function _cancel;

  @override
  void initState() {
    super.initState();
    addObserver();
  }

  @override
  void didUpdateWidget(SliverGlueObservableList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    removeObserver();
    addObserver();
  }

  @override
  void dispose() {
    super.dispose();
    removeObserver();
  }

  _observer(ListChange<T> change) => setState(noOp);

  addObserver() {
    _cancel = widget.data.observe(_observer, fireImmediately: true);
  }

  removeObserver() {
    if (_cancel != null) {
      _cancel();
      _cancel = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverGlueList<T>(
      key: widget.key,
      data: widget.data,
      builder: widget.builder,
      padding: widget.padding,
      header: widget.header,
      footer: widget.footer,
      reversed: widget.reversed,
      dismiss: widget.dismiss,
      divider: widget.divider
    );
  }
}