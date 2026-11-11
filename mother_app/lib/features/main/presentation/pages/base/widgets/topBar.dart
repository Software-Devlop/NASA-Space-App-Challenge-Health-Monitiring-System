import 'package:mother_app/core/presentation/globalWidgets/custElevatedButton.dart';
import 'package:mother_app/core/statics/extensions.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(color: context.colors.primary),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                Text(
                  "User Name",
                  style: context.text.labelMedium!.copyWith(
                    color: context.colors.onPrimary,
                  ),
                ),
                Text(
                  "Mission Day",
                  style: context.text.labelMedium!.copyWith(
                    color: context.colors.onPrimary.withAlpha(190),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "08:02 UTC",
                  style: context.text.labelMedium!.copyWith(
                    color: context.colors.onPrimary.withAlpha(190),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                CustElevatedButton(
                  bgColor: context.colors.surface,
                  onPressed: () {},
                  child: Row(
                    spacing: 7,
                    children: [
                      Icon(
                        Icons.cloud_sync_rounded,
                        color: context.colors.primary,
                        size: 20,
                      ),
                      Text(
                        "Last Sync 07:10 UTC",
                        style: context.text.labelSmall!.copyWith(
                          color: context.colors.primary,
                          // fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),

                // CustElevatedButton(
                //   bgColor: context.colors.surface,
                //   onPressed: () {},
                //   child: Text(
                //     "Simulated data",
                //     style: context.text.labelSmall,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
