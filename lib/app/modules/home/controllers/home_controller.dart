import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/conostant/conostant.api.dart';
import '../model_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  Rx<DateTime> startdate = DateTime.parse('2014-01-01').obs;
  Rx<DateTime> lastdate = DateTime.parse('2014-01-03').obs;
  String date(DateTime date) => DateFormat('yyyy-MM-dd').format(date);
  List<Model> lmodel = [];
  var value = false.obs;

  @override
  Future<void> onInit() async {
    await getModel();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<List<Model>> getModel() async {
    ;
    print(
        '$API_URL&starttime=${date(startdate.value)}&endtime=${date(lastdate.value)}');
    try {
      final response = await Dio().get(
          '$API_URL&starttime=${date(startdate.value)}&endtime=${date(lastdate.value)}');
      Model model = Model();
      if (response.statusCode == 200) {
        response.data.forEach((element) {
          print(element.toString());
          model = Model.fromJson(element as Map<String, dynamic>);
          print(element.toString());
          print('done');
          lmodel.add(model);
          print(lmodel.length);
        });
      }
      value(true);
      return lmodel;
    } catch (e) {
      print('ERRROOORRRRRR');
      print(e);
      return [];
    }
  }
}
