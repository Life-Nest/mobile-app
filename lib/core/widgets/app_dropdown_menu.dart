import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropdownMenu extends ConsumerStatefulWidget {
  const AppDropdownMenu({
    super.key,
    required this.items,
    required this.saveFunction,
  });

  final Map<String, int> items;
  final void Function(String value) saveFunction;

  @override
  ConsumerState<AppDropdownMenu> createState() => _AppDropdownMenuState();
}

class _AppDropdownMenuState extends ConsumerState<AppDropdownMenu> {
  var currentValue = 0;

  @override
  Widget build(BuildContext context) {
    // final provider = ref.watch(authProvider.notifier);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.h),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: Colors.black,
          width: 1.2,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
          value: currentValue,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              currentValue = value ?? 0;
            });
          },
          items: widget.items.entries
              .map(
                (item) => DropdownMenuItem(
                  value: item.value,
                  child: Text(item.key),
                ),
              )
              .toList(),
          onSaved: (value) {
            String valueText = widget.items.keys.toList()[value!];
            widget.saveFunction(valueText);
          },
          decoration: const InputDecoration(border: InputBorder.none),
        ),
      ),
    );
  }
}
