import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:vibe_match/core/theme/app_colors.dart';
import 'package:vibe_match/models/question_model.dart';
import 'package:vibe_match/models/user_model.dart';
import 'package:vibe_match/presentation/widgets/custom_radio_group.dart';

import '../models/option_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    children: [
                      const Gap(60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Stroll Bonfire",
                            style: TextStyle(
                              fontSize: 34,
                              color: AppColors.lightPurple,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: AppColors.black.withOpacity(0.4),
                                  offset: Offset(-1, 2),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                          const Gap(3),
                          Text(
                            String.fromCharCode(
                              Icons.keyboard_arrow_down_outlined.codePoint,
                            ),
                            style: TextStyle(
                              fontFamily:
                                  Icons.keyboard_arrow_down_outlined.fontFamily,
                              fontSize: 22,
                              color: AppColors.lightPurple,
                              shadows: [
                                Shadow(
                                  color: AppColors.black.withOpacity(0.15),
                                  offset: Offset(0, 2),
                                  blurRadius: 1.5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            String.fromCharCode(Icons.timer_sharp.codePoint),
                            style: TextStyle(
                              fontFamily: Icons.timer_sharp.fontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                              shadows: [
                                Shadow(
                                  color: AppColors.black.withOpacity(0.15),
                                  offset: Offset(0, 2),
                                  blurRadius: 1.5,
                                ),
                              ],
                            ),
                          ),
                          const Gap(1),
                          Text(
                            "22h 00m",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                              shadows: [
                                Shadow(
                                  color: AppColors.black.withOpacity(0.15),
                                  offset: Offset(0, 2),
                                  blurRadius: 1.5,
                                ),
                              ],
                            ),
                          ),

                          const Gap(10),

                          Text(
                            String.fromCharCode(
                              Icons.person_2_outlined.codePoint,
                            ),
                            style: TextStyle(
                              fontFamily: Icons.person_2_outlined.fontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                              shadows: [
                                Shadow(
                                  color: AppColors.black.withOpacity(0.15),
                                  offset: Offset(0, 2),
                                  blurRadius: 1.5,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            user.mutualCount.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                              shadows: [
                                Shadow(
                                  color: AppColors.black.withOpacity(0.15),
                                  offset: Offset(0, 2),
                                  blurRadius: 1.5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.black_12,
                                    width: 8,
                                  ),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(user.profile),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Gap(10),
                                    Text(
                                      "${user.name}, ${user.age}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.off_white,
                                        height: 0,
                                      ),
                                    ),
                                    const Gap(8),
                                    Text(
                                      question.question,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.off_white,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(8),
                        Text(
                          question.answer,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.lightPurple,
                            height: 0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),

                        const Gap(16),

                        CustomRadioGroup(
                          radioButtons: question.options,
                          onValueChanged: (value) {},
                        ),
                        const Gap(20),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Pick your option. \nSee who has a similar mind.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.gray_14,
                                  height: 1.1,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.purple,
                                  width: 3,
                                ),
                                shape: BoxShape.circle,
                              ),
                              height: 48,
                              width: 48,
                              child: SvgPicture.asset("assets/images/mic.svg"),
                            ),
                            const Gap(8),
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.purple,
                                shape: BoxShape.circle,
                              ),
                              height: 48,
                              width: 48,
                              child: Icon(Icons.arrow_forward, size: 30),
                            ),
                          ],
                        ),

                        const Gap(16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
