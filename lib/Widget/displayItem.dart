import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class DisplayItem extends StatelessWidget {
  const DisplayItem(
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
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${name!.substring(0, 1).toUpperCase()}',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: kTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name!,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: kTextColor,
                ),
              ),
            ),
            Text(
              occupation!,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: kTextColor,
                ),
              ),
            ),
            Text(
              emailAddress!,
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
                  Text(sex!.substring(0, 1).toUpperCase()),
                  VerticalDivider(
                    thickness: 2,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Text(age!.toString()),
                ],
              ),
            )
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
