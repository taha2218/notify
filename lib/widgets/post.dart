import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withOpacity(0.7),
            width: 0.15,
          ),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildHeader(context),
          SizedBox(height: 12,),
          _buildImage(context),
          SizedBox(height: 12,),
          _buildTextBody(context),
          SizedBox(height: 12,),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(11),
              image: DecorationImage(image: AssetImage("assets/avatars/dp2.jpg")),
              border: Border.all(
                width: 0.1,
                color: Colors.black.withOpacity(0.5),
              )
            ),
          ),
          Expanded(
            child: Container(
              height: 45,
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:3.0),
                    child: Text(
                      'Spider-Man: Spider-Verse',
                      style: GoogleFonts.rajdhani(textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600, height: 0.9)),
                    ),
                  ),
                  Text(
                    'Peter Parker',
                    style: GoogleFonts.rajdhani(textStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, height: 0.9)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:4),
                    child: Text(
                      '19 September, 07:30 AM',
                      style: GoogleFonts.rajdhani(textStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, height: 0.8)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                IconButton(color: Colors.black.withOpacity(0.75), padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10), constraints: BoxConstraints(),icon: Icon(Icons.bookmark_border), onPressed: (){}),
              ],
            ),
          ),
        ],
      ),
    ) ;    
  }   

  Widget _buildImage(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 240, 240, 1),
        borderRadius: BorderRadius.circular(13),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Image.asset('assets/images/bg1.jpg', fit: BoxFit.fitWidth,),
      ),
    );
  }

  Widget _buildTextBody(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Linkify(
        onOpen: (link) async {
          if (await canLaunch(link.url)) {
            await launch(link.url);
          } else {
            throw "Could not launch $link";
          }
        },
        text:'''"Anyone can wear the mask. You can wear the mask. If you didn't know that before, I hope you do now" 💥🙌\nSpider-Man: Into the Spider-Verse hits the thatres this august! Don't miss out the movie.\nWatch the trailer at https://www.youtube.com/watch?v=g4Hbz2jLxvQ ❤🤩✨''',
        style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,height: 1.25)),
        textAlign: TextAlign.justify,
        linkStyle: TextStyle(
          color: Colors.blue,
        ),
      )
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        "2 Files Attatched",
        style: GoogleFonts.rajdhani(textStyle: TextStyle(
          color: Colors.black54,
          fontSize: 12
        ),)
      ),
    );
  }

}