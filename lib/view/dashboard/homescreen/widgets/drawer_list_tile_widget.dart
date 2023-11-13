import 'package:digitalwebber/view/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerListTileWidget extends StatefulWidget {
  const DrawerListTileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final Function() onTap;
  final IconData icon;
  final String title;

  @override
  State<DrawerListTileWidget> createState() => _DrawerListTileWidgetState();
}

class _DrawerListTileWidgetState extends State<DrawerListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kWhite,
        ),
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              widget.icon,
              size: 22,
              color: kPrimary,
            ),
            SizedBox(width: 16.w),
            customText(widget.title, color: kPrimary),
            const Spacer(),
            const Icon(Icons.chevron_right_rounded, color: kPrimary),
          ],
        ),
      ),
    );
  }
}
