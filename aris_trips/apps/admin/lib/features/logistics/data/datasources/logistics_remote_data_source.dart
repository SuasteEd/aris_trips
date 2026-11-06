import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/logistics_models.dart';

/// Thin CRUD over the logistics tables. Rows come back as JSON maps that the
/// repositories convert with the models.
abstract interface class LogisticsRemoteDataSource {
  Future<List<Map<String, dynamic>>> list({
    required LogisticsTable table,
    required String tripId,
  });

  Future<Map<String, dynamic>> insert({
    required LogisticsTable table,
    required String tripId,
    required Map<String, dynamic> values,
  });

  Future<Map<String, dynamic>> update({
    required LogisticsTable table,
    required String id,
    required Map<String, dynamic> values,
  });

  Future<void> delete({required LogisticsTable table, required String id});
}

enum LogisticsTable {
  flights('flights', FlightModel.columns, 'departs_at'),
  lodgings('lodgings', LodgingModel.columns, 'check_in_at'),
  itineraryItems('itinerary_items', ItineraryItemModel.columns, 'starts_at');

  const LogisticsTable(this.name, this.columns, this.orderBy);

  final String name;

  /// Explicit columns read by the app.
  final String columns;
  final String orderBy;
}

@LazySingleton(as: LogisticsRemoteDataSource)
class SupabaseLogisticsRemoteDataSource implements LogisticsRemoteDataSource {
  const SupabaseLogisticsRemoteDataSource(this._client);

  final SupabaseClient _client;

  @override
  Future<List<Map<String, dynamic>>> list({
    required LogisticsTable table,
    required String tripId,
  }) => _client
      .from(table.name)
      .select(table.columns)
      .eq('trip_id', tripId)
      .order(table.orderBy)
      .order('id');

  @override
  Future<Map<String, dynamic>> insert({
    required LogisticsTable table,
    required String tripId,
    required Map<String, dynamic> values,
  }) => _client
      .from(table.name)
      .insert({...values, 'trip_id': tripId})
      .select(table.columns)
      .single();

  @override
  Future<Map<String, dynamic>> update({
    required LogisticsTable table,
    required String id,
    required Map<String, dynamic> values,
  }) => _client
      .from(table.name)
      .update(values)
      .eq('id', id)
      .select(table.columns)
      .single();

  /// `.select()` makes a delete hidden by RLS fail instead of silently
  /// removing nothing.
  @override
  Future<void> delete({
    required LogisticsTable table,
    required String id,
  }) async {
    await _client.from(table.name).delete().eq('id', id).select('id').single();
  }
}
