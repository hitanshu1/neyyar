part of 'bloc.dart';

/// offer event
abstract class OfferEvent extends Equatable {
  /// constructor
  const OfferEvent();

  @override
  List<Object> get props => [];
}
/// offer load event
class LoadOffers extends OfferEvent {}
