import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makeupproject/constants/callFunctions.dart';
import 'package:makeupproject/user/appointments.dart';
import 'package:provider/provider.dart';

import '../constants/mycolor.dart';
import '../models/mymodels.dart';
import '../provider/provider.dart';
import 'notifications.dart';

class AddAppointment extends StatelessWidget {
  String userId;
   AddAppointment({super.key,required this.userId});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    MainProvider provider = Provider.of<MainProvider>(context, listen: false);
    return   SafeArea(
      child: Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: height * 0.13,
          title: Center(
              child:
              Text('Book Appointment', style: TextStyle(
                fontSize: 20,
                fontFamily: 'PoetsenOne',
                color: Colors.white,
              ),)),
          flexibleSpace: const Image(
            image: AssetImage('assets/Ellipse 9.png'),
            fit: BoxFit.fill,
          ),
          backgroundColor: Colors.transparent,
        ),
        extendBody: true,
        body: SingleChildScrollView(
          child: Consumer<MainProvider>(
            builder: (context,value,child) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding:
                      EdgeInsets.only(top: 50, left: 20, right: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "BRIDE NAME",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'PoetsenOne',
                                  color: Color(0xff988A9A),
                                ),
                              ),
                              SizedBox(
                                height: height / 150,
                              ),
                              Container(
                                height: height / 15,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 3,
                                          color: Colors.grey,
                                          offset: Offset(0, 4))
                                    ]),
                                child: TextFormField(
                                  validator: (value) {
                                  if(value==null||value.isEmpty){return "*Required ";}
                                  return  null;
                                },
                                  controller: value.brideNameController,
                                  cursorColor: Colors.black26,
                                  cursorHeight: 20,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: Colors.black26,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height / 150,
                              ),
                              Text(
                                "PICK  A DATE",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'PoetsenOne',
                                  color: Color(0xff988A9A),
                                ),
                              ),
                              SizedBox(
                                height: height / 150,
                              ),
                              Consumer<MainProvider>(
                                builder: (context,value,child) {
                                  return Container(
                                    height: height / 15,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3,
                                            offset: Offset(0, 4),
                                            color: Colors.grey,
                                          )
                                        ]),
                                    child: TextFormField(
                                      validator: (value) {
                                        if(value==null||value.isEmpty){return "*Required ";}
                                        return  null;
                                      },
                                      keyboardType: TextInputType.none,

                                      onTap: (){
                                      provider.selectDate(context);

                                    },
                                      controller: value.dateController,
                                      cursorColor: Colors.black26,
                                      cursorHeight: 20,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.black26,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),

                                  );
                                }
                              ),
                              SizedBox(
                                height: height / 150,
                              ),
                              Text(
                                "PICK AN AVAILABLE TIME",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'PoetsenOne',
                                  color: Color(0xff988A9A),
                                ),
                              ),
                              SizedBox(
                                height: height / 150,
                              ),
                              Container(
                                height: height / 15,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(0, 4),
                                        color: Colors.grey,
                                      )
                                    ]),
                                child: TextFormField(
                                  validator: (value) {
                                    if(value==null||value.isEmpty){return "*Required ";}
                                    return  null;
                                  },
                                  onTap: (){
                                    provider.selectTime(context);
                                  },
                                  controller: provider.timeController,
                                  cursorColor: Colors.black26,
                                  cursorHeight: 20,
                                  decoration: InputDecoration(

                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),

                                      borderSide: BorderSide(
                                        color: Colors.black26,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),

                              ),

                              SizedBox(
                                height: height / 150,),
                              Text(
                                "ADDRESS",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'PoetsenOne',
                                  color: Color(0xff988A9A),
                                ),
                              ),
                              SizedBox(
                                height: height / 150,

                              ),
                              Container(
                                height: height / 15,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(0, 4),
                                        color: Colors.grey,
                                      )
                                    ]),
                                child: TextFormField(
                                  validator: (value) {
                                    if(value==null||value.isEmpty){return "*Required ";}
                                    return  null;
                                  },

                                  controller: value.AddressController,
                                  cursorColor: Colors.black26,
                                  cursorHeight: 20,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: Colors.black26,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),

                              ),
                              SizedBox(
                                height: height / 150,
                              ),
                              Text(
                                "Phone",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'PoetsenOne',
                                  color: Color(0xff988A9A),
                                ),
                              ),
                              SizedBox(
                                height: height / 150,

                              ),
                              Container(

                                height: height / 15,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(0, 4),
                                        color: Colors.grey,
                                      )
                                    ]),
                                child: TextFormField(
                                  validator: (value) {
                                    if(value==null||value.isEmpty){return "*Required ";}
                                    return  null;
                                  },
                                  controller: value.phoneController,
                                  cursorColor: Colors.black26,
                                  cursorHeight: 20,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: Colors.black26,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),

                              ),
                              SizedBox(
                                height: height / 150,
                              ),
                              Text(
                                "MAKEUP TYPE",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'PoetsenOne',
                                  color: Color(0xff988A9A),
                                ),
                              ),
                              SizedBox(
                                height: height / 150,

                              ),
                              Consumer<MainProvider>(
                                builder: (context,value,child) {
                                  return
                                  Autocomplete<MakeupType>(
                                    optionsBuilder:
                                        (TextEditingValue textEditingValue) {
                                      return value.makeupTypeList
                                          .where((MakeupType item) => item.name
                                          .toLowerCase()
                                          .contains(textEditingValue.text
                                          .toLowerCase()))
                                          .toList();
                                    },
                                    displayStringForOption: (MakeupType option) =>
                                    option.name,
                                    fieldViewBuilder: (BuildContext context,
                                        TextEditingController
                                        fieldTextEditingController,
                                        FocusNode fieldFocusNode,
                                        VoidCallback onFieldSubmitted) {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        fieldTextEditingController.text =
                                            value.MakeuptypeController.text;
                                      });

                                      return Container(
                                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),
                                            boxShadow: [BoxShadow( blurRadius: 3,
                                              offset: Offset(0, 4),
                                              color: Colors.grey,
                                        )]),

                                        height: height / 15,
                                        child: TextFormField(

                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Color(0xff988A9A),
                                              fontWeight: FontWeight.w200),
                                          decoration: InputDecoration(

                                            hintStyle: TextStyle(
                                                color: Colors.black26,
                                                fontWeight: FontWeight.w200,
                                                fontFamily: 'PoetsenOne'),
                                            enabledBorder:   OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                          ),
                                          onChanged: (txt) {},
                                          controller: fieldTextEditingController,
                                          focusNode: fieldFocusNode,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "*Required";
                                            } else {}
                                          },
                                        ),
                                      );
                                    },
                                    onSelected: (MakeupType selection) {
                                      value.MakeuptypeController.text =
                                          selection.name;
                                      value.DescriptonController.text =
                                          selection.description;
                                      value.PriceController.text = selection.price;
                                      print(selection.id + "asdfg");
                                    },
                                    optionsViewBuilder: (BuildContext context,
                                        AutocompleteOnSelected<MakeupType> onSelected,
                                        Iterable<MakeupType> options) {
                                      return Align(
                                        alignment: Alignment.topLeft,
                                        child: Material(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              // color: cl23557,
                                            ),
                                            width: 200,

                                            child: ListView.builder(physics: ScrollPhysics(),
                                              padding: const EdgeInsets.all(10.0),
                                              itemCount: options.length,
                                              itemBuilder:
                                                  (BuildContext context, int index) {
                                                final MakeupType option =
                                                options.elementAt(index);

                                                return GestureDetector(
                                                  onTap: () {
                                                    onSelected(option);
                                                  },
                                                  child:  Container(
                                                    decoration: BoxDecoration(
                                                      color: cl23557,
                                                    ),
                                                    height: 50,
                                                    width: 200,
                                                    child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(option.name,
                                                              style: const TextStyle(
                                                                fontFamily:
                                                                'PoetsenOne',
                                                                color: Colors.white,
                                                              )),
                                                          const SizedBox(height: 10),
                                                        ]),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );

                                }
                              ),
                              SizedBox(
                                height: height /50,
                              ),
                              Align(alignment: AlignmentDirectional.bottomEnd,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),color: Color(0xff35103B),
                                  ),
                                  child: Consumer<MainProvider>(
                                    builder: (context,value,child) {
                                      return TextButton(onPressed: (){
                                        if (_formKey.currentState!.validate()){
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(

                                              content:  Text("Do you to make an appointment\n or do you want to recheck?",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'PoetsenOne',
                                                  color:  Color(0xff35103B),
                                                ),),
                                              actions: <Widget>[
                                                Row(
                                                  children: [
                                                    TextButton(
                                                        onPressed: () {

                                                          Navigator.of(ctx).pop();
                                                          value.getToken();
                                                        },
                                                        child: Text("Recheck",
                                                          style: TextStyle(fontSize: 20,  fontFamily: 'PoetsenOne',color:Color(0xffFF0000)
                                                          ),)),
                                                    TextButton(
                                                      onPressed: () {
                                                        value.addBookAppointment(userId,context);
                                                        value.appointmentClr();


                                                        callNext(context, Appointments());



                                                      },

                                                      child: Text("Confirm",
                                                        style: TextStyle(fontSize: 20,  fontFamily: 'PoetsenOne',color:Color(0xff35103B)
                                                        ),),
                                                    ),

                                                  ],
                                                ),

                                              ],
                                            ),
                                          );
                                        }





                                      },
                                          child:Text("Book an appointment",style: TextStyle(fontSize: 15,  fontFamily: 'PoetsenOne',color: Colors.white),) );
                                    }
                                  ),
                                ),
                              ),
                              SizedBox(height: height/4)





                            ]),
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
