import 'package:flutter/widgets.dart';
import 'package:preview/preview.dart';
import 'package:navigationapp/screens/choose_activity.dart';

void main() {
  runApp(_PreviewApp());
}

class _PreviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreviewPage(
      path: '/choose_activity.dart',
      providers: () => [],
    );
  }
}
