part of '../../index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPageIndex = 0;

  changeScreen(int value) {
    selectedPageIndex = value;
  }

  @override
  void dispose() {
    TaskLocalDataSrc taskLocalDataSrc = TaskLocalDataSrc();
    taskLocalDataSrc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    int selectedScreen = selectedPageIndex;
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          appBarHeight: 100,
          child: Text(
            AppStrings.appName,
            style: AppTextStyles.appNameTextStyle,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width / 1.38,
                  height: size.height / 16.4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ZoomTapAnimation(
                        onTap: () {
                          setState(() {
                            changeScreen(0);
                          });
                        },
                        child: Container(
                          width: size.width / 2.9,
                          height: size.height / 19,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: selectedScreen == 0
                                ? Theme.of(context).colorScheme.onPrimary
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(AppStrings.planning,
                                style: AppTextStyles.chipTextStyle.apply(
                                  color: selectedScreen == 0
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.onPrimary,
                                )),
                          ),
                        ),
                      ),
                      ZoomTapAnimation(
                        onTap: () {
                          setState(() {
                            changeScreen(1);
                          });
                        },
                        child: Container(
                          width: size.width / 2.9,
                          height: size.height / 19,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: selectedScreen == 1
                                ? Theme.of(context).colorScheme.onPrimary
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              AppStrings.note,
                              style: AppTextStyles.chipTextStyle.apply(
                                color: selectedScreen == 1
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            IndexedStack(
              alignment: Alignment.center,
              index: selectedPageIndex,
              children: const [
                Tasks(),
                Text('Note'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
