import '../../domain/entities/register_entity.dart';

abstract class RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  final RegisterEntity data;

  RegisterSubmitted(this.data);
}