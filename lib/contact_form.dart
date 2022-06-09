import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(30),
        height: MediaQuery.of(context).size.height - 24,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color(0xff4287F6),
        ),
        child: Column(
          children: [
            singleLineTextField(context: context, lblText1: "Name"),
            singleLineTextField(context: context, lblText1: "Position"),
            singleLineTextField(context: context, lblText1: "Location"),
            editDescription(context: context),
            allCardArea(context: context),
            buttonComponent(context: context),
          ],
        ),
      ),
    );
  }

  Widget singleLineTextField(
      {required BuildContext context, required String lblText1}) {
    return TextField(
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

  Widget editDescription({required BuildContext context}) {
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
      onTap: () {},
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
          "Save Contact",
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

  Widget allCardArea({required BuildContext context}) {
    return SizedBox(
      height: 230,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          individualCard(
              context: context,
              icon: "phone",
              hintForInput: "+52 55 1234 5678"),
          individualCard(
              context: context,
              icon: "home",
              hintForInput: "+1 (555) 555-1234"),
          individualCard(
              context: context,
              icon: "mail",
              hintForInput: "alexsmith@gmail.com"),
          individualCard(
              context: context,
              icon: "instagram",
              hintForInput: "@alexmonterrey"),
        ],
      ),
    );
  }

  Widget individualCard(
      {required BuildContext context,
      required String icon,
      required String hintForInput}) {
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
}
