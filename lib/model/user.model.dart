class User{
  String id ;
  String name ;
  String email ;
  int age ;
  int num ;
  String classe;
  User({this.id='',required this.name, required this.email,required this.age,required this.classe,required this.num});
  //**convertir du string to json
  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'name': name,
      'email':email,
      'age':age,
      'classe':classe,
      'num': num
    };
  }
//**convertir du json to string
factory User.fromjson(Map<String,dynamic> json){
    return User(id : json['id'], name:json['name'], email:json['email'], age:json['age'],classe:json['classe'],num:json['num']);

}
}