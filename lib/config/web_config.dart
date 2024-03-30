import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

final baseOps = BaseOptions(
  // connectTimeout: const Duration(seconds: 30),
  // receiveTimeout: const Duration(seconds: 30),
);

final options = CacheOptions(
  store: MemCacheStore(),
  policy: CachePolicy.request,
  priority: CachePriority.normal,
  keyBuilder: CacheOptions.defaultCacheKeyBuilder,
  allowPostMethod: false,
);

String appUrl = "localhost:8888/api/v1";
