
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Widgets/Views/horizontalSlider.dart';
import '../../../bloc/offer/bloc.dart';
import 'card.dart';

/// offer slider
class OfferSlider extends StatelessWidget {
  /// constructor
  const OfferSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferBloc, OfferState>(
      builder: (context,state){
        if(state is OfferLoading){
          return const OfferCard(isShimmer: true,);
        }else if(state is OfferLoaded){
          return HorizontalSlider(
            itemCount: state.offers.length,
             item: (int index) {
              return OfferCard(offer: state.offers[index]);
               },
          );
        }
        return const SizedBox();
      });
  }
}
