import 'package:first_app/config/app_config.dart';
import 'package:first_app/data/model/post.dart';
import 'package:first_app/data/service/base_service.dart';

class GetPostService extends BaseService<List<Post>> {
  @override
  Future<List<Post>> call() async {
    final result = await get(AppConfig.posts);
    print(result);
    return List.generate(
      result['data'].length,
      (index) => Post.fromJson(
        result['data'][index],
      ),
    );
  }
}
