import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class DisplayItem extends StatefulWidget {
  DisplayItem(
      {this.age,
      this.emailAddress,
      this.name,
      this.occupation,
      this.sex,
      Key? key})
      : super(key: key);
  final String? name;
  final String? emailAddress;
  final int? age;
  final String? occupation;
  final String? sex;

  @override
  _DisplayItemState createState() => _DisplayItemState();
}

class _DisplayItemState extends State<DisplayItem> {
  var _isExpanded = false;

  var _description =
      '''I am a budding flutter developer available for any legal freelance gigs, I can deliver top notch, globally acceptable mobile applications for both android and IOS .Don't worry I'm not too expensive LOL''';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Asset/images/zuri pic.jpg'),
                    fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name!,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: kTextColor,
                    ),
                  ),
                ),
                Text(
                  widget.occupation!,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: kTextColor,
                    ),
                  ),
                ),
                Text(
                  widget.emailAddress!,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: kTextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(widget.sex!.substring(0, 1).toUpperCase()),
                      VerticalDivider(
                        thickness: 2,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Text(widget.age!.toString()),
                    ],
                  ),
                )
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              icon: _isExpanded
                  ? Icon(Icons.expand_less)
                  : Icon(Icons.expand_more),
            ),
          ),
        ),
        if (_isExpanded)
          Container(
            margin: EdgeInsets.all(kDefaultPadding - 15),
            padding: EdgeInsets.all(kDefaultPadding - 15),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 10 / 6,
                  child: Image.asset('Asset/images/zuri pic.jpg'),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Name:',
                      style: GoogleFonts.roboto(
                          color: kPrimaryColor, fontSize: 20),
                    ),
                    TextSpan(
                      text: ' ${widget.name!} \n\n',
                      style: GoogleFonts.poppins(color: kTextColor),
                    ),
                    TextSpan(
                      text: 'Occupation:',
                      style: GoogleFonts.roboto(
                          color: kPrimaryColor, fontSize: 20),
                    ),
                    TextSpan(
                      text: ' ${widget.occupation!} \n\n',
                      style: GoogleFonts.poppins(color: kTextColor),
                    ),
                    TextSpan(
                      text: 'Level:',
                      style: GoogleFonts.roboto(
                          color: kPrimaryColor, fontSize: 20),
                    ),
                    TextSpan(
                      text: ' Intermediate \n\n',
                      style: GoogleFonts.poppins(color: kTextColor),
                    ),
                    TextSpan(
                      text: 'email:',
                      style: GoogleFonts.roboto(
                          color: kPrimaryColor, fontSize: 20),
                    ),
                    TextSpan(
                      text: '${widget.emailAddress!} \n\n',
                      style: GoogleFonts.poppins(color: kTextColor),
                    ),
                    TextSpan(
                      text: 'Sex:',
                      style: GoogleFonts.roboto(
                          color: kPrimaryColor, fontSize: 20),
                    ),
                    TextSpan(
                      text: ' ${widget.sex!} \n\n',
                      style: GoogleFonts.poppins(color: kTextColor),
                    ),
                    TextSpan(
                      text: 'Age:',
                      style: GoogleFonts.roboto(
                          color: kPrimaryColor, fontSize: 20),
                    ),
                    TextSpan(
                      text: " ${widget.age!.toString()} \n\n",
                      style: GoogleFonts.poppins(color: kTextColor),
                    ),
                    TextSpan(
                      text: 'Description:',
                      style: GoogleFonts.roboto(
                          color: kPrimaryColor, fontSize: 20),
                    ),
                    TextSpan(
                      text: ' $_description \n\n',
                      style: GoogleFonts.poppins(color: kTextColor),
                    ),
                  ]),
                )
              ],
            ),
          )
      ],
    );
  }
}
