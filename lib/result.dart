import 'package:flutter/material.dart';

class result extends StatelessWidget{
  late final String? bmi;
  late final String? res;
  late final String? feedback;

  result({this.bmi,this.res,this.feedback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(

        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 300),
              child: Text('Result',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
            ),
          ),
         Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(res!,style: TextStyle(fontSize: 25),),
             Text(bmi.toString(),style: TextStyle(fontWeight:FontWeight.bold,fontSize: 45  ),),
             Text(feedback!,style: TextStyle(fontSize: 15),)
           ],
         ),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          },
              child: Text('Re-Calculate'.toUpperCase()),
            style: ElevatedButton.styleFrom(
              primary: Colors.pink
            ),

          )

        ],
      ),
      
    );
  }

}