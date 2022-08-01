

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_selling_app/home/screens/buy/firestore_storage.dart';
import 'package:flower_selling_app/location_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';





class addt extends StatefulWidget {
  const addt({Key? key}) : super(key: key);

  @override
  State<addt> createState() => _addtState();

}

class _addtState extends State<addt> {

   late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  String? _address;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  bool isLoading = false;


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
  
//location start
  String? userLocation;
  

   Future<void> _getLocation() async {
    Location location = Location();

    // Check if location service is enable
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Check if permission is granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final locationData = await location.getLocation();
    final lat = locationData.latitude!.toDouble();
    final lon = locationData.longitude!.toDouble();

    _getAddress(lat, lon);

    
  }

  void _getAddress(double lat, double lon) async {
    String address = await LocationServices().geoCodeFromCoordinates(
      lat,
      lon,
    );

   setState(() {
      userLocation = address;
   });
  }
//location ended

//upload image start

  //  File? image1;
  Uint8List? image1;
   Future pickImage1() async {
    final image = await ImagePicker().pickImage(source:ImageSource.camera );
    if(image == null) return;
    // final imageTemporary = File(image.path);
    final imageTemporary = await image.readAsBytes();
    setState(() => image1 = imageTemporary);
   
    
  }


  //  File? image2;
   Future pickImage2() async {
    final image = await ImagePicker().pickImage(source:ImageSource.gallery );
    if(image == null) return;
    // final imageTemporary = File(image.path);
    final imageTemporary = await image.readAsBytes();

    setState(() => image1 = imageTemporary);
     
    
  }




  



CollectionReference flowers = FirebaseFirestore.instance.collection('flowers');

late String title,no,des,price,photo,fd,qua,loc;
  String kg = "kg";
  String type = "Restaurant";

  FirebaseAuth auth = FirebaseAuth.instance;
  

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Align(
                //   alignment: AlignmentDirectional(-1, 0),
                //   child: Column(
                //     mainAxisSize: MainAxisSize.max,
                //     children: [
                //       Row(
                //         mainAxisSize: MainAxisSize.max,
                //         children: [
                //           Text(
                //             'Free/Deal',
                //             style: TextStyle(
                //               color: Colors.grey[800],
                //              fontWeight: FontWeight.bold,
                //              fontSize: 20
                //             ),
          
                            
                   
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
          
          
              //            Row(
                  
              //             children: <Widget>[
              //               ChoiceChip(
              //                 pressElevation: 0.0,
              //   selectedColor: Colors.blue,
              //   backgroundColor: Colors.grey[100],
              //   label: Text("Free"),
              //   selected: _value == 0,
              //   onSelected: (bool selected) {
              //     setState(() {
              //       _value = (selected ? 0 : null)!;
              //     });
              //   },
              // ),
              //    ChoiceChip(
              //   pressElevation: 0.0,
              //   selectedColor: Colors.blue,
              //   backgroundColor: Colors.grey[100],
              //   label: Text("Deal"),
              //   selected: _value == 1,
              //   onSelected: (bool selected) {
              //     setState(() {
              //       _value = (selected ? 1 : null)!;
              //     });
              //   },
              // ),
          
              
          
          
                    
              //             ],
              //            ),
          
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
                    type = newValue;
                  });
                },
                
          
                    ),
                  ],
          
                 ),
          
                     
                  Row(
                     mainAxisSize: MainAxisSize.max,
            
                    children: [
                      Text("Phone Number",
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
                         onChanged: (value){
                          no = value;
                          },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,filled: true,
                          hintText: 'Enter your phone number...',
                        ),
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
                      onChanged: (value){
                        title = value;
                      },
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
                    TextField(onChanged: (value){
                        des = value;},
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
                      onChanged: (value){
                        price = value;},
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
                                  onChanged: (value){
                        qua = value;},
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
                    kg = newValue;
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
                 child: ElevatedButton(onPressed: (){
                    _getLocation();
          
                 },
                   child: Text("Set Location")),
                ),
          
                    
                         
                      
                    ],
                  ),
          
          
          
                  Row(
                     mainAxisSize: MainAxisSize.max,
          
                  children: [
                Text(userLocation == null ? "no location" : userLocation!),
          
                   
                  ]
          
                  ),
               
                  Row( mainAxisSize: MainAxisSize.max,
            
                    children: [
                      Text("Add Image",
                      style: TextStyle(
                         color: Colors.grey[800],
                               fontWeight: FontWeight.bold,
                               fontSize: 20
            
                      ),
                      )                  
                    ],
            
                    ),
                     
            
                     Row(
                      children: <Widget>[
                       Expanded(
                      
                  
                   child:IconButton( 
                          icon: Icon(Icons.add_a_photo),
                          onPressed: (){
                            pickImage1();
                          },
                         ),
                       ),
                    Expanded(
                    child:IconButton( 
                          icon: Icon(Icons.add_photo_alternate),
                          onPressed: (){
                            pickImage2();
                          },
                         ),
                     
                   ),
            
            
                     
            
                               
                      ]
                       ),
          
                       Row(
                         children: [
                           Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            
                            // Spacer(),
                           
                           image1 != null ? Image.memory(image1!,width: 150,height: 150): Image.asset('assets/add1.jpg',height: 80,width: 80,),
                            // const SizedBox(height: 24),
                          ],
          
                           ),
                         ],
                       ),

                        Row(
                      
                        
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            
                            
                              RaisedButton(
                  disabledColor: Colors.red,
              disabledTextColor: Colors.black,
              padding: const EdgeInsets.all(20),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: () async  {

                setState(() {
                  isLoading = true;
                });
                //Image(image: NetworkImage(photoURL),);
                if(image1 == null)
                {
                  print("Image is null");
                  return;
                }

                try {
                   String photoURL = await StorageMethods().uploadImageToStorage('image', image1!);
                print("Uploaded");
                String uuid = Uuid().v1();
                String _auth = FirebaseAuth.instance.currentUser!.uid;
                print(_auth);

                await flowers.doc(uuid).set({
                  'id': uuid,
                'title': title,
                'uid' : _auth,
                 'phonenumber': no,
                 'description': des,
                'price':price,
                'type': type,
                 'qty': qua + kg,
                 'photoURL': photoURL,
                'location': userLocation,
               }).then((value) {
                print('Post Added');
                Navigator.pop(context);
               });

                print("SUCCESS");



                  
                } catch (e) {
                  print("ERROR" + e.toString());
                }
               


                setState(() {
                  
                  isLoading = false;
                });
              },
              child: isLoading ? const CircularProgressIndicator() : const Text('POST'),
            ),
            const SizedBox(
              height: 20,
            ),
                 
                              
                           
                          ],
                      
                      
                     ),

                
              ]
              
              
            ),
          )
          
          
        )
        
        
       ),

       
    );
    
  }
}







   
