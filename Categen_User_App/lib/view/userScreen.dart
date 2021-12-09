import 'dart:convert';
import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/common/colorConstants.dart';
import 'package:sample_project/common/constants.dart';
import 'package:sample_project/common/textStyle.dart';
import 'package:sample_project/model/fetchData.dart';
import 'package:sample_project/network/service.dart';
import 'package:sample_project/provider/providerClass.dart';
import 'package:sample_project/widget/reusableWidget.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  ScrollController _sc = new ScrollController();

  List<Data> l =[];

  @override
  void initState() {
    getdata();
    _sc.addListener(() {
      if (_sc.position.pixels ==
          _sc.position.maxScrollExtent) {
        getdata();
      }
    });
    super.initState();
  }

  void getdata() async
  {
     Constants.internet=await Servicereq.connectivityFunction(context);

    if (!Constants.isLoading && Constants.internet) {
      setState(() {
        Constants.isLoading = true;
      });
      var response = Servicereq().fetchdataget(context);
      response.then((value) {

        if (value.statusCode == 200) {
          dynamic dict = jsonDecode(utf8.decode(value.bodyBytes));
          Constants.baseurl=dict["meta"]["pagination"]["links"]["next"];
          dict["data"].forEach((element) {
            l.add(Data.fromJson(element));

          });


          Constants.isLoading = false;
          Constants.firstTime=false;
          providerModel(context,l).setALlData(l);
          setState(() {

          });
        } else {
          Constants.isLoading = false;
        }

      });
    }
    else
      {
        setState(() {
          if(Constants.firstTime) {
            Constants.internet = false;
            setState(() {
              snackbar("Your Device is not connected with internet", context);
            });
          }
        });

      }


  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  void snackbar(String msg, BuildContext context) {
    var snackBar = SnackBar(
      content: Text(msg),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  @override
  Widget build(BuildContext context) {
    return FutureProvider<providerModel>(
      initialData: providerModel(context,l),//      <--- ChangeNotifierProvider
      create: (context) => someAsyncFunctionToGetMyModel(context,l),
      child: SafeArea(
        child: Scaffold(
backgroundColor: ColorConstants.primaryColor,
          body: Padding(
            padding:  EdgeInsets.only(left: Constants.screenWidth/40,right: Constants.screenWidth/40),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: Constants.screenHeight/50,bottom: Constants.screenHeight/50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text("Users",style: CustomTextStyle.normalText(size: Constants.screenHeight/25),),
                    ),
                  ),
                ),
                Consumer<providerModel>( //                  <--- Consumer
                  builder: (context, providerModel, child) {
                    return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, id) {
                        // List Item
                        if (id == providerModel.providerDataList.length) {
                          return Padding(
                            padding:  EdgeInsets.only(top: Constants.firstTime ? Constants.screenHeight/3 : 0),
                            child: Constants.internet ? Container(
                                child: new ReusableWidget().buildProgressIndicator(Constants.isLoading))
                            : InkWell(
                              onTap: (){
                                setState(() {
                                  Constants.internet=true;
                                   getdata();
                                   providerModel.setALlData(l);
                                });

                              },
                              child: Container(
                                height: 50,
                                  decoration: BoxDecoration(
                                      color: ColorConstants.whiteColor,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient: LinearGradient(
                                          colors: [
                                            ColorConstants.secondaryColor,
                                            ColorConstants.primaryColor
                                          ]
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey ,
                                            blurRadius: 2.0,
                                            offset: Offset(2.0,2.0)
                                        )
                                      ]
                                  ),
                                child : Center(
                                  child: Text("Reload Data",style: TextStyle(
                                      color: ColorConstants.blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900),
                                  ),
                                )
                          ),
                            )
                            ,
                          );
                        }else return Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: new ReusableWidget().listViewwithImageDesHeading(providerModel.providerDataList[id],context),
                        );
                      },
                      itemCount: providerModel.providerDataList.length+1,
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: _sc,
                    ),
                  );},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<providerModel> someAsyncFunctionToGetMyModel(BuildContext context,List<Data> l) async { //  <--- async function
  return providerModel(context,l);
}

