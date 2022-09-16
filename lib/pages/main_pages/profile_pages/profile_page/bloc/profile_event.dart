part of 'profile_bloc.dart';

class ProfilePageEvent extends Equatable {
  const ProfilePageEvent({
    this.name,
    this.number,
    this.image,
  });
  final String? name;
  final String? number;
  final String? image;

  @override
  List<Object?> get props => [
        name,
        number,
        image,
      ];
}
