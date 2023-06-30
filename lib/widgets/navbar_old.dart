import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:husk/pages/notification_dashboard/bloc/notification_dashboard_bloc.dart';

class NavBarOld extends StatelessWidget {
  const NavBarOld({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
          // color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .backgroundColor,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.red,
                        offset: Offset(0, -10),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: IconButton(
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .selectedItemColor,
                  icon: Icon(
                    Icons.home_rounded,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedItemColor,
                    size: 32,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ),
              Flexible(
                child: IconButton(
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .selectedItemColor,
                  iconSize: 30,
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedItemColor,
                    size: 24,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: FloatingActionButton(
                      backgroundColor: context
                              .read<NotificationDashboardBloc>()
                              .state
                              .selectedNotifications
                              .isEmpty
                          ? Colors.blue
                          : Colors.red,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              IconButton(
                color: Colors.transparent,
                icon: const Icon(
                  Icons.settings,
                  color: Color(0xFF9299A1),
                  size: 24,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
              IconButton(
                color: Colors.transparent,
                icon: const Icon(
                  Icons.person,
                  color: Color(0xFF9299A1),
                  size: 24,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
