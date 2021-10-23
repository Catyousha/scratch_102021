import '../domain/entity/cases_model.dart';

import '../domain/adapters/repository_adapter.dart';
import 'home_api_provider.dart';

// penyimpan hasil fetching CasesModel dari /summary
class HomeRepository implements IHomeRepository {
  HomeRepository({required this.provider});
  
  // pelaku fetching
  // digunakan base abstract classnya, bukan varian tunggal
  final IHomeProvider provider;

  // keluaran berupa CasesModel / data tunggal
  @override
  Future<CasesModel> getCases() async {
    // fetching dari endpoint /summary
    final cases = await provider.getCases("/summary");
    
    //exception handling dengan if-else
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      return cases.body!;
    }
  }
}
