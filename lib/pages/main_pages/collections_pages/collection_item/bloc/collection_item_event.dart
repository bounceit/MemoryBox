part of 'collection_item_bloc.dart';

@immutable
class CollectionItemAnimEvent extends Equatable {
  const CollectionItemAnimEvent({
    required this.anim,
  });
  final double anim;

  @override
  List<Object?> get props => [
        anim,
      ];
}
