import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/event.dart';
import 'about_clipper.dart';

class AboutBox extends StatelessWidget {
  const AboutBox({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AboutClipper(clipDistance: 16),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: event.getColorOfDay(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 4),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 2)),
              ),
              child: Text(
                'ABOUT',
                textAlign: TextAlign.start,
                style: GoogleFonts.chakraPetch(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              event.about.toUpperCase(),
              style: GoogleFonts.chakraPetch(
                fontSize: 11,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}