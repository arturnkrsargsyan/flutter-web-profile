import 'package:flutter/material.dart';
import 'package:loanxtimate/consts/app_colors.dart';
import 'package:loanxtimate/gen/assets.gen.dart';
import 'package:loanxtimate/logger.dart';

class CustomBanner extends StatelessWidget {
  final double width;
  final double margin;
  const CustomBanner({
    super.key,
    this.width = 248,
    this.margin = 12,
  });

  @override
  Widget build(BuildContext context) {
    logger.info('CustomBanner $width');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.white2,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: margin),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'New features available!',
                    style: TextStyle(
                      color: AppColors.announcement,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 0.10,
                    ),
                  ),
                  Icon(
                    Icons.close,
                    color: AppColors.greyTextInput,
                    size: 16,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: SizedBox(
                  child: Text(
                    maxLines: 2,
                    'Check out the new dashboard view. Pages now load faster. ',
                    style: TextStyle(
                      color: AppColors.subTitle,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                height: 136,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: Image.asset(Assets.images.image.path).image,
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: AppColors.sideMenuBorderColor,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      // GoRouter.of(context).go('/dashboard');
                    },
                    child: const Text(
                      'Dismiss',
                      style: TextStyle(
                        color: AppColors.subTitle,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    onTap: () {
                      // GoRouter.of(context).go('/dashboard');
                    },
                    child: const Text(
                      'What’s new?',
                      style: TextStyle(
                        color: AppColors.question,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 20 / 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
