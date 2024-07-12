
import 'package:flutter/material.dart';

class ThemeSwitch extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onChanged;

  const ThemeSwitch({
    super.key,
    required this.isDarkMode,
    required this.onChanged
  });

  @override
  build(context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
            Icons.wb_sunny,
            color: isDarkMode
                ? Colors.grey
                : Colors.amber
        ),
        Switch(
            value: isDarkMode,
            onChanged: onChanged,
            activeColor: Colors.amber,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey.withOpacity(.5)
        ),
        Icon(
            Icons.nights_stay,
            color: isDarkMode
                ? Colors.amber
                : Colors.grey
        )
      ]
  );
}
