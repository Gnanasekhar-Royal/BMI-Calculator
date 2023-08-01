import 'package:bmi_app2/result.dart';
import 'package:flutter/material.dart';

import 'cal_bmi.dart';
enum Genderselection{male,female}

void main(){
  runApp(myapp());
}
class myapp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'bmiapp',
      home: firstpage(),

    );
  }
}
class firstpage extends StatefulWidget{
  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  int height=160;
  int weight=40;
  int age=16;
  Genderselection? selection;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25,color: Colors.white70 ),),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              selection=Genderselection.male;
                            });
                          },
                          child: Container(
                              color:selection==Genderselection.male ?Colors.blue:Color.fromARGB(255,21, 40, 55),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.male,size: 70,),
                                Text('Male',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                      )
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              selection=Genderselection.female;
                            });
                          },
                          child: Container(
                            color:selection==Genderselection.female?Colors.blue:Color.fromARGB(255,21, 40, 55),
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.female,size: 70,),
                                Text('Female',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),)
                              ],
                            ) ,
                          ),
                        ),
                      )
                  )
                ],
              )
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                    color:Color.fromARGB(255,21, 40, 55),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(height.toString(),style: TextStyle(fontSize: 80),),
                          Text('cm',style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      Slider(
                        min: 120,
                          max: 220,
                          activeColor: Colors.redAccent,
                          inactiveColor: Colors.blueGrey,
                          value: height.toDouble(), onChanged: (double newvalue){
                          setState(() {
                            height=newvalue.round();
                          });

                      })
                    ],
                  ),
                ),
              )
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                            color:Color.fromARGB(255,21, 40, 55),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Weight',style: TextStyle(fontSize: 25),),
                              SizedBox(height: 10,),
                              Text(weight.toString(),style: TextStyle(fontSize: 40),),
                              SizedBox(height: 10,),

                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10,left: 30),
                                    child: FloatingActionButton(onPressed: (){
                                      setState(() {
                                        weight++;

                                      });

                                    },child: Icon(Icons.add,size: 40,color: Colors.white70,),backgroundColor: Colors.blueGrey,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: FloatingActionButton(onPressed: (){
                                      setState(() {
                                        weight--;
                                      });
                                    },child: Icon(Icons.remove,size: 40,color: Colors.white70,),backgroundColor: Colors.blueGrey,),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                            color:Color.fromARGB(255,21, 40, 55),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Age',style: TextStyle(fontSize: 25)),
                              SizedBox(height: 10,),
                              Text(age.toString(),style: TextStyle(fontSize: 40),),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10,left: 30),
                                    child: FloatingActionButton(onPressed: (){
                                      setState(() {
                                        age++;
                                      });
                                    },child: Icon(Icons.add,size: 40,color: Colors.white70,),backgroundColor: Colors.blueGrey,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: FloatingActionButton(onPressed: (){
                                      setState(() {
                                        age--;
                                      });
                                    },child: Icon(Icons.remove,size: 40,color: Colors.white70,),backgroundColor: Colors.blueGrey,),
                                  ),

                                ],
                              )
                            ],
                          ),
                        ),
                      )
                  )
                ],
              )
          ),
         ElevatedButton(onPressed: (){
           Calculatebmi calculatebmi= Calculatebmi(height: height,weight: weight);
           Navigator.push(context, MaterialPageRoute(builder: (context)=>result(
             bmi: calculatebmi.calculatebmi(),
             res: calculatebmi.getresult(),
             feedback: calculatebmi.feedback(),


           )));
         },
             child: Text('CALCULATE',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
           style: ElevatedButton.styleFrom(
             primary:Color.fromARGB(255,21, 40, 55),
             minimumSize: Size(double.infinity, 50)
           ),

         )
        ],
      ),

    );
  }
}