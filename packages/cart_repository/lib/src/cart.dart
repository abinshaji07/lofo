import 'package:equatable/equatable.dart';

class Cart extends Equatable {
   final String title;
  final String type;
  final String phonenumber;
  final String location;

  final String description;
  final String photoURL;
  final String price;
  final String qty;
  final int count;
  final bool addedToCart;

  const Cart({
    required this.title,
    required this.type,
    required this.phonenumber,
    required this.location,
    required this.description,
    required this.photoURL,
    required this.price,
    required this.qty,
   
    required this.count,
    required this.addedToCart,
  });

  factory Cart.fromMap(Map<String, dynamic> data, String id) {
    return Cart(
      title: data['title'],
      type: data['type'],
      phonenumber: data['phonenumber'],
      location: data['location'],
      description: data['description'],
      price: data['price'],
      qty: data['qty'],
      photoURL: data['photoURL'],
      
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

  Cart copyWith({
    String? title,
    String? type,
     String? phonenumber,
      String? location,
       String? description,
        String? price,
         String? qty,
          String? photoURL,

          int? count,
   bool? addedToCart,
  }) =>
      Cart(
      title: title ?? this.title,
        type: type ?? this.type,
        phonenumber: phonenumber ?? this.phonenumber,
        location: location ?? this.location,
        description: description ?? this.description,
        price: price ?? this.price,
        qty: qty ?? this.qty,
        photoURL: photoURL?? this.photoURL,
      
        
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
