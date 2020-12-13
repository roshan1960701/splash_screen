import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen/advanceUi.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  showVersion() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      // String appName = packageInfo.appName;
      // String packageName = packageInfo.packageName;
      // String version = '1.0.0';
      //bool  versionUpgrade = (sharedPreferences.get('versionUpgrade')?? false);
      String appVersion = (sharedPreferences.get('version')?? packageInfo.version);
      print('AppVersion'+appVersion);

      // if(versionUpgrade){
      //
      // }
      // else{
      //
      // }
      if(appVersion == packageInfo.version){
        print("version is same");

      }
      else{
        print("Version is different");
        sharedPreferences.setString('version', packageInfo.version);
      }


      //String buildNumber = packageInfo.buildNumber;
    });
  }
  /*showAlert() async{
    return showDialog(context: context,
    builder: (BuildContext) {
      return Column(
        children: [

          Image.network(
              "https://cdn.statically.io/img/wallpapershome.com/images/pages/pic_v/5284.jpg")
        ],
      );
    }
    );
  }*/

  showDialogCustom() async{
    return showDialog(context: context,
    builder: (BuildContext){
      return Dialog(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0)
      ),
          child:Stack(
            overflow:Overflow.visible,
            children: [
          Container(
              height: MediaQuery.of(context).size.height*0.90,
                width: MediaQuery.of(context).size.width*0.90,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: (){
                      print("Tapped");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("https://wallpaperaccess.com/full/530919.jpg")

                          )
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -18.0,
                right: -12.0,
                child: IconButton(icon: Icon(Icons.cancel,size: 40.0,),onPressed: (){
                  Navigator.pop(context);
                },),
              )
            ],

          )
      );
    }
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(onPressed: (){
              showDialogCustom();
            },
              child: Text("Alert Dialog"),
            ),
            FlatButton(onPressed: (){
              showVersion();
            }, child: Text("App Version")),

            FlatButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => advanceUi()));
            }, child: Text("Advacne UI")),
          ],

        ),
      ),
    );
  }
}
