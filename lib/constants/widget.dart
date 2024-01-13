import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget tF(TextEditingController controller) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
        inputFormatters: [LengthLimitingTextInputFormatter(10)],
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.phone, color: Colors.white, size: 20),
          hintText: "Phone",
          hintStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value){
          if(value.length==10){
            SystemChannels.textInput.invokeMethod("TextInput.hide");
          }
        },
      ),
    ),
  );
}
Widget phtf(TextEditingController controller){
  return  Padding(
    padding: EdgeInsets.all(20),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
        inputFormatters: [LengthLimitingTextInputFormatter(10)],
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.phone, color: Colors.white, size: 20),
          hintText: "Phone",
          hintStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),


      ),
    ),
  );
}

Widget button(String name, dynamic height, dynamic width, ) {
  return Center(
    child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              border: Border.all(color: Colors.white.withOpacity(0))),
          child: Center(
              child: Text(
            name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          )),
        )),
  );
}

BoxDecoration bgImg() {

  return BoxDecoration(

      color: Colors.black,
      image: DecorationImage(
        image: AssetImage("assets/loginimage.png"),
        fit: BoxFit.fill,
      ));
}

Widget btmTxt(String text1, String text2, context, call) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => call));
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(color: Colors.white, fontSize: 16,),
        ),
        Text(
          text2,
          style: TextStyle(color: Colors.white, fontSize: 16,decoration:TextDecoration.underline,decorationColor: Colors.white ),
        ),
      ],
    ),
  );
}

Widget hdTxt(String hdtxt) {
  return Padding(
    padding: EdgeInsets.only(left: 20),
    child: Text(
      hdtxt,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
    ),
  );
}

Widget tF1(String txt, dynamic Iconsname,TextEditingController controller) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
        decoration: InputDecoration(
          prefixIcon: Icon(Iconsname, color: Colors.white, size: 20),
          hintText: txt,
          hintStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  );
}

Widget tF2(
  double height,
  double width,
) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10)),
    child: TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [LengthLimitingTextInputFormatter(1)],
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    ),
  );
}

Widget rw() {
  return Row(children: [
    Icon(Icons.star, color: Color(0xffF1BF0E), size: 20,),
    Icon(Icons.star, color: Color(0xffF1BF0E), size: 20),
    Icon(Icons.star, color: Color(0xffF1BF0E), size: 20),
    Icon(Icons.star, color: Color(0xffF1BF0E), size: 20,),
    Icon(Icons.star, color: Color(0xffF1BF0E), size: 20,)
  ]);
}

Widget Fisrtadmin(String text, context,) {
  return Container(
    margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: Color(0xff988A9A), borderRadius: BorderRadius.circular(20)),
    child: ListTile(
      trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
        ),

      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      tileColor: Colors.black12,
      leading: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'PoetsenOne',
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget txtstyl(String name, double fontSize, Color clr,) {
  return Text(
    name,
    style: TextStyle(
      fontSize: fontSize,
      fontFamily: 'PoetsenOne',
      color: clr,
    ),
  );
}

Widget txtfldadmn(double height,String name,double fontSize,Color clr,double vlue) {
  return Container(
    height: height,
    width: 400,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(blurRadius: 3, color: Colors.grey, offset: Offset(0, 4))
        ]),
    child:Padding(
      padding:  EdgeInsets.all(vlue),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: TextStyle(fontSize: fontSize,color: clr, fontFamily: 'PoetsenOne',) ),
        ],
      ),
    )
  );
}
AppBar apbar(double height,String txt) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: height,
    title: Center(
      child: txtstyl(txt, 20, Colors.white),
    ),
    flexibleSpace: const Image(
      image: AssetImage('assets/Ellipse 9.png'),
      fit: BoxFit.fill,
    ),
    backgroundColor: Colors.transparent,
  );
}
Widget txtfm(double height,String txt,dynamic lines,TextEditingController contrlr,bool enbled){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: height,
      child: TextFormField(enabled: enbled,
        controller: contrlr,
        maxLines: lines,
        style:  TextStyle(
            color: Colors.white, fontWeight: FontWeight.w200),
        decoration: InputDecoration(
          hintText: txt,
          hintStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w200,fontFamily:'PoetsenOne' ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  );
}
Widget fmfld(double height,dynamic lines,String txt,double fontSize,Color clr,TextEditingController cntrlr){
  return  Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      height: height ,
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
      child: TextFormField(controller: cntrlr,
        maxLines: lines,
        cursorColor: Colors.black26,
        cursorHeight: 20,
        decoration: InputDecoration(hintText: txt,
          hintStyle:  TextStyle(
            fontSize: fontSize,
            fontFamily: 'PoetsenOne',
            color: clr,
          ),
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
  );
}
