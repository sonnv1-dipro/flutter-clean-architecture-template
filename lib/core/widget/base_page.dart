import 'package:clean_architecture_template/core/widget/dialog_page.dart';
import 'package:flutter/material.dart';

abstract class BasePage extends StatelessWidget with DialogPage {
  const BasePage({
    Key? key,
  }) : super(key: key);
}
