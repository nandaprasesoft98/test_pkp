import '../validator/validator.dart';
import 'validator_group.dart';

class PostValidatorGroup extends ValidatorGroup {
  Validator nameValidator;
  Validator addressValidator;

  PostValidatorGroup({
    required this.nameValidator,
    required this.addressValidator
  }) {
    validatorList.add(nameValidator);
    validatorList.add(addressValidator);
  }
}