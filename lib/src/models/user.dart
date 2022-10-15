import 'package:equatable/equatable.dart';

class UserIntercom extends Equatable
{
  final String id;
  final String name;
  final String lastName;
  final int age;
  final String? image;


  const UserIntercom.name(this.id, this.name, this.lastName, this.age, {this.image});

  @override
  // TODO: implement props
  List<Object?> get props => ['id'];
  Map <String, Object?> toFirebaseMap({String? newImage})
  {
    return <String,Object?>{
      'id':id,
      'name':name,
      'lastName':lastName,
      'age':age,
      'image':newImage ?? image,

    };


  }
  UserIntercom.fromFirebaseMap(Map<String, Object?> data):
        id=data['id'] as String,
        name=data['name'] as String,
        lastName=data['lastName'] as String,
        age= data['age'] as int,
        image=data['image'] as String?;

}