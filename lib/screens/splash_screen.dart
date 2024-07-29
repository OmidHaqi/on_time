part of '../index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late bool _isFirstRun;
  
  void _checkFirstRun() async {
    bool ifr = await IsFirstRun.isFirstRun();
    setState(() {
      _isFirstRun = ifr;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkFirstRun();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Future.delayed(
          const Duration(seconds: 2),
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  _isFirstRun ? const IntroScreen() : const HomePage(),
                  // const IntroScreen()
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            AppStrings.appName,
            style: AppTextStyles.splashScreenTextStyle.apply(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ).animate().fadeIn(
                duration: const Duration(
                  milliseconds: 1000,
                ),
              ),
        ),
      ),
    );
  }
}
