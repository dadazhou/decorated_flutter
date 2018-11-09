import 'package:flutter/material.dart';
import 'package:framework/framework.dart';

typedef Widget _ItemBuilder<T>(BuildContext context, T data);
typedef Widget _ErrorPlaceholderBuilder(BuildContext context, Object error);

class FutureListView<T> extends StatelessWidget {
  const FutureListView({
    Key key,
    @required this.future,
    @required this.itemBuilder,
    this.shrinkWrap = true,
    this.showLoading = true,
    this.initialData = const [],
    this.emptyPlaceholder,
    this.errorPlaceholderBuilder,
    this.padding,
    this.physics = const ClampingScrollPhysics(),
    this.divider,
  }) : super(key: key);

  //region FutureWidget
  final Future<List<T>> future;
  final bool showLoading;
  final List<T> initialData;
  final Widget emptyPlaceholder;
  final _ErrorPlaceholderBuilder errorPlaceholderBuilder;
  //endregion
  //region ListView.builder
  final _ItemBuilder<T> itemBuilder;
  final bool shrinkWrap;
  final EdgeInsets padding;
  final ScrollPhysics physics;
  //endregion
  final Widget divider;

  @override
  Widget build(BuildContext context) {
    return PreferredFutureBuilder<List<T>>(
      future: future,
      showLoading: showLoading,
      initialData: initialData,
      emptyPlaceholder: emptyPlaceholder,
      errorPlaceholderBuilder: errorPlaceholderBuilder,
      builder: (data) {
        return ListView.builder(
          padding: padding,
          shrinkWrap: shrinkWrap,
          physics: physics,
          itemCount: data.length ?? 0,
          itemBuilder: (context, index) {
            if (index != data.length - 1 && divider != null) {
              return Column(
                children: <Widget>[
                  itemBuilder(context, data[index]),
                  divider,
                ],
              );
            } else {
              return itemBuilder(context, data[index]);
            }
          },
        );
      },
    );
  }
}

class StreamListView<T> extends StatelessWidget {
  const StreamListView({
    Key key,
    @required this.stream,
    @required this.itemBuilder,
    this.shrinkWrap = true,
    this.showLoading = true,
    this.initialData = const [],
    this.emptyPlaceholder,
    this.errorPlaceholderBuilder,
    this.padding,
    this.physics = const ClampingScrollPhysics(),
    this.divider,
  }) : super(key: key);

  //region FutureWidget
  final Stream<List<T>> stream;
  final bool showLoading;
  final List<T> initialData;
  final Widget emptyPlaceholder;
  final _ErrorPlaceholderBuilder errorPlaceholderBuilder;
  //endregion
  //region ListView.builder
  final _ItemBuilder<T> itemBuilder;
  final bool shrinkWrap;
  final EdgeInsets padding;
  final ScrollPhysics physics;
  //endregion
  final Widget divider;

  @override
  Widget build(BuildContext context) {
    return PreferredStreamBuilder<List<T>>(
      stream: stream,
      showLoading: showLoading,
      initialData: initialData,
      emptyPlaceholder: emptyPlaceholder,
      errorPlaceholderBuilder: errorPlaceholderBuilder,
      builder: (data) {
        return ListView.builder(
          padding: padding,
          shrinkWrap: shrinkWrap,
          physics: physics,
          itemCount: data.length ?? 0,
          itemBuilder: (context, index) {
            if (index != data.length - 1 && divider != null) {
              return Column(
                children: <Widget>[
                  itemBuilder(context, data[index]),
                  divider,
                ],
              );
            } else {
              return itemBuilder(context, data[index]);
            }
          },
        );
      },
    );
  }
}
