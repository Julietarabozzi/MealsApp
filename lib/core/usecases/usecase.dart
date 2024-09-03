// lib/core/usecases/usecase.dart

import 'package:equatable/equatable.dart';

// Interface para los casos de uso que no reciben parámetros
abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

// Clase para representar la ausencia de parámetros
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
