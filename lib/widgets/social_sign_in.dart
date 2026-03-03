import 'package:flutter/material.dart';

class SocialSignIn extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback ontap;
  final Color? iconColor;
  const SocialSignIn({
    super.key,
    required this.text,
    this.iconColor,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: iconColor ?? Colors.red ),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
