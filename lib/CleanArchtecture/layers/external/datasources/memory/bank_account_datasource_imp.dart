import '../../../infra/datasources/bank_account_datasorce.dart';
import '../../../infra/dto/bank_account_dto.dart';

class BankAccountDatasourceImp implements BankAccountDatasource {

  BankAccountDatasourceImp._instance();
  factory BankAccountDatasourceImp() => _singleton;
  static final BankAccountDatasourceImp _singleton = BankAccountDatasourceImp._instance();

  final List<BankAccountDTO> db = [];

  @override
  Future<void> save(BankAccountDTO bankAccountDTO) async {
    db.add(bankAccountDTO);
    print('saving in memory...');
  }

  @override
  Future<List<BankAccountDTO>> findAll() async{
    return this.db;
  }
}
