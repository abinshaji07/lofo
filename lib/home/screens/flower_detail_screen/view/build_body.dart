import 'package:cart_repository/cart_repository.dart';
import 'package:flowers_repository/flowers_repository.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/filled_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/flush_bar.dart';
import '../../../../theme/theme.dart';
import '../bloc/cart_info_bloc.dart';

class BuildBody extends StatefulWidget {
  final Flower flower;
  const BuildBody({
    Key? key,
    required this.flower,
  }) : super(key: key);

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
   int count = 0;
  late String price;

  String getPrice() {
    if(count == null)
    {
      return "0";
    }
    final value = (count * int.parse(price)).toStringAsFixed(2);
    return "₹ $value";
  }

  @override
  void initState() {
    super.initState();
    count = widget.flower.count;
    price = widget.flower.price;
  }

  Widget _heading(String text) => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).colorScheme.secondary;
    final isLight = context.watch<ThemeCubit>().state;
    return Column(
      children: <Widget> [
        _heading("Phone Number"),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
          child: Text(
            widget.flower.phonenumber,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        _heading("Total Count:"),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                5,
                (index) => GestureDetector(
                  onTap: () {
                    if (widget.flower.addedToCart) {
                      showMessage(
                          context: context,
                          icon: Icons.check_circle_outline_outlined,
                          code: "Already added",
                          message:
                              "You can't change now, remove it from cart.");
                    } else {
                      setState(() {
                        count = index + 1;
                      });
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    // padding: const EdgeInsets.all(16),
                    width: 48,
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: count == index + 1
                          ? accentColor
                          : (isLight
                              ? Colors.black.withOpacity(0.1)
                              : Colors.white.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: count == index + 1 ? Colors.white : null,
                      ),
                    ),
                  ),
                ),
              )
              ,
             
            ],
          ),
        ),
         _heading("Type"),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
          child: Text(
            widget.flower.type,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
         _heading("Description"),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
          child: Text(
            widget.flower.description,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
         _heading("Price"),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
          child: Text(
            widget.flower.price,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
         _heading("Quantity"),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
          child: Text(
            widget.flower.qty,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
         _heading("Location"),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
          child: Text(
            widget.flower.location,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
          // Text(widget.flower.title),
          //     Text(widget.flower.location),
          //     Text(widget.flower.phonenumber),
          //     Text(widget.flower.title),
        const Spacer(),
       
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  getPrice(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: BlocBuilder<CartInfoBloc, CartInfoState>(
                    builder: (context, state) {
                      final isLoading = state is CartInfoLoading;
                      final isExist = state is ItemIsExist;
    
                      return FilledButton(
                        color: isExist ? const Color(0xFF6ED478) : null,
                        title: isExist ? "Added to Cart" : "Add To Cart",
                        onTap: isLoading
                            ? null
                            : () {
                                if (isExist) {
                                  showMessage(
                                      context: context,
                                      icon: Icons.check_circle_outline_outlined,
                                      code: "Already added",
                                      message:
                                          "Please check out from your cart.");
                                } else {
                                  final flower = widget.flower;
                                  final cart = Cart(
                                    title: flower.title,
                                   type: flower.type,
                                     phonenumber: flower.phonenumber,
                                    location: flower.location,
                                     description: flower.description,
                                    price: flower.price,
                                     qty: flower.qty,
                                    photoURL: flower.photoURL,
                                     count: count,
                                     addedToCart: flower.addedToCart,
                                  
    
    
                                    
    
    
        
       
                                  );
    
                                  context.read<CartInfoBloc>().add(
                                        UpdateCart(cart),
                                      );
                                }
                              },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
