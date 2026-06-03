
import 'package:get/get.dart';
import 'package:mad/service/product_service.dart';

class ProductController extends GetxController {

  var isLoading = true.obs;
  var products = [].obs;

  @override
  void onInit() async{
      super.onInit();
      getProductsApi();
  }

  Future<void> getProductsApi() async {
    final product = await ProductService.instance.getProducts();
    products.value  = product;
    isLoading.value = false;
  }
}