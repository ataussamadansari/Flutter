import 'package:flutter/material.dart';
import 'package:navigation_bar/model/destination.dart';
import 'package:navigation_bar/screens/main/widgets/DestinationView.dart';

class MainScreen extends StatefulWidget
{
    const MainScreen({super.key});

    @override
    State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin<MainScreen>
{
    static const List<Destination> allDestinations = <Destination>[
        Destination(0, 'Teal', Icons.home, Icons.home_outlined, Colors.teal),
        Destination(1, 'Cyan', Icons.business, Icons.business, Colors.cyan),
        Destination(2, 'Orange', Icons.school, Icons.school, Colors.orange),
        Destination(3, 'Blue', Icons.flight,Icons.flight, Colors.blue)
    ];

    late final List<GlobalKey<NavigatorState>> navigatorKeys;
    late final List<GlobalKey> destinationKeys;
    late final List<AnimationController> destinationFaders;
    late final List<Widget> destinationViews;

    int selectedIndex = 0;

    AnimationController buildFaderController() 
    {
        return AnimationController(vsync: this, duration: const Duration(milliseconds: 300))
        ..addStatusListener((AnimationStatus status)
            {
                if (status.isDismissed) 
                {
                    setState(() {}); // Rebuild unselected destinations offstage.
                }
            }
        );
    }

    @override
    void initState() 
    {
        super.initState();

        navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
            allDestinations.length,
            (int index) => GlobalKey()
        ).toList();

        destinationFaders = List<AnimationController>.generate(
            allDestinations.length,
            (int index) => buildFaderController()
        ).toList();
        destinationFaders[selectedIndex].value = 1.0;

        final CurveTween tween = CurveTween(curve: Curves.fastOutSlowIn);
        destinationViews = allDestinations.map<Widget>((Destination destination)
            {
                return FadeTransition(
                    opacity: destinationFaders[destination.index].drive(tween),
                    child: DestinationView(
                        destination: destination,
                        navigatorKey: navigatorKeys[destination.index]
                    )
                );
            }
        ).toList();
    }

    @override
    void dispose() 
    {
        for (final AnimationController controller in destinationFaders)
        {
            controller.dispose();
        }
        super.dispose();
    }

    @override
    Widget build(BuildContext context)
    {
        return NavigatorPopHandler(
            onPop: ()
            {
                final NavigatorState navigator = navigatorKeys[selectedIndex].currentState!;
                navigator.pop();
            },
            child: Scaffold(
                body: SafeArea(
                    top: false,
                    child: Stack(
                        fit: StackFit.expand,
                        children: allDestinations.map((Destination destination)
                            {
                                final int index = destination.index;
                                final Widget view = destinationViews[index];
                                if (index == selectedIndex) 
                                {
                                    destinationFaders[index].forward();
                                    return Offstage(offstage: false, child: view);
                                }
                                else 
                                {
                                    destinationFaders[index].reverse();
                                    if (destinationFaders[index].isAnimating) 
                                    {
                                        return IgnorePointer(child: view);
                                    }
                                    return Offstage(child: view);
                                }
                            }
                        ).toList()
                    )
                ),
                bottomNavigationBar: NavigationBar(
                    selectedIndex: selectedIndex,
                    // surfaceTintColor: Colors.red,
                    indicatorColor: allDestinations[selectedIndex].color.shade100,
                    onDestinationSelected: (int index)
                    {
                        setState(() {
                                selectedIndex = index;
                        });
                    },
                    destinations: allDestinations.map<NavigationDestination>((Destination destination)
                        {
                            return NavigationDestination(
                                tooltip: "Samad",
                                icon: Icon(destination.unselectedIcon, color: destination.color),
                                label: destination.title,
                                selectedIcon: Icon(destination.icon, color: destination.color),
                            );
                        }
                    ).toList()
                )
            )
        );
    }
}
