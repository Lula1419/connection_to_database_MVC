

import 'package:connection_db_mvc/controller/database_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final DatabaseController _controller = DatabaseController();

  Future<void> _connectToDatabase() async{
    await _controller.connectToDatabase();
    setState(() {});
  }

  void _disconnectFromDatabase(){
    _controller.disconnectFromDatabase();
    setState(() {});
  }

  Widget build(BuildContext context){
    final bool isConnected = _controller.isDatabaseConnected();

    return Scaffold(
      appBar: AppBar(title: Text('Flutter DB Connection MVC')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: isConnected ? null : _connectToDatabase, 
              child: Text('Conectar a la base de datos'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: isConnected ? _disconnectFromDatabase : null, 
              child: Text("Desconectar de la base de datos"),
            )
          ],
        ),
      )
    );
  }

}