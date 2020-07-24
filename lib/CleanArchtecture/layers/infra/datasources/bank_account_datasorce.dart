import 'package:roadmap_flutter_dart/CleanArchtecture/layers/infra/dto/bank_account_dto.dart';

abstract class BankAccountDatasource {
  Future<void> save(BankAccountDTO bankAccountDTO);
  Future<List<BankAccountDTO>> findAll();
}
