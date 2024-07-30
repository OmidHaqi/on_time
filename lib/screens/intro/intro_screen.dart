part of '../../index.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

   int pageIndex =0;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IndexedStack(
                alignment: Alignment.center,
                index: pageIndex,
                children: [
                  IntoVC(
                    text: AppStrings.goal,
                    darkVC: Assets.images.svg.vcIntroOneDark,
                    lightVC: Assets.images.svg.vcIntroOneLight,
                  ),
                  IntoVC(
                    text: AppStrings.plan,
                    darkVC: Assets.images.svg.vcIntroTwoDark,
                    lightVC: Assets.images.svg.vcIntroTwoLight,
                  ),
                  IntoVC(
                    text: AppStrings.target,
                    darkVC: Assets.images.svg.vcIntroThreeDark,
                    lightVC: Assets.images.svg.vcIntroThreeLight,
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.large, vertical: AppDimens.large),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    onPressed: () {
                      if (pageIndex == 2) {
                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      } else {
                        setState(() {
                          pageIndex++;
                        });
                      }
                    },
                    child: Text(
                      pageIndex == 2 ? AppStrings.letsGo : AppStrings.well,
                      style: AppTextStyles.introScreenBtnTextStyle
                          .apply(color: Theme.of(context).colorScheme.surface),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
