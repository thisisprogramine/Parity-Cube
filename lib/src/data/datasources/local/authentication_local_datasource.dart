
import 'package:hive/hive.dart';

abstract class AuthenticationLocalDataSource {
  Future<void> clear();
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource {

  @override
  Future<void> clear() async{
    return await Hive.deleteFromDisk();
  }

}