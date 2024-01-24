import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

part 'loading.g.dart';

@swidget
Widget _loadingWidget(BuildContext context) {
  return Center(
    child: LoadingAnimationWidget.prograssiveDots(
      color: Theme.of(context).colorScheme.primary,
      size: 50,
    ),
  );
}
