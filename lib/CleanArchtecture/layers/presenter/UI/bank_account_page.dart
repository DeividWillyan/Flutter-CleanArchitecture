import 'package:flutter/material.dart';
import 'package:roadmap_flutter_dart/CleanArchtecture/core/mapper/mapper.dart';

import '../../domain/repositories/bank_account_repository.dart';
import '../../domain/usecases/bank_account_usecase.dart';
import '../../domain/usecases/bank_account_usecase_imp.dart';

import '../../infra/datasources/bank_account_datasorce.dart';
import '../../infra/mapper/bank_account_mapper.dart';
import '../../infra/repositories/bank_account_repository_imp.dart';

import '../../external/datasources/memory/bank_account_datasource_imp.dart';

import '../controller/bank_account_controller.dart';

class BankAccountPage extends StatefulWidget {
  @override
  _BankAccountPageState createState() => _BankAccountPageState();
}

class _BankAccountPageState extends State<BankAccountPage> {
  BankAccountController controller;

  bool showAccounts = false;

  _BankAccountPageState() {
    Mapper _mapper = BankAccoutMapper();
    BankAccountDatasource _persistance = BankAccountDatasourceImp();
    BankAccountRepository _repository = BankAccountRepositoryImp(_persistance, _mapper);
    BankAccountUseCase _useCase = BankAccountUseCaseImp(_repository);
    controller = BankAccountController(_useCase, _mapper);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!showAccounts) {
            controller.getAccounts().then((value) =>
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value))));
          }
          setState(() {
            showAccounts = !showAccounts;
          });
        },
        child: Icon(Icons.view_list),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Numero da conta'),
              onChanged: (val) =>
                  controller.dto = controller.dto.copyWith(accountNumber: int.parse(val)),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.save().then((value) =>
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value))));
                },
                child: Text('Save'),
              ),
            ),
            SizedBox(
              height: 300,
              child: showAccounts ? _showAccounts() : Container(),
            )
          ],
        ),
      ),
    );
  }

  Widget _showAccounts() => ListView.builder(
        itemCount: controller.accounts?.length ?? 0,
        itemBuilder: (ctx, idx) => Text(
          'Conta -> ${controller.accounts[idx].accountNumber}',
        ),
      );
}
