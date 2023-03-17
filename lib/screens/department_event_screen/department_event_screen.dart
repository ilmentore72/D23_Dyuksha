import 'package:d23_dyuksha/models/event.dart';
import 'package:flutter/material.dart';

import '../../widgets/cypberpunk_background_scaffold.dart';
import 'dark_button_group.dart';
import 'image_holder.dart';

class DepartmentEventScreen extends StatelessWidget {
  const DepartmentEventScreen({
    super.key,
    required this.dep,
  });
  final Department dep;
  @override
  Widget build(BuildContext context) {
    return CyberpunkBackgroundScaffold(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(child: SizedBox()),
            Expanded(
              flex: 2,
              child: ImageHolder(dep: dep),
            ),
            Expanded(
              child: DarkButtonGroup(),
            ),
          ],
        ),
      ),
    );
  }
}
