import 'package:flutter/material.dart';
import '../../models/option_model.dart';
import 'custom_radio_button.dart';

class CustomRadioGroup extends StatefulWidget {
  final void Function(OptionModel value)? onValueChanged;
  final List<OptionModel> radioButtons;

  const CustomRadioGroup({
    Key? key,
    this.onValueChanged,
    required this.radioButtons,
  }) : super(key: key);

  @override
  State<CustomRadioGroup> createState() => _CustomRadioGroupState();
}

class _CustomRadioGroupState extends State<CustomRadioGroup> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = null;
  }

  @override
  void didUpdateWidget(covariant CustomRadioGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.radioButtons != oldWidget.radioButtons) {
      setState(() {
        selectedIndex = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(0),
      itemCount: widget.radioButtons.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        mainAxisExtent: 60,
      ),
      itemBuilder: (context, index) {
        final radioButton = widget.radioButtons[index];
        final isActive = selectedIndex == index;

        return CustomRadioButton(
          isActive: isActive,
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            widget.onValueChanged?.call(radioButton);
          },
          value: radioButton,
        );
      },
    )
    ;
  }
}
