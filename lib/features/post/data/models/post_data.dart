import 'package:clean_architecture_template/features/post/domain/entities/post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_data.g.dart';

@JsonSerializable()
class PostData extends Post {
  PostData({
    required super.userId,
    required super.id,
    required super.title,
    required super.completed,
  });

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);
  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}
