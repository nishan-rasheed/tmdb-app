import 'package:film_app/model/cast_model.dart';
import 'package:film_app/sevices/api_service/cast_service.dart';
import 'package:get/get.dart';

class CastController extends GetxController{

  var castList = <CastModel>[].obs;
  
   @override
  void onInit() {
    
    getCastDetail('');
    super.onInit();
  }

  void getCastDetail(String id)async{
    
   var cast = await CastService().getCastList(id);
   if (cast != null) {
        castList.value = cast;
   }
  }
}