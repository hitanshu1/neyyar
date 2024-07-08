part of 'bloc.dart';

/// offer state
abstract class OfferState extends Equatable {
  /// constructor
  const OfferState();

  @override
  List<Object> get props => [];
}
/// offer loading state

class OfferLoading extends OfferState {}

/// offer loaded state
class OfferLoaded extends OfferState {
  /// offer list
  final List<OfferModel> offers;
/// constructor
  const OfferLoaded({required this.offers});

  @override
  List<Object> get props => [offers];
}
/// offer error state

class OfferError extends OfferState {
  /// error message
  final String message;
/// constructor
  const OfferError({required this.message});

  @override
  List<Object> get props => [message];
}
