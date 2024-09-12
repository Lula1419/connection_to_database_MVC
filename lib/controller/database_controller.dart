import '../models/dababase_model.dart';


class DatabaseController {
  final DatabaseModel _model = DatabaseModel();

  Future<void> connectToDatabase() async{
    await _model.connect();
  }

  void disconnectFromDatabase(){
    _model.disconnect();
  }

  bool isDatabaseConnected(){
    return _model.isConnected();
  }
}