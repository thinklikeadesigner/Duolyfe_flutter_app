import 'package:flutter/widgets.dart';
import 'package:preview/preview.dart';
import 'screens/choose_activity.dart';

void main() {
  runApp(_PreviewApp());
}

class _PreviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreviewPage(
      path: 'screens/choose_activity.dart',
      providers: () => [
        // ChooseActivity(),
      ],
    );
  }
}
