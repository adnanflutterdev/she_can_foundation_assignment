import 'package:flutter/material.dart';
import 'package:she_can_foundation/dummy_data/dummy_data.dart';
import 'package:she_can_foundation/utils/colors.dart';
import 'package:she_can_foundation/utils/text_style.dart';

class LeaderboardTab extends StatelessWidget {
  const LeaderboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: panelBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
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
                Text('Leaderboard', style: headingStyle),
                SizedBox(height: 15),
                Expanded(
                  child: ListView.builder(
                    itemCount: leaderboardData.length,
                    itemBuilder: (context, index) {
                      final data = leaderboardData[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(15),
                          side: BorderSide(
                            width: 2,
                            color: index == 0
                                ? gold
                                : index == 1
                                ? silver
                                : index == 2
                                ? bronze
                                : container,
                          ),
                        ),

                        color: index == 0
                            ? goldRankBackground
                            : index == 1
                            ? silverRankBackground
                            : index == 2
                            ? bronzeRankBackground
                            : container,
                        child: ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '#${index + 1}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: (index >= 0 && index < 3)
                                      ? gold
                                      : textSubtle,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: data['color'],
                                ),
                                child: Center(
                                  child: Text(
                                    data['avatar'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: textPrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          title: Text(
                            data['name'],
                            style: TextStyle(
                              color: textPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            'Total Score: ${data['score']}',
                            style: TextStyle(color: textTertiary),
                          ),
                          trailing: (index >= 0 && index < 3)
                              ? Text('🏆', style: TextStyle(fontSize: 20))
                              : null,
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
