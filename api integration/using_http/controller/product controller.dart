import 'package:get/get.dart';
import 'package:project_application1/api%20integration/using_http/service/api_service.dart';

class ProductController extends GetxController{
  //obs - observable
 // RxBool isloading = RxBool(true);
  var isLoading = true.obs;
  var productList = [].obs;

  @override
  void onInit(){
    getProducts();
    super.onInit();
  }

  void getProducts() async{
    try{
      isLoading(true);
      var products = await HttpService.fetchProductus();
      if(products != null){
       productList.value = products;
      }
    }catch(e) {
      print(e);
    }finally{
      isLoading(false);
    }
  }
}
