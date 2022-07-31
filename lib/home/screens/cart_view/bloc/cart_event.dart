part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class CartUpdated extends CartEvent {
  final List<Cart> cartData;
  const CartUpdated(this.cartData);

  @override
  List<Object> get props => [cartData];
}

class RemoveItem extends CartEvent {
  final String title;

  const RemoveItem({
    
     required this.title,
    // required this.type,
    // required this.phonenumber,
    // required this.location,
    // required this.description,
    // required this.photoURL,
    // required this.price,
    // required this.qty,
   
    // required this.count,
    // required this.addedToCart,
  });

  @override
  List<Object> get props => [title];
}
