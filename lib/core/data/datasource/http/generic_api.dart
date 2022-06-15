import '../../../config/config.dart';
import '../../../locators/dependency_locator.dart';

class GenericApi {
  Uri getPathWithParams(Map<String, String> params) {
    final Config config = inject<Config>();
    String url = '${config.api.url}?api_key=${config.api.key}';
    params.forEach((key, value) {
      url += '&$key=$value';
    });
    return Uri.parse(url);
  }
}
