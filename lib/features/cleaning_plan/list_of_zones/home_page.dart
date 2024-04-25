import 'package:chistoplaner/utils/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        title: pageController.initialPage == 0
            ? const Text(
                'Рабочие зоны',
              )
            : const Text('Список дел'),
      ),
      body: PageView(
        controller: pageController,
        children: const [
          HousekeepingZonePage(),
          ToDoPage(),
        ],
      ),
      bottomNavigationBar: NavBarMain(pageController: pageController),
    );
  }
}

class ToDoPage extends StatelessWidget {
  const ToDoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ToDoDateUtil today = ToDoDateUtil(DateTime.now());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Список дел на ${today.formattedDate}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.custom(
                childrenDelegate: SliverChildListDelegate(
                  [
                    const ListTileToDoPage(
                      title: 'Помыть посуду',
                      zone: 'Кухня',
                    ),
                    const Divider(),
                    const ListTileToDoPage(
                      title: 'Убрать мусор',
                      zone: 'Кухня',
                    ),
                    const Divider(),
                    const ListTileToDoPage(
                      title: 'Очистить пол',
                      zone: 'Спальня',
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileToDoPage extends StatelessWidget {
  const ListTileToDoPage({
    super.key,
    required this.title,
    required this.zone,
  });

  final String title;
  final String zone;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 16.0),
        child: const Icon(Icons.check),
      ),
      onDismissed: (direction) {
        // TODO: implement
      },
      child: ListTile(
        title: Text(
          title,
        ),
        subtitle: Row(
          children: [
            const Flexible(
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(
                    Icons.star_border,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              zone,
            ),
          ],
        ),
        trailing: SizedBox(
          width: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              LinearProgressIndicator(
                color: Theme.of(context).colorScheme.error,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                value: 0.5,
              ),
              const Text(
                'По плану: 2 дня назад',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HousekeepingZonePage extends StatelessWidget {
  const HousekeepingZonePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const GridTileZonePage(
            title: 'Кухня',
            description: 'Ожидает уборки 2 дня',
            imageAsset: 'assets/images/home_icons/kuhnya.png',
          ),
          const GridTileZonePage(
            title: 'Спальня',
            description: 'Ожидает уборки 2 дня',
            imageAsset: 'assets/images/home_icons/spalnya.png',
          ),
          const GridTileZonePage(
            title: 'Офис',
            description: 'Ожидает уборки 2 дня',
            imageAsset: 'assets/images/home_icons/kabinet.png',
          ),
          GridTile(
            header: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Добавить...',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            footer: Padding(
              padding: const EdgeInsets.only(
                right: 6.0,
                bottom: 4.0,
              ),
              child: Text(
                '...зону уборки',
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Center(
                child: Icon(
                  Icons.add_home_work_sharp,
                  color: Colors.white,
                  size: 100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GridTileZonePage extends StatelessWidget {
  const GridTileZonePage({
    super.key,
    required this.title,
    required this.description,
    required this.imageAsset,
  });

  final String title;
  final String description;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 100,
      child: GridTile(
        header: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        footer: Container(
          // color: Theme.of(context).colorScheme.secondaryContainer,
          padding: const EdgeInsets.only(
            right: 6.0,
            bottom: 4.0,
          ),
          child: Text(
            description,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
            textAlign: TextAlign.right,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            imageAsset,
            fit: BoxFit.fill,
            width: 80,
            height: 80,
          ),
        ),
      ),
    );
  }
}

class NavBarMain extends StatefulWidget {
  const NavBarMain({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  State<NavBarMain> createState() => _NavBarMainState();
}

class _NavBarMainState extends State<NavBarMain> {
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(
          () {
            selectedPageIndex = index;
            widget._pageController.jumpToPage(index);
          },
        );
      },
      selectedIndex: selectedPageIndex,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.house_sharp),
          label: 'Рабочие зоны',
        ),
        NavigationDestination(
          icon: Icon(Icons.list_alt),
          label: 'Нужно сделать',
        ),
      ],
    );
  }
}
