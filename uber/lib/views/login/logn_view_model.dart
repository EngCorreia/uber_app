
import 'package:interfaces/interfaces.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../infra/locator.dart';
import '../../infra/setup.logger.dart';

class AddOrderServiceViewModel extends BaseViewModel with StatusCheckerMixin{

  AddOrderServiceViewModel() {
   // log.d("add schedule view");
  }

  final log = getLogger('Add Schedule View Model');
  final _navigationService = locator<NavigationService>();


  Future back() async {
    return _navigationService.back(result: true);
  }

}
