import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loan_xtimate/main.dart';

class EditModeButtons extends ConsumerWidget {
  const EditModeButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (_userProvider.isEditModeActive)
          OutlinedButton(
            onPressed: () {
              _userProvider.toggleEditMode();
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
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
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ),
        const SizedBox(width: 15),
        if (_userProvider.isEditModeActive)
          ElevatedButton(
            onPressed: () {
              if (!_userProvider.isEditModeActive) {
                _userProvider.toggleEditMode();
              }
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
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
            child: const Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
      ],
    );
  }
}
