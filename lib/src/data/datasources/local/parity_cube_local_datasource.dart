
import 'package:hive/hive.dart';

import '../../../config/constants/hive_constants.dart';
import '../../models/deals/deals_model.dart';

abstract class ParityCubeLocalDataSource {

  Future<DealsModel?> getTopDeals();
  Future<void> saveTopDeals({required Map<dynamic, dynamic> requestBody, required Map<dynamic, dynamic> response});

  Future<DealsModel?> getPopularDeals();
  Future<void> savePopularDeals({required Map<dynamic, dynamic> requestBody, required Map<dynamic, dynamic> response});

  Future<DealsModel?> getFeaturedDeals();
  Future<void> saveFeaturedDeals({required Map<dynamic, dynamic> requestBody, required Map<dynamic, dynamic> response});

  Future<void> clearDeals();

}

class ParityCubeLocalDataSourceImpl extends ParityCubeLocalDataSource {

  @override
  Future<DealsModel?> getTopDeals() async{
    final topDealsBox = await Hive.openBox(HiveBox.dealsBox);
    final data = await topDealsBox.get(HiveFields.topDealsField, defaultValue: null);
    return data != null ? DealsModel.fromJson(data) : data;
  }

  @override
  Future<void> saveTopDeals({required Map<dynamic, dynamic> requestBody, required Map<dynamic, dynamic> response}) async{
    final entityBox = await Hive.openBox(HiveBox.dealsBox);
    response['currentPage'] = requestBody['page'];
    await entityBox.put(HiveFields.topDealsField, response);
  }

  @override
  Future<DealsModel?> getPopularDeals() async{
    final topDealsBox = await Hive.openBox(HiveBox.dealsBox);
    final data = await topDealsBox.get(HiveFields.popularDealsField, defaultValue: null);
    return data != null ? DealsModel.fromJson(data) : data;
  }

  @override
  Future<void> savePopularDeals({required Map<dynamic, dynamic> requestBody, required Map<dynamic, dynamic> response}) async{
    final entityBox = await Hive.openBox(HiveBox.dealsBox);
    response['currentPage'] = requestBody['page'];
    await entityBox.put(HiveFields.popularDealsField, response);
  }

  @override
  Future<DealsModel?> getFeaturedDeals() async{
    final topDealsBox = await Hive.openBox(HiveBox.dealsBox);
    final data = await topDealsBox.get(HiveFields.featureDealsField, defaultValue: null);
    return data != null ? DealsModel.fromJson(data) : data;
  }

  @override
  Future<void> saveFeaturedDeals({required Map<dynamic, dynamic> requestBody, required Map<dynamic, dynamic> response}) async{
    final entityBox = await Hive.openBox(HiveBox.dealsBox);
    response['currentPage'] = requestBody['page'];
    await entityBox.put(HiveFields.featureDealsField, response);
  }

  @override
  Future<void> clearDeals() async{
    final dealsBox = await Hive.openBox(HiveBox.dealsBox);
    await dealsBox.clear();
  }

}