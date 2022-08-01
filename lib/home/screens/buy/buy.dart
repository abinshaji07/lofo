//import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_selling_app/home/screens/buy/add.dart';
import 'package:flowers_repository/flowers_repository.dart';
import 'package:flutter/material.dart';

class buy extends StatefulWidget {
  const buy({Key? key}) : super(key: key);

  @override
  State<buy> createState() => _buyState();
}

class _buyState extends State<buy> {
  List<Flower> _ads = [];
  bool _isLoading = true;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAds();
  }

  _getAds() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
    });
    try {
      var ads = await FirebaseFirestore.instance
          .collection('flowers')
          .where("uid", isEqualTo: uid)
          .get();
      List<Flower> foodads = [];
      for (var ad in ads.docs) {
        foodads.add(Flower.fromMap(ad.data(), ad.id));
      }
      if (!mounted) return;

      setState(() {
        _ads = foodads;
      });
    } catch (e) {
      print(e.toString());
    }
    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });
  }

  _deleteItem(id) async {
    var ads = await FirebaseFirestore.instance
          .collection('flowers').doc(id).delete().then((value) {
            _getAds();
            Navigator.pop(context);
          });
  }

  _buildTiles() {
    return ListView.separated(
        itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(_ads[index].title),
                leading: CircleAvatar(foregroundImage: NetworkImage(_ads[index].photoURL)),
                trailing: Text("₹ ${_ads[index].price}"),
                onTap: () {
                  showDialog(context: context, builder: (context) => AlertDialog(
                    title: Text("Do you want to delete this item?"),
                    content: Text("This action is irreversible."),
                    actions: [
                      TextButton(onPressed: () async {
                        await _deleteItem(_ads[index].id);
                      }, child: Text("Yes")),
                      ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("No")),
                    ],
                  ));
                },
              ),
              
            ),
        separatorBuilder: ((context, index) => const Divider()),
        itemCount: _ads.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _ads.isEmpty
                ? Center(child: Text("No Ads"))
                : _buildTiles(),
        // if(){
        // return const Center (child: Text(
        //           "No Adds",
        //           style: TextStyle(
        //             fontSize: 24,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        // ),
        // }else{

        // }
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => addt())).then((value) {
                  _getAds();
                
                });
          },
          label: Text('Add items'),
          icon: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 236, 0, 0),
        ));
  }
}
