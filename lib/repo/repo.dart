import 'package:altsome_app/caching/caching.dart';
import '../model/model_two.dart';
import '../model/model_three.dart';
import '../model/model_one.dart';
import '../service/service.dart';

abstract class Repo {
  static Future<ModelOne?> accessFirstApi() async {
    try {
      Map<String, dynamic>? data = await Service.accessFirstData();
      if (data != null) {
        ModelOne modelOne = ModelOne.changeToDartSyntax(data);
        return modelOne;
      }
      return null;
    } catch (error) {
      print('Catch block is execute for 1st API: $error');
      Map<String, dynamic>? cachedData =
          await getCachingFirstData(CacheProperty.fearAndGreed);
      ModelOne modelOne = ModelOne.changeToDartSyntax(cachedData!);
      return modelOne;
    }
  }

  static Future<ModelTwo?> accessSecondApi() async {
    try {
      Map<String, dynamic>? data = await Service.accessSecondData();
      ModelTwo modelTwo = ModelTwo.fromJson(data!);
      return modelTwo;
    } catch (error) {
      print('Error fetching data: $error');
    }
    return null;
  }

  static Future<ModelThree?> accessSectorsApi() async {
    try {
      Map<String, dynamic>? data =
          await Service.accessSectorsData() as Map<String, dynamic>;
      ModelThree modelThree = ModelThree.fromJson(data);
      print("ModelThree: $modelThree.data.length");
      return modelThree;
    } catch (error) {
      print('Error fetching data: $error');
    }
    return null;
  }
}
