import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

final socialPostsProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final response = await supabase.from('posts').select('*').order('created_at', ascending: false);
  return response;
});
