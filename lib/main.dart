import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/blocs.dart';
import 'services/services.dart';
import 'pages/pages.dart';

void main() => runApp(
  RepositoryProvider<AuthenticationService>(
    create: (context){
      return FakeAuthenticationService();
    },
    child: BlocProvider<AuthenticationBloc>(
      create: (context){
        final authService = RepositoryProvider.of<AuthenticationService>(context);
        return AuthenticationBloc(authService)..add(AppLoaded());
      },
      child: MyApp(),
    ),
  )
);

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state){
          if (state is AuthenticationAuthenticated){
            return HomePage(user: state.user,);
          }
          return LoginPage();
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

 
 
 

 
 
 
 

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
     
     
     
     
     
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   
   
   
   
   
   
    return Scaffold(
      appBar: AppBar(
       
       
        title: Text(widget.title),
      ),
      body: Center(
       
       
        child: Column(
         
         
         
         
         
         
         
         
         
         
         
         
         
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
