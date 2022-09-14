part of 'add_audio_bloc.dart';

@immutable
abstract class CollectionAddAudioEvent extends Equatable {
  const CollectionAddAudioEvent();
}

class LoadCollectionAddAudioEvent extends CollectionAddAudioEvent {
  const LoadCollectionAddAudioEvent({
    this.sort,
  });
  final String? sort;

  @override
  List<Object?> get props => [
        sort,
      ];
}

class UpdateCollectionAddAudioEvent extends CollectionAddAudioEvent {
  const UpdateCollectionAddAudioEvent({
    this.list = const [],
  });
  final List list;

  @override
  List<Object?> get props => [
        list,
      ];
}
