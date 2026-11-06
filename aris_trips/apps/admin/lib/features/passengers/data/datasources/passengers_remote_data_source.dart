import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/passenger_models.dart';

abstract interface class PassengersRemoteDataSource {
  Future<List<Map<String, dynamic>>> fetchBookings(String tripId);

  Future<Map<String, dynamic>> fetchBooking(String bookingId);

  Future<List<Map<String, dynamic>>> searchPassengers(String query);

  /// Calls `import_trip_passengers`; returns one row per passenger.
  Future<List<Map<String, dynamic>>> importPassengers(
    String tripId,
    List<Map<String, dynamic>> rows,
  );

  Future<String> insertBooking(String tripId, String passengerId);

  Future<Map<String, dynamic>> updatePassenger(
    String passengerId,
    Map<String, dynamic> values,
  );

  Future<void> updateBooking(String bookingId, Map<String, dynamic> values);

  Future<void> deleteRow(String table, String id);

  Future<void> insertRow(String table, Map<String, dynamic> values);

  Future<void> updateRow(String table, String id, Map<String, dynamic> values);

  /// Inserts rows, skipping (booking, target) pairs that already exist.
  /// Returns how many were inserted.
  Future<int> insertMissing(
    String table,
    String conflictColumns,
    List<Map<String, dynamic>> rows,
  );
}

@LazySingleton(as: PassengersRemoteDataSource)
class SupabasePassengersRemoteDataSource implements PassengersRemoteDataSource {
  const SupabasePassengersRemoteDataSource(this._client);

  final SupabaseClient _client;

  static final RegExp _filterSyntax = RegExp(r'[,()*%\\:"]');

  @override
  Future<List<Map<String, dynamic>>> fetchBookings(String tripId) => _client
      .from('bookings')
      .select(BookingModel.columns)
      .eq('trip_id', tripId);

  @override
  Future<Map<String, dynamic>> fetchBooking(String bookingId) => _client
      .from('bookings')
      .select(BookingModel.columns)
      .eq('id', bookingId)
      .single();

  @override
  Future<List<Map<String, dynamic>>> searchPassengers(String query) {
    final text = query.replaceAll(_filterSyntax, ' ').trim();
    return _client
        .from('passengers')
        .select(PassengerModel.columns)
        .or(
          'first_name.ilike."*$text*",last_name.ilike."*$text*",'
          'email.ilike."*$text*"',
        )
        .order('last_name')
        .order('first_name')
        .limit(20);
  }

  @override
  Future<List<Map<String, dynamic>>> importPassengers(
    String tripId,
    List<Map<String, dynamic>> rows,
  ) async {
    final result = await _client.rpc<List<dynamic>>(
      'import_trip_passengers',
      params: {'p_trip_id': tripId, 'p_rows': rows},
    );
    return result.cast<Map<String, dynamic>>();
  }

  @override
  Future<String> insertBooking(String tripId, String passengerId) async {
    final row = await _client
        .from('bookings')
        .insert({'trip_id': tripId, 'passenger_id': passengerId})
        .select('id')
        .single();
    return row['id'] as String;
  }

  @override
  Future<Map<String, dynamic>> updatePassenger(
    String passengerId,
    Map<String, dynamic> values,
  ) => _client
      .from('passengers')
      .update(values)
      .eq('id', passengerId)
      .select(PassengerModel.columns)
      .single();

  @override
  Future<void> updateBooking(String bookingId, Map<String, dynamic> values) =>
      _client
          .from('bookings')
          .update(values)
          .eq('id', bookingId)
          .select('id')
          .single();

  @override
  Future<void> deleteRow(String table, String id) =>
      _client.from(table).delete().eq('id', id).select('id').single();

  @override
  Future<void> insertRow(String table, Map<String, dynamic> values) =>
      _client.from(table).insert(values);

  @override
  Future<void> updateRow(
    String table,
    String id,
    Map<String, dynamic> values,
  ) => _client.from(table).update(values).eq('id', id).select('id').single();

  @override
  Future<int> insertMissing(
    String table,
    String conflictColumns,
    List<Map<String, dynamic>> rows,
  ) async {
    final inserted = await _client
        .from(table)
        .upsert(rows, onConflict: conflictColumns, ignoreDuplicates: true)
        .select('id');
    return inserted.length;
  }
}
