part of 'index.dart';

enum CdbkrEndpoint implements ApiEndpoint {
  users('/users'),
  posts('/posts'),
  comments('/comments'),
  auth('/auth'),
  products('/products');

  @override
  final String path;
  const CdbkrEndpoint(this.path);

  @override
  String withId(String id) => '$path/$id';
  
  @override
  String nested(ApiEndpoint child) => '$path${child.path}';
  
  @override
  String custom(String customPath) => '$path/$customPath';
}