part of 'collection_item_bloc.dart';

@immutable
class CollectionItemAnimState extends Equatable {
  const CollectionItemAnimState({
    this.anim = 0.0,
  });
  final double anim;

  CollectionItemAnimState copyWith({
    double? anim,
  }) {
    return CollectionItemAnimState(
      anim: anim ?? this.anim,
    );
  }

  @override
  List<Object?> get props => [
        anim,
      ];
}
