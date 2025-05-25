import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/theme/app_colors.dart';
import '../../models/option_model.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;
  final OptionModel value;

  CustomRadioButton({
    Key? key,
    required this.isActive,
    required this.onTap,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive ? AppColors.purple : AppColors.gray,
            width: 1.5,
          ),
          color: AppColors.gray,
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isActive ? AppColors.purple : AppColors.gray_12, width: 1.5
                ),
                color: isActive ? AppColors.purple : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  value.option,
                  style: TextStyle(
                    fontSize: 14,
                    color: isActive ? AppColors.white : AppColors.gray_12,
                    height: 1,
                    fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Gap(10),
            Expanded(
              child: Text(
                value.description,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.gray_12 ,
                  height: 1.1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
