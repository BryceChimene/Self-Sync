import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

final workoutProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final response = await supabase.from('workouts').select('*');
  return response;
});
