import 'package:flutter/material.dart';
import 'package:loanxtimate/consts/app_colors.dart';
import 'package:loanxtimate/gen/assets.gen.dart';

class UserItem extends StatelessWidget {
  final bool isDesktop;

  const UserItem({this.isDesktop = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          const Divider(
            endIndent: 8,
            indent: 8,
          ),
          Container(
            color: AppColors.white,
            height: 40,
            margin: const EdgeInsets.only(top: 24, bottom: 24),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(Assets.images.image.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: const EdgeInsets.only(right: 12, left: 18),
                ),
                if (isDesktop)
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olivia Rhye',
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'olivia@untitledui.com',
                        style: TextStyle(
                          color: AppColors.subTitle,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
