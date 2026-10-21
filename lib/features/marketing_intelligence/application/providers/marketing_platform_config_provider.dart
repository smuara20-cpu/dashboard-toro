import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/marketing_platform_config_remote_datasource.dart';

final marketingPlatformConfigDataSourceProvider =
    Provider<MarketingPlatformConfigRemoteDataSource>((ref) {
      return MarketingPlatformConfigRemoteDataSource();
    });
