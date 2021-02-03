import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism_ui/ui.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNoteTemplate extends StatefulWidget {
  @override
  _AddNoteTemplateState createState() => _AddNoteTemplateState();
}

Color myRed = Color(0xFFFF7E7E);
Color myYellow = Color(0xFFFDE36B);
Color myDark = Color(0xFF1D1A19);

class _AddNoteTemplateState extends State<AddNoteTemplate> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  myYellow,
                  myRed,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4,
                sigmaY: 4,
              ),
              child: Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  children: [
                    // Header
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.94),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: SvgPicture.asset(
                                "assets/images/svg/ticked-circle.svg"),
                            onPressed: () => debugPrint("clicked button."),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              height: 37.0,
                              margin: EdgeInsets.only(right: 10, left: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.90),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.grey[200].withOpacity(0.30),
                                      spreadRadius: 1,
                                      offset: Offset(0, 1),
                                    ),
                                  ]),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: InputBorder.none,
                                  filled: false,
                                  focusedBorder: InputBorder.none,
                                ),
                                onSaved: (newValue) => debugPrint(newValue),
                                //onChanged: (value) => debugPrint(value),
                                style: GoogleFonts.montserrat(
                                  color: myDark,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: SvgPicture.asset(
                              "assets/images/svg/list.svg",
                              height: 35,
                              fit: BoxFit.cover,
                              color: myDark,
                            ),
                            iconSize: 35.0,
                            onPressed: () {
                              /*
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GlassmorphismUI(),
                                ),
                              );
                              */
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    // Main Body
                    Expanded(
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.90),
                        ),
                        child: Column(
                          children: [],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
