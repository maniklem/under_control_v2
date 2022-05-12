import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:under_control_v2/features/authentication/presentation/blocs/authentication/authentication_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    DateTime preBackpress = DateTime.now();
    return WillPopScope(
      // double click to exit the app
      onWillPop: () async {
        final timegap = DateTime.now().difference(preBackpress);
        final cantExit = timegap >= const Duration(seconds: 2);
        preBackpress = DateTime.now();
        if (cantExit) {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: const Text('Press Back button again to Exit'),
              duration: const Duration(seconds: 2),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            ));
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () {
                context.read<AuthenticationBloc>().add(SignoutEvent());
              },
              icon: Icon(Icons.exit_to_app))
        ]),
        body: Center(child: Text('Home')),
      ),
    );
  }
}
