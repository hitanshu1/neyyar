import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/offer.dart';
import '../../../domain/repositories/offer.dart';

part 'state.dart';
part 'event.dart';

/// offer bloc
class OfferBloc extends Bloc<OfferEvent, OfferState> {
  /// offer repository
  final OfferRepository repository;

  /// constructor
  OfferBloc({required this.repository}) : super(OfferLoading()) {
    on<LoadOffers>((event, emit) async {
      try {
       
        final offers = await repository.get();
       
        emit(OfferLoaded(offers: offers));
      } catch (e) {
       
        emit(OfferError(message: e.toString()));
      }
    });
  }
}
