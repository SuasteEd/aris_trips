import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/cover_image.dart';
import '../../domain/entities/trip.dart';
import '../../domain/entities/trip_draft.dart';
import '../../domain/entities/trip_status.dart';
import '../../domain/entities/trips_query.dart';
import '../models/trip_model.dart';

abstract interface class TripsRemoteDataSource {
  Future<List<Trip>> fetchTrips(TripsQuery query);

  Future<Trip> fetchTrip(String id);

  Future<Trip> insertTrip(TripDraft draft);

  Future<Trip> updateTrip(String id, TripDraft draft);

  Future<Trip> updateStatus(String id, TripStatus status);

  Future<Trip> replaceCover(Trip trip, CoverImage image);
}

@LazySingleton(as: TripsRemoteDataSource)
class SupabaseTripsRemoteDataSource implements TripsRemoteDataSource {
  const SupabaseTripsRemoteDataSource(this._client);

  final SupabaseClient _client;

  static const String _table = 'trips';
  static const String _bucket = 'public-media';
  static const int listLimit = 200;

  /// Characters with meaning in PostgREST filter syntax.
  static final RegExp _filterSyntax = RegExp(r'[,()*%\\:"]');

  @override
  Future<List<Trip>> fetchTrips(TripsQuery query) async {
    var request = _client.from(_table).select(TripModel.columns);

    final status = query.status;
    if (status != null) request = request.eq('status', status.value);

    final search = query.search.replaceAll(_filterSyntax, ' ').trim();
    if (search.isNotEmpty) {
      request = request.or('name.ilike.*$search*,destination.ilike.*$search*');
    }

    final rows = await request
        .order('start_date', ascending: status != TripStatus.archived)
        .order('name')
        .limit(listLimit);
    return rows.map(_toEntity).toList();
  }

  @override
  Future<Trip> fetchTrip(String id) async {
    final row = await _client
        .from(_table)
        .select(TripModel.columns)
        .eq('id', id)
        .single();
    return _toEntity(row);
  }

  @override
  Future<Trip> insertTrip(TripDraft draft) async {
    final row = await _client
        .from(_table)
        .insert(TripModel.draftToJson(draft))
        .select(TripModel.columns)
        .single();
    return _toEntity(row);
  }

  @override
  Future<Trip> updateTrip(String id, TripDraft draft) =>
      _update(id, TripModel.draftToJson(draft));

  @override
  Future<Trip> updateStatus(String id, TripStatus status) =>
      _update(id, {'status': status.value});

  @override
  Future<Trip> replaceCover(Trip trip, CoverImage image) async {
    final extension = switch (image.contentType) {
      'image/png' => 'png',
      'image/webp' => 'webp',
      _ => 'jpg',
    };
    // A new name per upload keeps CDN caches from serving the old image.
    final path =
        'trips/${trip.id}/cover-${DateTime.now().millisecondsSinceEpoch}.$extension';
    final bucket = _client.storage.from(_bucket);

    await bucket.uploadBinary(
      path,
      image.bytes,
      fileOptions: FileOptions(
        contentType: image.contentType,
        cacheControl: '31536000',
      ),
    );

    final Trip updated;
    try {
      updated = await _update(trip.id, {'cover_path': path});
    } catch (_) {
      await _removeQuietly(path);
      rethrow;
    }

    final previous = trip.coverPath;
    if (previous != null && previous != path) await _removeQuietly(previous);
    return updated;
  }

  Future<Trip> _update(String id, Map<String, dynamic> changes) async {
    final row = await _client
        .from(_table)
        .update(changes)
        .eq('id', id)
        .select(TripModel.columns)
        .single();
    return _toEntity(row);
  }

  /// Best effort: an orphan file must not fail an otherwise saved change.
  Future<void> _removeQuietly(String path) async {
    try {
      await _client.storage.from(_bucket).remove([path]);
    } catch (error) {
      if (kDebugMode) {
        developer.log(
          'Could not remove $path: ${error.runtimeType}',
          name: 'trips',
        );
      }
    }
  }

  Trip _toEntity(Map<String, dynamic> row) {
    final model = TripModel.fromJson(row);
    final coverPath = model.coverPath;
    return model.toEntity(
      coverUrl: coverPath == null
          ? null
          : _client.storage.from(_bucket).getPublicUrl(coverPath),
    );
  }
}
