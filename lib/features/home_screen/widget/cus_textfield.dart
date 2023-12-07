import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CusTextfield extends StatelessWidget {
  const CusTextfield({super.key, required this.onChangeFun});
  final void Function(String)? onChangeFun;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChangeFun,
      style: GoogleFonts.rubik(fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 15.0, top: 15.0),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(13)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(13)),
        hintStyle: GoogleFonts.rubik(
            color: Colors.black26, fontSize: 15, fontWeight: FontWeight.w500),
        hintText: "Search Mobile",
        suffixIcon: TextButton(
            onPressed: () {},
            child: Text(
              "Filter",
              style: GoogleFonts.rubik(fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
