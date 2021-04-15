import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigationapp/authentication/authentication.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.select((AuthenticationBloc bloc) => bloc.state.user);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('logout'),
                    onPressed: () => context
                        .read<AuthenticationBloc>()
                        .add(AuthenticationLogoutRequested()),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
