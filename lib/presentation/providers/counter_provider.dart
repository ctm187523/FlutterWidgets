
import 'package:flutter_riverpod/flutter_riverpod.dart';

//usamos StateProvier de Riverpood, sera un proveedor de un estado, tema, valor numerico, etc
final counterProvider = StateProvider<int>((ref) => 5);
