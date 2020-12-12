import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

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
            children: [
          Container(
                width: MediaQuery.of(context).size.width*0.90,
                height: MediaQuery.of(context).size.height*0.85,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: (){
                      print("Tapped");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("https://cdn.statically.io/img/wallpapershome.com/images/pages/pic_v/5284.jpg")

                          )
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -12.0,
                right: -12.0,

                child: IconButton(icon: Icon(Icons.cancel,size: 30.0,),onPressed: (){
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
        child: MaterialButton(onPressed: (){
          showDialogCustom();
        },
        child: Text("Alert Dialog"),
        ),
      ),
    );
  }
}
