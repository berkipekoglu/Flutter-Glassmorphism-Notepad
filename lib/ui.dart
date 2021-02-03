import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism_ui/addNoteTemplate.dart';
import 'package:google_fonts/google_fonts.dart';

class GlassmorphismUI extends StatefulWidget {
  @override
  _GlassmorphismUIState createState() => _GlassmorphismUIState();
}

Color myRed = Color(0xFFFF7E7E);
Color myYellow = Color(0xFFFDE36B);
Color myDark = Color(0xFF1D1A19);

class _GlassmorphismUIState extends State<GlassmorphismUI> {
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
                          // Left icon and Title
                          Row(
                            children: [
                              IconButton(
                                icon: SvgPicture.asset(
                                  "assets/images/svg/menu.svg",
                                  fit: BoxFit.cover,
                                  color: myDark,
                                  height: 23,
                                ),
                                onPressed: () =>
                                    debugPrint("Menu button clicked!"),
                                //iconSize: 30,
                                color: myDark,
                              ),
                              Text(
                                "Mood",
                                style: GoogleFonts.montserrat(
                                  fontSize: 24.0,
                                  color: myDark,
                                ),
                              ),
                              Text(
                                "Note",
                                style: GoogleFonts.montserrat(
                                  fontSize: 24.0,
                                  color: myDark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          // Right Icons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: SvgPicture.asset(
                                  "assets/images/svg/plus.svg",
                                  fit: BoxFit.cover,
                                  color: myDark,
                                  height: 26,
                                ),
                                onPressed: () => debugPrint(
                                    "Button clicked!: add_circle icon"),
                                //iconSize: 30,
                              ),
                              IconButton(
                                icon: SvgPicture.asset(
                                  "assets/images/svg/search.svg",
                                  fit: BoxFit.cover,
                                  height: 23,
                                  color: myDark,
                                ),
                                onPressed: () =>
                                    debugPrint("Button clicked!: search icon"),
                              ),
                              IconButton(
                                icon: SvgPicture.asset(
                                  "assets/images/svg/more.svg",
                                  fit: BoxFit.cover,
                                  height: 22,
                                  color: myDark,
                                ),
                                onPressed: () => debugPrint(
                                    "Button clicked!: dot more icon"),
                              ),
                            ],
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
                          children: [
                            // sort settings
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 9.0, right: 9.0),
                              child: Container(
                                constraints: BoxConstraints(maxHeight: 30),
                                width: size.width,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.97),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[400].withOpacity(0.1),
                                      spreadRadius: 3,
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sort by modified time",
                                      style: GoogleFonts.lato(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    IconButton(
                                      icon: SvgPicture.asset(
                                        "assets/images/svg/down-arrow.svg",
                                        fit: BoxFit.cover,
                                        color: myDark,
                                        height: 13,
                                      ),
                                      onPressed: () => debugPrint(
                                          "Button clicked!: arrow icon"),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // no note
                            noNote(),
                          ],
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

  noNote() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400].withOpacity(0.20),
                        spreadRadius: 1.0,
                        blurRadius: 10.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  width: 110.0,
                  height: 115.0,
                ),
                Positioned(
                  top: 55.0,
                  left: 50.0,
                  child: IconButton(
                    icon: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        "assets/images/svg/plus.svg",
                        color: myDark,
                        fit: BoxFit.cover,
                        height: 57,
                      ),
                    ),
                    iconSize: 57,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNoteTemplate(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
