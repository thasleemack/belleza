class MakeupType{

  String id;
  String name;
  String description;
  String price;

  MakeupType(this.id,this.name,this.description,this.price, );

}

class NewworkModel{

  String id;
  String bride;
  String description;
  String makeuptype;
  List<String> photo;
  String price;
  NewworkModel(this.id,this.bride,this.description,this.makeuptype,this.photo,this.price);

}


class appointmentModel{
  String id;
  String name;
  String phone;
  String appointment_date;
  String appointment_time;
  String address;
  String makeup_type;
  String status;
  appointmentModel(this.id,this.name,this.phone,this.appointment_date,this.appointment_time,this.address,this.makeup_type,this.status);
}

class QueryClass{
  String id;
  String name;
  String query;
  QueryClass(this.id,this.name,this.query);

}

class ReviewModel{
  String id;
  String name;
  String rating;
  String username;
  ReviewModel(this.id,this.name,this.rating,this.username);

}