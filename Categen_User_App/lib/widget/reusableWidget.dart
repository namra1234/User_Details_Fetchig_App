
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sample_project/common/colorConstants.dart';
import 'package:sample_project/common/constants.dart';
import 'package:sample_project/model/fetchData.dart';

class ReusableWidget
{
  Widget listViewwithImageDesHeading(Data info,BuildContext context) {

    Random rnd;
    int min = 0;
    int max = 5;
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);

    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Constants.screenWidth/40, vertical:Constants.screenHeight/70),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.rectangle,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Container(
                      height: Constants.screenHeight/12,
                      width: Constants.screenHeight/12,
                      decoration: BoxDecoration(
                        // color: Colors.grey,
                        borderRadius: BorderRadius.circular(Constants.screenHeight/12),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(Constants.screenHeight/12),
                            child: Image.network(
                              r==0 ?
                              "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80"
                              :
                              r==1?
                              "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                                  :
                                  r==2?
                                  "https://cdn.pixabay.com/photo/2014/07/09/10/04/man-388104_960_720.jpg"
                                      :
                                      r==3? "https://st3.depositphotos.com/1037987/15097/i/600/depositphotos_150975580-stock-photo-portrait-of-businesswoman-in-office.jpg" :
                                      r==4?"https://blogs-images.forbes.com/danschawbel/files/2017/12/Dan-Schawbel_avatar_1512422077-400x400.jpg":
                                      "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/image_data/file/103058/s960_Minister_Donelan.jpeg"


                              ,
                              width: 280.0,
                              fit: BoxFit.fill,
                            ),
                          )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(info.name,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Divider(color: Colors.black)
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top:2),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(info.status,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300)),
                                ),
                                Divider(color: Colors.black)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: Constants.screenWidth/30,right:5,top:2),
                      child: Icon(
                        Icons.person,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top:2),
                      child: Expanded(
                        child: Container(
                            width: Constants.screenWidth/3.3,
                            child: Text(info.name,textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300))
                        ),
                      ),
                    )

                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: Constants.screenWidth/30,right:5,top:2),
                      child: Icon(
                        Icons.contact_phone,
                        color:  Colors.deepPurple,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top:2),
                      child: Expanded(
                        child: Container(
                            width: Constants.screenWidth/3.3,
                            child: Text("Administrative",textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300))
                        ),
                      ),
                    )

                  ],
                ),
              ],
            ),
            SizedBox(height: 2,),
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: Constants.screenWidth/30,right:5,top:2),
                  child: Text("Contact : ",textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900)),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:2),
                  child: Expanded(
                    child: Container(
                        width: Constants.screenWidth/1.5,
                        child: Text(info.email,textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w300))
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: Constants.screenWidth/30,right:5,top:2),
                      child: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top:2),
                      child: Expanded(
                        child: Container(
                            width: Constants.screenWidth/1.5,
                            child: Text("Go to user details",textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300))
                        ),
                      ),
                    )

                  ],
                ),
                Padding(
                  padding:  EdgeInsets.only(right: Constants.screenWidth/30),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color:  Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProgressIndicator(bool isLoading) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: 1,
          child: new CircularProgressIndicator(color: ColorConstants.blackColor,),
        ),
      ),
    );
  }

}