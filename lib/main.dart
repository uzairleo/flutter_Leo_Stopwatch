import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';//Allpackages


void main() {
  runApp(new StopWatch());
}

class StopWatch extends StatefulWidget {
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Leo Stopwatch',
        home:Leostopwatch(),
        );
  }
}
class Leostopwatch extends StatefulWidget {
  @override
  _LeostopwatchState createState() => _LeostopwatchState();
}

class _LeostopwatchState extends State<Leostopwatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor:Color.fromARGB(244,232,232,232),
          // appBar: AppBar(
          //   title: Text('Leo StopWatch'),
          //   centerTitle: true,
          // ),
          body: swatchBody(),
        );
  }

double _height = 120;
  double _width = 110;
  double _cradius = 8.0;
  bool startispressed = true;
  bool stopispressed = true;
  bool resetispressed = true;
  // String stoptimetodisplay="00:00:00";
  String seconds="00";
  String minutes="00";
  String hours="00";
  var swatch=Stopwatch();
   var dur= Duration(seconds: 1);
void starttimer()
{
  Timer(dur, keeprunning);
}
void keeprunning()
{
  if(swatch.isRunning)
  {
    starttimer();
  }
  setState(() {
    // stoptimetodisplay=swatch.elapsed.inHours.toString().padLeft(2,"0")+":"+
    //                   (swatch.elapsed.inMinutes%60).toString().padLeft(2,"0")+":"+
    //                   (swatch.elapsed.inSeconds%60).toString().padLeft(2,"0");
    hours=swatch.elapsed.inHours.toString().padLeft(2,"0");
    minutes=(swatch.elapsed.inMinutes%60).toString().padLeft(2,"0");
    seconds=(swatch.elapsed.inSeconds%60).toString().padLeft(2,"0");
  });
}
  void startstopwatch() {
    setState(() {
     stopispressed=false; 
     startispressed=false;
    });
    swatch.start();
    starttimer();
  }
  void stopstopswatch() {
    setState(() {
     stopispressed=true;
     resetispressed=false;
      
    });
    swatch.stop();
  }
  void resetstopwatch() {
    setState(() {
     resetispressed=true;
     startispressed=true;
     
    });

    swatch.reset();
    seconds="00";
    minutes="00";
    hours="00";
  }
  void moreinfo()
  {
    var alert=CupertinoAlertDialog( 
      
      title: Text("Contact us",style:Theme.of(context).textTheme.title),
      content: Text("I am uzair leo from islamia college university of peshwar a software developer"),
    );
    showDialog(
      context: context,
      builder: (BuildContext context){
        return alert;
      }
    );
  }
  Widget swatchBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[
             
             Padding(
               padding: const EdgeInsets.only(left:18.0),
               child: Column(children:<Widget>
               [ Padding(
                  padding: const EdgeInsets.only(top:18.0),
                  child: Container(
                     decoration: BoxDecoration(
                    border: Border.all(width: 1.5,color:Colors.black12),
                    shape: BoxShape.circle
                     ),
                    child: CircleAvatar(
                      
                     backgroundColor: Colors.black26,
                     radius: 50,
                      child: CircleAvatar(
                          radius: 40.0,
                          backgroundImage: AssetImage('images/leo.png'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Text("Leo Stopwatch",style:Theme.of(context).textTheme.display1),
                ),
               ]),
             ),
            //  SizedBox(width: 30.0,),
              Padding(
                padding: const EdgeInsets.only(left:45.0,right: 6.0),
                child: InkWell(
                  onTap: (){
                    moreinfo();
                  },
                                  child: Container(
                     height: 30,
                     width: 30,
                     child: Image.asset('images/info.png')
                   ),
                ),
              ),
             
           ],
         ),
          Expanded(
            flex: 3,
            child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    
                    Container(
                      height: _height,
                      width: _width,
                      decoration: BoxDecoration(
                      //  boxShadow: ,
                        border: Border.all(width: 1.6),
                        borderRadius:
                            BorderRadius.all(Radius.circular(_cradius)),
                        gradient: LinearGradient(
                          colors: [Colors.black87, Colors.black12],
                          begin: FractionalOffset(1.0, 1.0),
                          end: FractionalOffset(2.0, 2.0),
                          tileMode: TileMode.clamp,
                          stops: [0.5, 1.0],
                        ),
                        shape: BoxShape.rectangle,
                        backgroundBlendMode: BlendMode.darken,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            hours,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 65.0),
                          ),
                          Text(
                            'HRS',
                            style: TextStyle(
                                color: Colors.white,
                                // fontWeight: FontWeight.normal,
                                fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: _height,
                        width: _width,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          borderRadius:
                              BorderRadius.all(Radius.circular(_cradius)),
                          gradient: LinearGradient(
                            colors: [Colors.black87, Colors.black12],
                            begin: FractionalOffset(1.0, 1.0),
                            end: FractionalOffset(2.0, 2.0),
                            tileMode: TileMode.clamp,
                            stops: [0, 0.5],
                          ),
                          shape: BoxShape.rectangle,
                          backgroundBlendMode: BlendMode.darken,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              minutes,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 65.0),
                            ),
                            Text(
                              'MIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.normal,
                                  fontSize: 15.0),
                            ),
                          ],
                        )),
                    Container(
                      height: _height,
                      width: _width,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.6),
                        borderRadius:
                            BorderRadius.all(Radius.circular(_cradius)),
                        gradient: LinearGradient(
                          colors: [Colors.black87, Colors.black12],
                          begin: FractionalOffset(1.0, 1.0),
                          end: FractionalOffset(2.0, 2.0),
                          tileMode: TileMode.clamp,
                          stops: [0.5, 1.0],
                        ),
                        shape: BoxShape.rectangle,
                        backgroundBlendMode: BlendMode.darken,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            seconds,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 65.0),
                          ),
                          Text(
                            'SEC',
                            style: TextStyle(
                                color: Colors.white,
                                // fontWeight: FontWeight.normal,
                                fontSize: 15.0),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          elevation: 12.0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 15.0,
                          ),
                          textColor: Colors.white,
                          colorBrightness: Brightness.dark,
                          color: Colors.redAccent,
                          child: Text("Stop",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              )),
                          onPressed: stopispressed ? null : stopstopswatch,
                        ),
                        RaisedButton(
                          onPressed: resetispressed ? null : resetstopwatch,
                          padding: EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 15.0,
                          ),
                          elevation: 12.0,
                          textColor: Colors.white,
                          color: Colors.purple,
                          colorBrightness: Brightness.dark,
                          child: Text("Reset",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              )),
                        )
                      ],
                    ),
                    RaisedButton(
                      onPressed: startispressed ? startstopwatch : null,
                      padding: EdgeInsets.symmetric(
                        horizontal: 80.0,
                        vertical: 20.0,
                      ),
                      elevation: 12.0,
                      textColor: Colors.white,
                      color: Color.fromARGB(255, 162, 107, 11),
                      colorBrightness: Brightness.dark,
                      child: Text("Start",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          )),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

