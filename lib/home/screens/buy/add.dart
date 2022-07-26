import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';


class addt extends StatefulWidget {
  const addt({Key? key}) : super(key: key);

  @override
  State<addt> createState() => _addtState();
}

class _addtState extends State<addt> {
  int tag = 1;
  int _value = 0;
    String dropdownvalue = 'Restaurant';  
      var items = [   
    'Restaurant',
    'Homemade',
    
  ];


  int tag1 = 1;
  
  String qtyvalue ='kg';
    var qty = [   
    'kg',
    'ltr',
    'ml','gm','pkt','nos',
    
  ];
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text('Create Ads'),
        backgroundColor: Colors.red,
       ),
       body:SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Free/Deal',
                          style: TextStyle(
                            color: Colors.grey[800],
                           fontWeight: FontWeight.bold,
                           fontSize: 20
                          ),

                          
         
                        ),
                      ],
                    ),
                  ],
                ),
              ),


               Row(
                
                children: <Widget>[
                  ChoiceChip(
                    pressElevation: 0.0,
      selectedColor: Colors.blue,
      backgroundColor: Colors.grey[100],
      label: Text("Free"),
      selected: _value == 0,
      onSelected: (bool selected) {
        setState(() {
          _value = (selected ? 0 : null)!;
        });
      },
    ),
       ChoiceChip(
      pressElevation: 0.0,
      selectedColor: Colors.blue,
      backgroundColor: Colors.grey[100],
      label: Text("Deal"),
      selected: _value == 1,
      onSelected: (bool selected) {
        setState(() {
          _value = (selected ? 1 : null)!;
        });
      },
    ),

    


                  
                ],
               ),

               Row(
                 mainAxisSize: MainAxisSize.max,

                children: [
                  Text("Type",
                  style: TextStyle(
                     color: Colors.grey[800],
                           fontWeight: FontWeight.bold,
                           fontSize: 20

                  ),
                  )
                  
                ],


               ),
               Row(
                children: [
                  DropdownButton(
                    
                    dropdownColor: Colors.white,
                    value: dropdownvalue,
                     icon: const Icon(Icons.keyboard_arrow_down), 
                    items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
               onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
              

                  ),
                ],

               ),



                Row(
                 mainAxisSize: MainAxisSize.max,

                children: [
                  Text("Title",
                  style: TextStyle(
                     color: Colors.grey[800],
                           fontWeight: FontWeight.bold,
                           fontSize: 20

                  ),
                  )
                  
                ],


               ),
               Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,filled: true,
                      hintText: 'Name the food Item ...',
                    ),
                  ),
                ],
               ),


               
                Row(
                 mainAxisSize: MainAxisSize.max,

                children: [
                  Text("Description",
                  style: TextStyle(
                     color: Colors.grey[800],
                           fontWeight: FontWeight.bold,
                           fontSize: 20

                  ),
                  )
                  
                ],


               ),
               Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,filled: true,
                      hintText: 'Type something about the food ...',
                    ),
                  ),
                ],
               ),
             



                Row(
                 mainAxisSize: MainAxisSize.max,

                children: [
                  Text("Set Price",
                  style: TextStyle(
                     color: Colors.grey[800],
                           fontWeight: FontWeight.bold,
                           fontSize: 20

                  ),
                  )
                  
                ],


               ),
               Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                     
                     fillColor: Colors.white, filled: true,
                      border: OutlineInputBorder(),
                      
                      hintText: 'Price per Qty',
                    ),
                  ),
                ],
               ),



                Row(
                 mainAxisSize: MainAxisSize.max,

                children: [
                  Text("Quantity",
                  style: TextStyle(
                     color: Colors.grey[800],
                           fontWeight: FontWeight.bold,
                           fontSize: 20

                  ),
                  )                  
                ],
               ),


               
                   Row(
                    mainAxisSize: MainAxisSize.max,
                     children: [
                       Column(
                        mainAxisSize: MainAxisSize.max,
                         children:[ Container(
                          width: 80,
                          decoration: BoxDecoration(),
                          child: 
                              Align(
                                 alignment: AlignmentDirectional(-0.1, 0),
                              child: TextField(
                                decoration: const InputDecoration(
                                 
                                 fillColor: Colors.white, filled: true,
                                  border: OutlineInputBorder(),
                                  
                                  hintText: 'QTY',
                                ),
                              ),
                            ),
                         ),
                          ],
                         ),



                         Align(
                        alignment: AlignmentDirectional(0.05,0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            DropdownButton(
                    
                    dropdownColor: Colors.white,
                    value: qtyvalue,
                     icon: const Icon(Icons.keyboard_arrow_down), 
                     
                    items: qty.map((String items) {
                     return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                  );
                 }).toList(),
                  onChanged: (String? newValue) {
                 setState(() {
                  qtyvalue = newValue!;
                 });
              },

                  ),

                          ],
                        ),
                       )
                     


                     ]
                       ),
                       
                     

                     
              Row(
                 mainAxisSize: MainAxisSize.max,

                children: [
                  Text("Location",
                  style: TextStyle(
                     color: Colors.grey[800],
                           fontWeight: FontWeight.bold,
                           fontSize: 20

                  ),
                  )
                  
                ],


               ),
              Row(
             children: [
              Expanded(
               child: ElevatedButton(onPressed: (){},
                 child: Text("Set Location")),
              ),
                  
                       
                    
                  ],
                ),



                Row(
                   mainAxisSize: MainAxisSize.max,

                children: [
                  Text("Add Image",
                  style: TextStyle(
                     color: Colors.grey[800],
                           fontWeight: FontWeight.bold,
                           fontSize: 20

                  ),
                  )
                ]

                ),
             
   











            

              
            ]
            
            
          )
          
          
        )
        
        
       ),

       
    );
    
  }
}







   
