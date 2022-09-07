part of 'list_item_block.dart';

enum ListItemStatus {
  initial,
  emptyList,
  success,
  failed,
}

@immutable
class ListItemState {
  const ListItemState({
    this.status = ListItemStatus.initial,
    this.list = const [],
  });
  final ListItemStatus status;
  final List list;

  ListItemState copyWith({
    ListItemStatus? status,
    List? list,
    StreamSubscription<List>? streamList,
  }) {
    return ListItemState(
      status: status ?? this.status,
      list: list ?? this.list,
    );
  }
}
