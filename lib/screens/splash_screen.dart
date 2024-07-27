part of '../index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Future.delayed(
          const Duration(seconds: 2),
          () => Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (_) => const HomePage(),
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
