import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pppos/viewModels/login_view_model.dart';

final loginViewModel = ChangeNotifierProvider((ref) => LoginViewModel());
