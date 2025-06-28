
import 'package:getx_mvvm_project/data/networks/network_api_services.dart';
import 'package:getx_mvvm_project/res/app_url/app_url.dart';

class LoginRepository{

  final _apiServices = NetworkApiServices();

  Future<dynamic>loginApi(var data) async{
    dynamic response = _apiServices.postApi(data, AppUrl.loginApi);
    return response;
}
}