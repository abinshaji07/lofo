import 'package:equatable/equatable.dart';

class Flower extends Equatable {
  final String id;
  final String title;
  final String type;
  final String phonenumber;

  final String location;

  final String description;
  final String photoURL;
  final String price;
  final String uid;
  final String qty;
  final int count;
  final bool addedToCart;

  const Flower({
    required this.id,
    required this.title,
    required this.type,
    required this.phonenumber,
    required this.location,
    required this.description,
    required this.photoURL,
    required this.price,
    required this.qty,
    required this.uid,
   
    required this.count,
    required this.addedToCart,
  });

  factory Flower.fromMap(Map<String, dynamic> data, String id) {
    return Flower(
      id: data['id'],
      title: data['title'],
      type: data['type'],
      phonenumber: data['phonenumber'],
      location: data['location'],
      description: data['description'],
      price: data['price'],
      qty: data['qty'],
      photoURL: data['photoURL'],
      uid: data['uid'],
      
      count: data['count'],
      addedToCart: data['addedToCart'],
    );
  }

  Map<String, dynamic> toMap() => {
        "title": title,
         "type": type,
         "phonenumber":phonenumber,
         "location":location,
         "description":description,
         "price":price,
         "qty":qty,
         "photoURL":photoURL,


        
       "count": count,
        "addedToCart": addedToCart,
      };

  Flower copyWith({
    String? title,
    String? type,
     String? phonenumber,
      String? location,
       String? description,
        String? price,
         String? qty,
          String? photoURL,
          String? uid,
          String? id,
    
    int? count,
   bool? addedToCart,
  }) =>
      Flower(
        id: id  ?? this.id,
        title: title ?? this.title,
        type: type ?? this.type,
        phonenumber: phonenumber ?? this.phonenumber,
        location: location ?? this.location,
        description: description ?? this.description,
        price: price ?? this.price,
        qty: qty ?? this.qty,
        photoURL: photoURL?? this.photoURL,
        uid: uid ?? this.uid,
        
       count: count ?? this.count,
       addedToCart: addedToCart ?? this.addedToCart,
      );

  @override
  List<Object?> get props => [
   title,
    type,
     phonenumber,
      location,
        description,
        price,
        qty,
         photoURL,
       
       count,
       addedToCart,
      ];
}