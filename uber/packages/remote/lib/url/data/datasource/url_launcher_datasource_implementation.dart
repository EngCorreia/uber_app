part of remote;

class UrlLauncherDatasourceImplementation implements IUrlLauncherDatasource {
  @override
  Future<void> link(String params) async {
    try {
      if (await canLaunch(params)) {
        await launch(params, forceSafariVC: false, forceWebView: false);
      } else {
        throw const FetchDataException("A operação falhou. Tente novamente!");
      }
    } catch (e) {
      throw const FetchDataException("A operação falhou. Tente novamente!");
    }
  }
}
