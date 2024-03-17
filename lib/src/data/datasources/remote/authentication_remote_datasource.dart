
import '../../../core/api_client.dart';

abstract class AuthenticationRemoteDataSource {

}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final ApiClient _client;

  AuthenticationRemoteDataSourceImpl(this._client);

}
