import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/services/database.dart';

final dataProvider = Provider.autoDispose((ref) => AppDatabase());
