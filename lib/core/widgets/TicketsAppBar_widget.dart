import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? subtitle;
  final String? title;
  final bool showBack;

  const TicketsAppBar({
    super.key,
    this.subtitle,
    this.title,
    this.showBack = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(112.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: const Color(0xFF282A50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title and Back Button (Right in RTL)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showBack)
                    IconButton(
                      onPressed: () => Navigator.maybePop(context),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 15.sp,
                      ),
                    ),
                  if (title != null)
                    Text(
                      title!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Madani Arabic',
                      ),
                    ),
                ],
              ),

              /// Logo (Left in RTL)
              Image.asset(
                "assets/photo/ticketLogo.png",
                height: 28.h,
                fit: BoxFit.contain,
              ),
            ],
          ),

          if (subtitle != null) ...[
            SizedBox(height: 8.h),
            Text(
              subtitle!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
