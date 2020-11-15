
import 'package:flutter/widgets.dart';
import 'package:preview/preview.dart';
import 'screens/onboarding_screens/choose_name.dart';  
void main() {
  runApp(_PreviewApp());
}

class _PreviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreviewPage(
      path: 'screens/onboarding_screens/choose_name.dart',
      providers: () => [
        ChooseName(), 
        
      ],
    );
  }
}
  