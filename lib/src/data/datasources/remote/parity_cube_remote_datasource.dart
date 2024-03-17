
import '../../../core/api_client.dart';
import '../../../data/models/deals/deals_model.dart';


abstract class ParityCubeRemoteDataSource {
  Future<DealsModel> getTopDeals({required Map<String, dynamic> requestBody});
  Future<DealsModel> getPopularDeals({required Map<String, dynamic> requestBody});
  Future<DealsModel> getFeaturedDeals({required Map<String, dynamic> requestBody});
}

class ParityCubeRemoteDataSourceImpl extends ParityCubeRemoteDataSource {
  final ApiClient _client;

  ParityCubeRemoteDataSourceImpl(this._client);

  @override
  Future<DealsModel> getTopDeals({required Map<String, dynamic> requestBody}) async{
    final response = await _client.get('new?per_page=10&page=${requestBody['page']}&fields=id, created_at,created_at_in_millis,image_medium,comments_count,store{name}');
    return DealsModel.fromJson(response);
  }

  @override
  Future<DealsModel> getPopularDeals({required Map<String, dynamic> requestBody}) async{
    final response = await _client.get('discussed?per_page=10&page=${requestBody['page']}&fields=i d.created_at.created_at_in_millis,image_medium,comments_count,store{name}');
    return DealsModel.fromJson(response);
  }

  @override
  Future<DealsModel> getFeaturedDeals({required Map<String, dynamic> requestBody}) async{
    final response = await _client.get('discussed?per_page=10&page=${requestBody['page']}&fields=id, created_at,created_at_in_millis,image_medium,comments_count,store{name}');
    return DealsModel.fromJson(response);
  }
}