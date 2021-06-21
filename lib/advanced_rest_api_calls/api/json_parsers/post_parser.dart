import '../json_models/post.dart';
import './json_parsers.dart';

class PostParser extends JsonParser<Post> with ObjectDecoder<Post> {
  const PostParser();

  @override
  Future<Post> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return Post.fromJson(decoded);
  }
}
