import 'dart:io';

import 'package:flutter/material.dart';
import 'package:makeupproject/constants/callFunctions.dart';
import 'package:provider/provider.dart';
import '../constants/widget.dart';
import '../constants/mycolor.dart';
import '../models/mymodels.dart';
import '../provider/provider.dart';

class AddWork extends StatelessWidget {
  String from;
  String nId;
  AddWork({super.key, required this.from, required this.nId});

  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context, listen: false);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
              padding: EdgeInsets.only(bottom: 30, left: 90),
              child: txtstyl("Add  New work", 20, Colors.white)),
          automaticallyImplyLeading: false,
          toolbarHeight: height * 0.13,
          flexibleSpace: Image(
            image: AssetImage('assets/Ellipse 9.png'),
            fit: BoxFit.fill,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // InkWell(
              //   onTap: () {
              //     showBottomSheet(context);
              //   },
              //   child: Consumer<MainProvider>(builder: (context, value, child) {
              //     return value.fileImage != null
              //         ? Container(
              //             margin: EdgeInsets.all(20),
              //             width: width / 1.5,
              //             height: height / 4,
              //             decoration: BoxDecoration(
              //                 boxShadow: const [
              //                   BoxShadow(blurRadius: 1, offset: Offset(0, 2))
              //                 ],
              //                 borderRadius: BorderRadius.circular(10),
              //                 color: Color(0xff988A9A)),
              //             child: Image.file(
              //               value.fileImage!,
              //               fit: BoxFit.fill,
              //             ),
              //           )
              //         : value.imageUrl != ""
              //             ? Container(
              //                 margin: EdgeInsets.all(20),
              //                 width: width / 1.5,
              //                 height: height / 4,
              //                 decoration: BoxDecoration(
              //                     boxShadow: const [
              //                       BoxShadow(
              //                           blurRadius: 1, offset: Offset(0, 2))
              //                     ],
              //                     borderRadius: BorderRadius.circular(10),
              //                     color: Color(0xff988A9A)),
              //                 child: Image.network(
              //                   value.imageUrl,
              //                   fit: BoxFit.fill,
              //                 ),
              //               )
              //             : Container(
              //                 margin: EdgeInsets.all(20),
              //                 width: width / 1.5,
              //                 height: height / 4,
              //                 decoration: BoxDecoration(
              //                     boxShadow: [
              //                       BoxShadow(
              //                           blurRadius: 1, offset: Offset(0, 2))
              //                     ],
              //                     borderRadius: BorderRadius.circular(10),
              //                     color: Color(0xff988A9A)),
              //                 child: Center(
              //                     child: txtstyl("Image", 20, Colors.white)),
              //               );
              //   }),
              // ),
              Consumer<MainProvider>(builder: (context, value, child) {
                return InkWell(
                onTap: (){
                  showBottomSheet(context);
                  },
                  child: SizedBox(height: height / 2.5,
                    child:value.fileImageList.isNotEmpty?
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: value.fileImageList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(20),
                          width: width / 1.5,
                          height: height / 4,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: 1, offset: Offset(0, 2))
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff988A9A)),
                          child:Image.file(value.fileImageList[index],fit: BoxFit.fill,),



                        );
                      },
                    ):value.imageList.isNotEmpty? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: value.imageList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(20),
                          width: width / 1.5,
                          height: height / 4,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: 1, offset: Offset(0, 2))
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff988A9A)),
                          child:Image.network(value.imageList[index],fit: BoxFit.fill,),

                        );
                      },
                    ):
                    Container(
                      margin: EdgeInsets.all(20),
                      width: width / 1.5,
                      height: height / 3,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1, offset: Offset(0, 2))
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff988A9A)),
                      child: Center(
                          child: txtstyl("Image", 20, Colors.white)),
                    ),
                  ),
                );
              }),

              Container(
                height: height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Ellipse 9 (1).png"),
                        fit: BoxFit.fill)),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: height / 25,
                      right: height / 25,
                      top: height / 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer<MainProvider>(
                            builder: (context, value, child) {
                          return txtfm(height / 15, "Bride:", 1,
                              value.BdnameController, true);
                        }),
                        SizedBox(
                          width: width,
                          child: Consumer<MainProvider>(
                              builder: (context, value, child) {
                            return Autocomplete<MakeupType>(
                              optionsBuilder: (TextEditingValue textEditingValue) {
                                return value.makeupTypeList
                                    .where((MakeupType item) => item.name
                                        .toLowerCase()
                                        .contains(textEditingValue.text
                                            .toLowerCase())).toList();
                                },
                              displayStringForOption:(MakeupType option) =>
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

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: height / 15,
                                    child: TextFormField(
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200),
                                      decoration: InputDecoration(
                                        hintText: "Makeup Type",
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200,
                                            fontFamily: 'PoetsenOne'),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onChanged: (txt) {},
                                      controller: fieldTextEditingController,
                                      focusNode: fieldFocusNode,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "This field is Required";
                                        } else {}
                                      },
                                    ),
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
                                        color: cl23557,
                                      ),
                                      width: 200,
                                      height: 300,
                                      child: ListView.builder(
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
                                            child: Container(
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
                          }),
                        ),
                        Consumer<MainProvider>(
                            builder: (context, value, child) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              // height: height/5,
                              child: TextFormField(
                                enabled: false,
                                controller: value.DescriptonController,
                                maxLines: null,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200),
                                decoration: InputDecoration(
                                  hintText: "Description",
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: 'PoetsenOne'),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                        Consumer<MainProvider>(
                            builder: (context, value, child) {
                          return txtfm(height / 15, "Price:", 1,
                              value.PriceController, false);
                        }),
                        SizedBox(
                          height: height / 10,
                        ),
                        Consumer<MainProvider>(
                            builder: (context, value, child) {
                          return InkWell(
                              onTap: () {
                                if (from == "NEW") {
                                  value.addNewWork(context, 'NEW', '');
                                  provider.GetNewWork();
                                } else {
                                  value.addNewWork(
                                    context,
                                    'EDIT',
                                    nId,
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("edit data successfully"),
                                    backgroundColor: Color(0xff523557),
                                  ));
                                }
                                back(context);
                              },
                              child: button(
                                " Submit",
                                height / 25,
                                width / 3,
                              ));
                        }),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context, listen: false);

    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading: Icon(
                    Icons.camera_enhance_sharp,
                    color: cl23557,
                  ),
                  title: const Text(
                    'Camera',
                  ),
                  onTap: () =>
                      {provider.getImagecamera(), Navigator.pop(context)}),
              ListTile(
                  leading: Icon(Icons.photo, color: cl23557),
                  title: const Text(
                    'Gallery',
                  ),
                  onTap: () =>
                      {provider.getImagegallery(), Navigator.pop(context)}),
            ],
          );
        });
    //ImageSource
  }
}
