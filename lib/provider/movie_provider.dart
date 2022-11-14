import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final movieProvider = ChangeNotifierProvider((ref) => MovieProvider());

class MovieProvider extends ChangeNotifier {}
