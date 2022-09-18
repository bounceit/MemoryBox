part of 'save_page_bloc.dart';

class SavePageEvent extends Equatable {
  const SavePageEvent({
    this.newSearchName,
    this.newAudioName,
  });
  final List? newSearchName;
  final String? newAudioName;

  @override
  List<Object?> get props => [
        newSearchName,
        newAudioName,
      ];
}
