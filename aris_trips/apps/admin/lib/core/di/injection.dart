import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

/// Registers every `@injectable` class. Call after `Supabase.initialize`.
@InjectableInit()
void configureDependencies() => getIt.init();
