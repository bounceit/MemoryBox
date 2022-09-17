part of 'image_cubbit.dart';

@immutable
class GetImageProfileState extends Equatable {
  const GetImageProfileState({
    this.image,
  });

  final String? image;

  GetImageProfileState copyWith({
    String? image,
  }) {
    return GetImageProfileState(
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [
        image,
      ];
}
