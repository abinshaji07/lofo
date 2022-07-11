
 import 'package:flutter/material.dart';
import 'package:progress_timeline/progress_timeline.dart';




 class addt extends StatefulWidget {
  const addt({Key? key}) : super(key: key);

  @override
  State<addt> createState() => _addtState();
}

class _addtState extends State<addt> {
 
 
  late ProgressTimeline screenProgress;
  
  

  List<SingleState> allStages = [
    
    SingleState(stateTitle: "Food Info"),
    SingleState(stateTitle: "Gallery"),
    
  ];

  @override
  void initState() {
    //  mainAxisAlignment: MainAxisAlignment.center;
    screenProgress = new ProgressTimeline(
      
      states: allStages,
      iconSize: 35,
    );
    super.initState();
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: const Text('Create Ads'),
        backgroundColor: Colors.red,
        
      ),
      body: Center(
        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(

                

              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              
              child: screenProgress,
            ),
            SizedBox(
              height: 90,
            ),
            TextButton(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Goto Next Stage",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
             /*  color: Colors.green,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)), */
              onPressed: () {
                screenProgress.gotoNextStage();
              },
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Goto Previous Stage",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
             /*  color: Colors.green,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)), */
              onPressed: () {
                screenProgress.gotoPreviousStage();
              },
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Fail Current Stage",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            /*   color: Colors.green,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)), */
              onPressed: () {
                screenProgress.failCurrentStage();
              },
         )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
  
 


 