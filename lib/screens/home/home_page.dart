part of '../../index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          appBarHeight: 100,
          child: Text(
            S.current.name,
            style: AppTextStyles.appNameTextStyle,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
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
                            // setState(() {
                            context.read<HomeBloc>().add(const ChangePage(0));
                            // });
                          },
                          child: BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
                              return Container(
                                width: size.width / 2.9,
                                height: size.height / 19,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: state.selectedPageIndex == 0
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Colors.transparent,
                                ),
                                child: Center(
                                  child: Text(S.current.planning,
                                      style: AppTextStyles.chipTextStyle.apply(
                                        color: state.selectedPageIndex == 0
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                      )),
                                ),
                              );
                            },
                          ),
                        ),
                        ZoomTapAnimation(
                          onTap: () {
                            // setState(() {
                            context.read<HomeBloc>().add(const ChangePage(1));
                            // });
                          },
                          child: BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
                              return Container(
                                width: size.width / 2.9,
                                height: size.height / 19,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: state.selectedPageIndex == 1
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Colors.transparent,
                                ),
                                child: Center(
                                  child: Text(
                                    S.current.note,
                                    style: AppTextStyles.chipTextStyle.apply(
                                      color: state.selectedPageIndex == 1
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 13,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return IndexedStack(
                    alignment: Alignment.topCenter,
                    index: state.selectedPageIndex,
                    children: const [
                      Tasks(),
                      Notes(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return state.selectedPageIndex == 1
                ? FloatingActionButton(
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const AddNoteScreen(),
                        ),
                      );
                    },
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
