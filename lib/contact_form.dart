// ignore_for_file: unnecessary_null_comparison

import 'package:contactapp/contact_model.dart';
import 'package:contactapp/homepage.dart';
import 'package:contactapp/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ContactForm extends StatefulWidget {
  String? name;
  String? position;
  String? location;
  String? description;
  String? phone;
  String? homeNumber;
  String? email;
  String? socilaId;
  String? id;
  bool? isUpdate;
  ContactForm({
    Key? key,
    required this.isUpdate,
    this.name,
    this.position,
    this.location,
    this.description,
    this.phone,
    this.homeNumber,
    this.email,
    this.socilaId,
    this.id,
  }) : super(key: key);

  @override
  State<ContactForm> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ContactForm> {
  final TextEditingController _name = TextEditingController();
  // var txt = TextEditingController();
  final TextEditingController _position = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _homeNumber = TextEditingController();
  final TextEditingController _mail = TextEditingController();
  final TextEditingController _socialId = TextEditingController();
  Future<ContactModel>? _futureContact;

  @override
  void initState() {
    widget.isUpdate == true ? _name.text = widget.name! : _name.text = "";
    widget.isUpdate == true
        ? _position.text = widget.position!
        : _position.text = "";
    widget.isUpdate == true
        ? _location.text = widget.location!
        : _location.text = "";
    widget.isUpdate == true
        ? _description.text = widget.description!
        : _description.text = "";
    widget.isUpdate == true ? _phone.text = widget.phone! : _phone.text = "";
    widget.isUpdate == true
        ? _homeNumber.text = widget.homeNumber!
        : _homeNumber.text = "";
    widget.isUpdate == true ? _mail.text = widget.email! : _mail.text = "";
    widget.isUpdate == true
        ? _socialId.text = widget.socilaId!
        : _socialId.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _position.text = widget.name!;

    return SafeArea(
      child: SingleChildScrollView(
        reverse: true,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.all(30),
          height: MediaQuery.of(context).size.height - 24,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color(0xff4287F6),
          ),
          child:
              (_futureContact == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Widget buildColumn() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          // MyController.value = TextEditingValue(text: "ANY TEXT");
          children: [
            singleLineTextField(
                context: context, lblText1: "Name", controllerName: _name),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const FaIcon(
                FontAwesomeIcons.xmark,
                color: Color.fromARGB(220, 226, 226, 226),
                size: 30,
              ),
            )
          ],
        ),
        singleLineTextField(
            context: context, lblText1: "Position", controllerName: _position),
        singleLineTextField(
            context: context, lblText1: "Location", controllerName: _location),
        editDescription(context: context, controllerName: _description),
        allCardArea(
            context: context,
            controllerName1: [_phone, _homeNumber, _mail, _socialId]),
        buttonComponent(context: context),
      ],
    );
  }

  FutureBuilder<ContactModel> buildFutureBuilder() {
    return FutureBuilder<ContactModel>(
      future: _futureContact,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Navigator.pop(
            context,
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget singleLineTextField(
      {required BuildContext context,
      required String lblText1,
      required controllerName}) {
    return TextField(
      controller: controllerName,
      maxLines: 1,
      style: GoogleFonts.roboto(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 22,
        color: const Color.fromARGB(200, 255, 255, 255),
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
        labelText: lblText1,
        labelStyle: const TextStyle(
            color: Color.fromARGB(127, 255, 255, 255),
            fontWeight: FontWeight.w200),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(0, 243, 243, 243),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 243, 243, 243),
          ),
        ),
      ),
    );
  }

  Widget editDescription(
      {required BuildContext context, required controllerName}) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  child: const FaIcon(
                    FontAwesomeIcons.solidCircle,
                    color: Color(0xffFEAF00),
                    size: 15,
                  ),
                ),
                Text(
                  "Intoduce Alex to partner",
                  style: GoogleFonts.openSans(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: const Color.fromARGB(200, 255, 255, 255),
                  ),
                )
              ],
            ),
          ),
          TextField(
            controller: controllerName,
            keyboardType: TextInputType.multiline,
            maxLines: 4,
            textAlign: TextAlign.justify,
            style: GoogleFonts.roboto(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: const Color.fromARGB(197, 238, 238, 238),
            ),
            decoration: const InputDecoration(
              // labelText: "Hello",

              hintMaxLines: 4,
              hintText:
                  "I've met Alex at an event in Monterrey. He is one of the most influential businessman in the region. I would like to introduce him to my trade partner i EI Pase.",
              hintStyle: TextStyle(
                color: Color.fromARGB(127, 255, 255, 255),
              ),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonComponent({required BuildContext context}) {
    return InkWell(
      onTap: () async {
        if (widget.isUpdate == false) {
          if (_name.text == "" ||
              _position.text == "" ||
              _location.text == "" ||
              _description.text == "" ||
              _phone.text == "" ||
              _homeNumber.text == "" ||
              _mail.text == "" ||
              _socialId.text == "") {
            alertBoxF(
                context: context,
                mainText: "Failed!",
                subText: "Data cannot be empty!");
          } else {
            int sttdcode1 = await Service().createContact(
                name: _name.text,
                position: _position.text,
                city: _location.text,
                description: _description.text,
                phone: _phone.text,
                homeNumber: _homeNumber.text,
                email: _mail.text,
                socialId: _socialId.text);

            if (sttdcode1 == 201) {
              alertBoxS(
                  context: context,
                  mainText: "Sucess",
                  subText: "New Contact Added ");
            } else {
              alertBoxF(
                  context: context,
                  mainText: "Failed",
                  subText: "Failed To Add New Contact");
            }
            // _futureContact = Service().createContact(
            //   name: _name.text,
            //   position: _position.text,
            //   city: _location.text,
            //   description: _description.text,
            //   phone: _phone.text,
            //   homeNumber: _homeNumber.text,
            //   email: _mail.text,
            //   socialId: _socialId.text,
            // );
          }
        } else if (widget.isUpdate == true) {
          if (_name.text == "" ||
              _position.text == "" ||
              _location.text == "" ||
              _description.text == "" ||
              _phone.text == "" ||
              _homeNumber.text == "" ||
              _mail.text == "" ||
              _socialId.text == "") {
            alertBoxF(
                context: context,
                mainText: "Update Failed!",
                subText: "Data cannot be empty!");
          } else {
            int sttCode = await Service().updateContact(
              name: _name.text,
              position: _position.text,
              city: _location.text,
              description: _description.text,
              phone: _phone.text,
              homeNumber: _homeNumber.text,
              email: _mail.text,
              socialId: _socialId.text,
              id: widget.id.toString(),
            );
            if (sttCode == 200) {
              alertBoxS(
                  context: context,
                  mainText: "Sucessful",
                  subText: "Contact Details Updated");
            } else {
              alertBoxF(
                  context: context,
                  mainText: "Failed",
                  subText: "update Failed!");
            }
            // _futureContact = Service().updateContact(
            //   name: _name.text,
            //   position: _position.text,
            //   city: _location.text,
            //   description: _description.text,
            //   phone: _phone.text,
            //   homeNumber: _homeNumber.text,
            //   email: _mail.text,
            //   socialId: _socialId.text,
            //   id: widget.id.toString(),
            // );
            // Fluttertoast.showToast(
            //     msg: "Contact Updated Successfully",
            //     toastLength: Toast.LENGTH_LONG,
            //     timeInSecForIosWeb: 1,
            //     backgroundColor: Colors.black,
            //     fontSize: 18,
            //     gravity: ToastGravity.CENTER);
          }
        }
        setState(() {});
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 20),
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(104, 27, 27, 27),
              blurRadius: 2,
              offset: Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Text(
          widget.isUpdate == false ? "Save Contact" : "Update Contact",
          style: GoogleFonts.openSans(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: const Color.fromARGB(200, 48, 48, 48),
          ),
        ),
      ),
    );
  }

  Widget allCardArea(
      {required BuildContext context, required controllerName1}) {
    return SizedBox(
      height: 230,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          individualCard(
            context: context,
            icon: "phone",
            hintForInput: "+52 55 1234 5678",
            controllerName: controllerName1[0],
          ),
          individualCard(
            context: context,
            icon: "home",
            hintForInput: "+1 (555) 555-1234",
            controllerName: controllerName1[1],
          ),
          individualCard(
            context: context,
            icon: "mail",
            hintForInput: "alexsmith@gmail.com",
            controllerName: controllerName1[2],
          ),
          individualCard(
            context: context,
            icon: "instagram",
            hintForInput: "@alexmonterrey",
            controllerName: controllerName1[3],
          ),
        ],
      ),
    );
  }

  Widget individualCard(
      {required BuildContext context,
      required String icon,
      required String hintForInput,
      required TextEditingController controllerName}) {
    return Container(
      height: 55,
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 59, 125, 231),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/svg/$icon.svg",
                  height: 20,
                  color: const Color(0xffF5F9FC),
                ),
              ),
            ),
          ),
          Container(
            width: 250,
            margin: const EdgeInsets.only(left: 25),
            child: TextField(
              controller: controllerName,
              style: GoogleFonts.roboto(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: const Color.fromARGB(198, 255, 255, 255),
              ),
              decoration: InputDecoration(
                hintText: hintForInput,
                hintStyle: GoogleFonts.roboto(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: const Color.fromARGB(68, 255, 255, 255),
                ),
                contentPadding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                labelStyle: const TextStyle(
                    color: Color.fromARGB(127, 255, 255, 255),
                    fontWeight: FontWeight.w200),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(158, 243, 243, 243),
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 243, 243, 243),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future alertBoxS(
      {required BuildContext context,
      required String mainText,
      required subText}) {
    return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Center(
                child: Text(
                  mainText,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              content: SizedBox(
                height: 24,
                width: 400,
                child: Center(
                  child: Text(
                    subText,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              actions: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                        // setState(() {});
                      },
                      child: const Text("Ok"),
                    ),
                  ),
                )
              ],
            ));
  }

  Future alertBoxF(
      {required BuildContext context,
      required String mainText,
      required subText}) {
    return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Center(
                child: Text(
                  mainText,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              content: SizedBox(
                height: 24,
                width: 400,
                child: Center(
                  child: Text(
                    subText,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              actions: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => HomePage()));
                      },
                      child: const Text("Ok"),
                    ),
                  ),
                )
              ],
            ));
  }
}
