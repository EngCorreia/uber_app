



import 'package:stacked_services/stacked_services.dart';

import '../../infra/locator.dart';

void setupDialogUI() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {

    //BottomSheetType.invoiceGraph: (context, sheetRequest, completer) =>  GraphInvoiceBottomSheet(request: sheetRequest, completer: completer),
   // BottomSheetType.contractGraph: (context, sheetRequest, completer) =>  GraphContractBottomSheet(request: sheetRequest, completer: completer),
  };
 // bottomSheetService.setCustomSheetBuilders(builders);
}
