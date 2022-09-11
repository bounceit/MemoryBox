part of 'orange_bloc.dart';

@immutable
abstract class OrangeListItemEvent extends Equatable {}

class LoadOrangeListItemEvent extends OrangeListItemEvent {
  LoadOrangeListItemEvent();

  @override
  List<Object?> get props => [];
}

class UpdateOrangeListItemEvent extends OrangeListItemEvent {
  UpdateOrangeListItemEvent({
    this.list = const <CollectionsModel>[],
  });
  final List<CollectionsModel> list;

  @override
  List<Object?> get props => [
        list,
      ];
}
