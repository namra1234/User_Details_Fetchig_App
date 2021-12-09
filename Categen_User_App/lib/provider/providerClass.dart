import 'package:flutter/cupertino.dart';
import 'package:sample_project/model/fetchData.dart';

class providerModel with ChangeNotifier {
  String someValue = 'Hello';
  List<Data> providerDataList = [];
  late BuildContext context;

  providerModel(BuildContext context,List<Data> l)
  {
    this.providerDataList=l;
    this.context=context;
  }

  void setALlData(List<Data> info) async {

    providerDataList=info;
    notifyListeners();
  }
}