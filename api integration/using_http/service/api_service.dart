import 'package:http/http.dart' as http;
import 'package:project_application1/api%20integration/using_http/model/productModel.dart';
class HttpService{
  static Future<List<ProductModel>> fetchProductus() async{
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if(response.statusCode == 200){
      var data = response.body;
      return productModelFromJson(data);
    }else{
      throw Exception();
    }

  }
}