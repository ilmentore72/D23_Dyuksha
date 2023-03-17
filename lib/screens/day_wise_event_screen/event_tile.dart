import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/event.dart';
import 'clippers.dart';

class EventTile extends StatelessWidget {
  final Event event;
  const EventTile({
    required this.event,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Uri url = Uri.parse(event.registrationURL..toString());
        try {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } catch (e) {
          throw 'Could not launch $url $e';
        }
      },
      child: ClipPath(
        clipper: EventTileClipper(),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6.0),
          height: 80.0,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
          ),
          child: Row(
            children: [
              ClipPath(
                clipper: EventTileImageClipper(),
                child: SizedBox(
                  height: 80.0,
                  width: 80.0,
                  child: Image.network(
                    event.imageURL,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 6.0),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        event.name,
                        style: GoogleFonts.chakraPetch(
                          fontWeight: FontWeight.w300,
                          fontSize: 11.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Text(
                            event.eventCategory,
                            style: GoogleFonts.chakraPetch(
                              fontWeight: FontWeight.w300,
                              fontSize: 11.0,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 30.0, left: 25.0),
                            child: Text(
                              event.timeOfDay,
                              style: GoogleFonts.chakraPetch(
                                fontWeight: FontWeight.w300,
                                fontSize: 9.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
