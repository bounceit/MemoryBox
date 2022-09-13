part of 'audio_collection_add_bloc.dart';

abstract class ListCollectionAddAudioInCollectionEvent extends Equatable {
  const ListCollectionAddAudioInCollectionEvent();
}

class LoadListCollectionAddAudioInCollectionEvent
    extends ListCollectionAddAudioInCollectionEvent {
  const LoadListCollectionAddAudioInCollectionEvent();

  @override
  List<Object?> get props => [];
}

class UpdateListCollectionAddAudioInCollectionEvent
    extends ListCollectionAddAudioInCollectionEvent {
  const UpdateListCollectionAddAudioInCollectionEvent({
    this.list = const [],
  });
  final List list;

  @override
  List<Object?> get props => [
        list,
      ];
}
