import 'package:day5_demo/blocs/theme_bloc/theme_bloc.dart';
import 'package:day5_demo/blocs/theme_bloc/theme_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/main_bloc.dart';
import 'blocs/theme_bloc/theme_events.dart';
import 'blocs/theme_bloc/theme_states.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  late ThemeData _themeState = ThemeData();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: MainBloc.allBlocs(),
        child: CoreApp());
  }
}

class CoreApp extends StatefulWidget {
  const CoreApp({Key? key}) : super(key: key);

  @override
  _CoreAppState createState() => _CoreAppState();
}

class _CoreAppState extends State<CoreApp> {
  ThemeData _themeState = ThemeData.light();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeThemeBloc, ThemeState>(builder: (context, state) => MaterialApp(
      title: 'Flutter Demo',
      theme: _themeState,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    ), listener: (ctx, state) {
      if(state is ThemeLight){
        _themeState = ThemeData.light();
      } else if(state is ThemeDark) {
        _themeState = ThemeData.dark();
      }
    });
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool check = true;
  _requestData(bool isLight) {
    BlocProvider.of<ChangeThemeBloc>(context).add(LightTheme(isLight: isLight));
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeThemeBloc, ThemeState>(
        builder: (context, state) => _buildMainUI(context),
        listener: (context, state) {
          if (state is ThemeState) {}
        });
  }

  Widget _buildMainUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Go to data',
            ),
            ElevatedButton(
                onPressed: () {
                  check = !check;
                  _requestData(check);
                },
                child: const Text('Change'))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {

  }
}
