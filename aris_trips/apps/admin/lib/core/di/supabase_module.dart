import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Exposes the Supabase client to the data layer only.
@module
abstract class SupabaseModule {
  @lazySingleton
  SupabaseClient get client => Supabase.instance.client;
}
