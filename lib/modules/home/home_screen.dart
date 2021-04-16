import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/blocs/blocs.dart';
import 'package:flutter_bloc_boilerplate/shared/shared.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'tabs/tabs.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainTabs currentTab = MainTabs.home;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    return Scaffold(
      body: Center(
        child: _buildContent(currentTab),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildNavigationBarItem(
            "Home",
            MainTabs.home == currentTab
                ? "icon_home_activited.svg"
                : "icon_home.svg",
          ),
          _buildNavigationBarItem(
            "Discover",
            MainTabs.discover == currentTab
                ? "icon_discover_activited.svg"
                : "icon_discover.svg",
          ),
          _buildNavigationBarItem(
            "Resource",
            "icon_resource.svg",
          ),
          _buildNavigationBarItem(
            "Inbox",
            MainTabs.inbox == currentTab
                ? "icon_inbox_activited.svg"
                : "icon_inbox.svg",
          ),
          _buildNavigationBarItem(
            "Me",
            MainTabs.me == currentTab ? "icon_me_activited.svg" : "icon_me.svg",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: ColorConstants.black,
        currentIndex: _getCurrentIndex(currentTab),
        selectedItemColor: ColorConstants.black,
        selectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        onTap: (index) => setState(() {
          _switchTab(index);
        }),
      ),
    );
  }

  Widget _buildContent(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return MainTab();
      case MainTabs.discover:
        return DiscoverTab();
      case MainTabs.resource:
        return ResourceTab();
      case MainTabs.inbox:
        return InboxTab();
      case MainTabs.me:
        return MeTab();
      default:
        return MainTab();
    }
  }

  BottomNavigationBarItem _buildNavigationBarItem(String label, String svg) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svgs/$svg'),
      label: label,
    );
  }

  int _getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return 0;
      case MainTabs.discover:
        return 1;
      case MainTabs.resource:
        return 2;
      case MainTabs.inbox:
        return 3;
      case MainTabs.me:
        return 4;
      default:
        return 0;
    }
  }

  MainTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        return MainTabs.home;
      case 1:
        return MainTabs.discover;
      case 2:
        return MainTabs.resource;
      case 3:
        return MainTabs.inbox;
      case 4:
        return MainTabs.me;
      default:
        return MainTabs.home;
    }
  }

  void _switchTab(index) {
    var tab = _getCurrentTab(index);
    currentTab = tab;
  }

  @override
  void dispose() {
    BlocProvider.of<HomeBloc>(context).close();
    super.dispose();
  }
}
