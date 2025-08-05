import 'package:flutter/material.dart';
import 'package:she_can_foundation/dummy_data/dummy_data.dart';
import 'package:she_can_foundation/utils/colors.dart';
import 'package:she_can_foundation/utils/text_style.dart';

class AnnouncementsTab extends StatelessWidget {
  const AnnouncementsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: panelBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
        child: Container(
          decoration: BoxDecoration(
            color: cardBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text('Announcements', style: headingStyle),
                SizedBox(height: 15),
                Expanded(
                  child: ListView.builder(
                    itemCount: announcements.length,
                    itemBuilder: (context, index) {
                      final data = announcements[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 5,
                        ),
                        child: Card(
                          color: container,

                          child: ListTile(
                            title: Row(
                              children: [
                                Text(
                                  data['title'],
                                  style: TextStyle(
                                    color: primaryAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  data['date'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: textTertiary,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              data['content'],
                              style: TextStyle(color: textTertiary),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
