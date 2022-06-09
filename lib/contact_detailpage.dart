import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactDetail extends StatefulWidget {
  const ContactDetail({Key? key}) : super(key: key);

  @override
  State<ContactDetail> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ContactDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height - 24,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color(0xffFFFFFF),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            headerPart(context: context),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: const Divider(
                color: Color.fromARGB(88, 0, 0, 0),
              ),
            ),
            descriptionArea(context: context),
            contactDetailArea(context: context),
            btnArea(context: context)
          ],
        ),
      ),
    );
  }

  Widget headerPart({required BuildContext context}) {
    return Stack(
      children: [
        Container(
          height: 160,
          width: MediaQuery.of(context).size.width - 60,
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/social-media-profile-photos-3.jpg",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Text(
                "Alex Smith",
                style: GoogleFonts.openSans(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: const Color.fromARGB(216, 49, 49, 49),
                ),
              ),
              Text(
                "CEO in Monterrey, MX",
                style: GoogleFonts.openSans(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 21,
                  color: const Color.fromARGB(125, 43, 43, 43),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 50,
          width: 30,
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const FaIcon(
                  FontAwesomeIcons.xmark,
                  color: Color.fromARGB(220, 49, 49, 49),
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget descriptionArea({required BuildContext context}) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xffFFFFFF),
            ),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255)),
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
                    color: const Color.fromARGB(225, 43, 43, 43),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 2),
            decoration: const BoxDecoration(
              color: Color(0xffFFFFFF),
            ),
            child: Text(
              "I've met Alex at an event in Monterrey. He is one of the most influential businessman in the region. I would like to introduce him to my trade partner i EI Pase.",
              style: GoogleFonts.openSans(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: const Color.fromARGB(134, 32, 32, 32),
              ),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }

  Widget contactDetailArea({required BuildContext context}) {
    return SizedBox(
      height: 240,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          cardDesign(
              context: context, img: "phone", content: "+52 55 1234 5678"),
          cardDesign(
              context: context, img: "home", content: "+1 (555) 555-1234"),
          cardDesign(
              context: context, img: "mail", content: "alexsmith@gmail.com"),
          cardDesign(
              context: context, img: "instagram", content: "@alexmonterrey"),
        ],
      ),
    );
  }

  Widget cardDesign(
      {required BuildContext context,
      required String img,
      required String content}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(5),
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xffFFFFFF),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Color(0xffF5F9FC),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/svg/$img.svg",
                  height: 20,
                  color: const Color(0xff4287F6),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            content,
            style: GoogleFonts.openSans(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: const Color.fromARGB(199, 43, 43, 43),
            ),
          )
        ],
      ),
    );
  }

  Widget btnArea({required BuildContext context}) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 50),
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xff4287F6),
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
          "Contact Alex",
          style: GoogleFonts.openSans(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: const Color.fromARGB(224, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
