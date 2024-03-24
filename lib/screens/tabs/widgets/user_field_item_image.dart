import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loan_xtimate/gen/assets.gen.dart';
import 'package:loan_xtimate/main.dart';

class UserFieldItemWithImage extends ConsumerWidget {
  final String fieldName;
  final String imagePath;
  final bool isCircle;
  const UserFieldItemWithImage(
      {Key? key,
      required this.fieldName,
      required this.imagePath,
      this.isCircle = true})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);

    return Column(
      children: [
        const Divider(thickness: 1, color: Color.fromARGB(255, 236, 240, 234)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        fieldName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.network(
                        Assets.icons.required.path,
                        width: 15,
                        height: 15,
                      ),
                    ],
                  ),
                  const Text("This will be displayed on your profile"),
                ],
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    if (isCircle)
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          imagePath,
                        ),
                        radius: 35,
                      )
                    else
                      Image.asset(
                        fit: BoxFit.cover,
                        width: 232,
                        height: 62,
                        imagePath,
                      ),
                    if (isCircle && _userProvider.isEditModeActive)
                      const SizedBox(
                        width: 338,
                      ),
                    if (!isCircle && _userProvider.isEditModeActive)
                      const SizedBox(
                        width: 176,
                      ),
                    if (_userProvider.isEditModeActive)
                      const InkWell(
                        child: Text(
                          "Delete",
                          style: TextStyle(
                            color: Color.fromRGBO(71, 84, 103, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    const SizedBox(
                      width: 16,
                    ),
                    if (_userProvider.isEditModeActive)
                      const InkWell(
                        child: Text(
                          "Update",
                          style: TextStyle(
                            color: Color.fromRGBO(105, 65, 198, 1.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (isCircle)
          const SizedBox(
            height: 20,
          ),
        if (!isCircle && _userProvider.isEditModeActive)
          const SizedBox(
            height: 20,
          ),
        Visibility(
          visible: !isCircle && _userProvider.isEditModeActive,
          child: const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 236, 240, 234),
          ),
        ),
      ],
    );
  }
}
