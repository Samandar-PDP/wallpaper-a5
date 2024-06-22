import 'package:wallpaper_app/model/image_response.dart';
import 'package:wallpaper_app/network/api_service.dart';
import 'package:wallpaper_app/util/constants.dart';

class AppRepository {
  final _api = ApiService(buildDioClient(Constants.baseUrl));
  Future<List<Photos>> getImages(String query) async {
    final response = await _api.getImages(query);
    return response.photos ?? [];
  }
}