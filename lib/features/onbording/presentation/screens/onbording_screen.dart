import 'package:daily_list/core/constants/app_assets.dart';
import 'package:daily_list/core/constants/app_colors.dart';
import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:daily_list/features/auth/presentation/screens/login_screen.dart.dart';
import 'package:daily_list/shader/widgets/app_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../shader/widgets/app_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final pages = [
    OnboardPage(
      title: "plan_your_day",
      description: "plan_description",
      image: AppAssets.onbording1,
    ),
    OnboardPage(
      title: "stay_focused",
      description: "stay_focused_description",
      image: AppAssets.onbording2,
    ),
    OnboardPage(
      title: "lets_do_it_together",
      description: "collaboration_feature",
      image: AppAssets.onbording3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.natural100,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) => pages[index],
          ),
          if (currentPage == pages.length - 2 ||
              currentPage == pages.length - 3)
            Positioned(
              right: 20,
              top: 100,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Row(
                  spacing: 8,
                  children: [
                    AppText(
                      text: 'skip',
                      color: AppColors.primary400,
                      fontWeight: 600,
                    ),
                    SvgPicture.asset(
                      AppAssets.arrowRight,
                      width: 12,
                      height: 12,
                      fit: BoxFit.cover,
                      color: AppColors.primary400,
                    ),
                  ],
                ),
              ),
            ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pages.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      height: 8,
                      width: currentPage == index ? 82 : 8,
                      decoration: BoxDecoration(
                        color: currentPage == index
                            ? AppColors.primary400
                            : AppColors.natural400,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (currentPage == pages.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: currentPage == pages.length - 1
                      ? Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.primary400,
                          ),
                          child: Row(
                            spacing: 8,
                            children: [
                              AppText(
                                text: 'get_started',
                                fontWeight: 600,
                                color: AppColors.natural100,
                              ),
                              SvgPicture.asset(
                                AppAssets.arrowRight,
                                width: 16,
                                height: 16,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.primary400,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            AppAssets.arrowRight,
                            width: 24,
                            height: 24,
                            fit: BoxFit.cover,
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

class OnboardPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnboardPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppPaddingWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 360,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            32.g,
            AppText(
              textAlign: TextAlign.center,
              softWrap: true,
              maxLines: 2,
              text: title,
              fontSize: 36,
              fontWeight: 600,
            ),
            8.g,
            AppText(
              softWrap: true,
              text: description,
              textAlign: TextAlign.center,
              maxLines: 3,
              color: AppColors.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
