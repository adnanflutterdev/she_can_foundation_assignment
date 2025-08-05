import 'package:flutter/material.dart';
import 'package:she_can_foundation/dummy_data/dummy_data.dart';
import 'package:she_can_foundation/utils/colors.dart';
import 'package:she_can_foundation/utils/text_style.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

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
                Text(
                  'Hello, ${userData['name']}!',
                  style: headingStyle
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Total Donation
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: container,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Total Donations',
                              style: TextStyle(
                                color: textTertiary,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '₹ ${userData['totalDonations']}',
                              style: TextStyle(
                                fontSize: 16,
                                color: primaryAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Your referal code
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: container,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Your Referral Code',
                              style: TextStyle(
                                color: textTertiary,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '${userData['referralCode']}',
                              style: TextStyle(
                                fontSize: 16,
                                color: primaryAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Rewards and unlockable
                SizedBox(height: 25),
                Text(
                  'Rewards & Unlockables',
                  style: TextStyle(
                    color: textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15),
                Wrap(
                  children: List.generate(rewards.length, (index) {
                    final reward = rewards[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Badge(
                        alignment: Alignment(0.7, -0.7),
                        backgroundColor: lockedOverlay,
                        label: Text('🔒', style: TextStyle(fontSize: 18)),
                        isLabelVisible: !reward['unlocked'],
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: reward['unlocked']
                                ? buttonPrimary
                                : lockedOverlay,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  reward['icon'],
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  reward['name'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: reward['unlocked']
                                        ? textPrimary
                                        : textSubtle,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
