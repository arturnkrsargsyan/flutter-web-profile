import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loanxtimate/consts/app_colors.dart';
import 'package:loanxtimate/consts/app_padding.dart';
import 'package:loanxtimate/main.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TabAppBar extends HookConsumerWidget {
  final String title;
  final String subtitle;
  const TabAppBar({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _pageProvider = ref.watch(pageProvider);

    final width = MediaQuery.of(context).size.width;
    final breakpoint = ResponsiveBreakpoints.of(context).breakpoint;

    final tabAppbarWidthState = useState<double>(600);
    final gapCountState = useState<int>(0);

    if (width - 200 <= tabAppbarWidthState.value + 30) {
      tabAppbarWidthState.value -= 25;
    } else if (tabAppbarWidthState.value < 600) {
      tabAppbarWidthState.value += 25;
    }

    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth <= tabAppbarWidthState.value + 180) {
        Future.delayed(
          Duration.zero,
          () {
            tabAppbarWidthState.value -= 25;
            gapCountState.value++;
          },
        );
      } else if (gapCountState.value > 0 &&
          (constrains.maxWidth > tabAppbarWidthState.value + 120)) {
        Future.delayed(Duration.zero, () {
          tabAppbarWidthState.value += 25;
          gapCountState.value--;
        });
      }
      return SizedBox(
        width: breakpoint.name == DESKTOP
            ? width - AppPadding.openSideMenuSize
            : width,
        child: Row(
          children: [
            SizedBox(
              width: tabAppbarWidthState.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 4),
                    child: Text(
                      title,
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color.fromRGBO(71, 84, 103, 1.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            if (_pageProvider.isEditModeActive)
              OutlinedButton(
                onPressed: () {
                  _pageProvider.toggleEditMode();
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            const SizedBox(width: 15),
            ElevatedButton(
              onPressed: () {
                if (!_pageProvider.isEditModeActive) {
                  _pageProvider.toggleEditMode();
                }
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                      horizontal: _pageProvider.isEditModeActive ? 14 : 30,
                      vertical: 20),
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(127, 86, 217, 1),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Text(
                _pageProvider.isEditModeActive ? "Save" : "Edit",
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
