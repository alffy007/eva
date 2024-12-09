import 'package:supabase_flutter/supabase_flutter.dart';
import 'data_model.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Metric>> fetchMetrics() async {
    final response = await _client.from('metrics').select().get();
    if (response.error == null && response.data != null) {
      return (response.data as List)
          .map((metric) => Metric.fromJson(metric))
          .toList();
    }
    return [];
  }

  Future<List<Activity>> fetchActivities() async {
    final response = await _client.from('activities').select().get();
    if (response.error == null && response.data != null) {
      return (response.data as List)
          .map((activity) => Activity.fromJson(activity))
          .toList();
    }
    return [];
  }
}
