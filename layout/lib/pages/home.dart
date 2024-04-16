// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  //const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("แอพความรู้เกี่ยวกับเครื่องดนตรี")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(builder: (context,snapshot) {
            var data = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return MyBox(data[index]['title'], data[index]['subtitle'], data[index]['image_url'],data[index]['detail']);

              },
              itemCount:data.length,);



        },
        future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
      
             
        )
      )


    );
  }


  // ignore: non_constant_identifier_names
  Widget MyBox(String title,String subtitle,String image_url,String detail) {
      // ignore: prefer_typing_uninitialized_variables
      var v1,v2,v3,v4;
      v1 = title;
      v2 = subtitle;
      v3 = image_url;
      v4 = detail;

      return Container(
        margin:EdgeInsets.all(20),
        padding: EdgeInsets.all(25),
        // color:Colors.lightGreenAccent,
        height: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image: DecorationImage(image: NetworkImage(image_url),fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.darken))),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(title,style: TextStyle(fontSize: 25,color: Colors.pinkAccent),),
          Text(subtitle,style: TextStyle(fontSize: 15,color: Colors.pinkAccent),),
          SizedBox(height:30),
          TextButton(onPressed: ()  {print("Next Page >>>");Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(v1,v2,v3,v4)));}, child: Text("อ่านต่อ"))


          ],

        ),
      );
    }


}
  










