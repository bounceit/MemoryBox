part of 'list_item_collections_bloc.dart';

enum ListItemCollectionStatus {
  initial,
  emptyList,
  success,
  failed,
}

@immutable
class ListItemCollectionState extends Equatable {
  const ListItemCollectionState({
    this.status = ListItemCollectionStatus.initial,
    this.list = const [],
  });
  final ListItemCollectionStatus status;
  final List list;

  ListItemCollectionState copyWith({
    ListItemCollectionStatus? status,
    List? list,
  }) {
    return ListItemCollectionState(
      status: status ?? this.status,
      list: list ?? this.list,
    );
  }

  @override
  List<Object?> get props => [
        status,
        list,
      ];
}
