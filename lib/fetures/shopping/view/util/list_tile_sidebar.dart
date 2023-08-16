import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ListTile listTileContainer({
  required Function() onTap,
  required IconData icon,
  required String title,
}) =>
    ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: Colors.black87,
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
      ),
      onTap: onTap,
    );
