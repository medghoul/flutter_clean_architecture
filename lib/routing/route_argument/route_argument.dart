abstract class RouteArgument {
  Map<String, dynamic> toJson();
  
  String get typeName;
  
  static final Map<String, Function(Map<String, dynamic>)> _factories = {};
  
  static void registerFactory(String typeName, Function(Map<String, dynamic>) factory) {
    _factories[typeName] = factory;
  }
  
  static RouteArgument? fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String?;
    if (type == null || !_factories.containsKey(type)) return null;
    
    return _factories[type]!(json);
  }
}