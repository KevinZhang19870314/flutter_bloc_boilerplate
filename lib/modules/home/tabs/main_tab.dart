import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/blocs/home/home.dart';
import 'package:flutter_bloc_boilerplate/models/response/users_response.dart';
import 'package:flutter_bloc_boilerplate/shared/shared.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MainTab extends StatefulWidget {
  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  List<Datum> users = [];

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeLoadUsersEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      bloc: BlocProvider.of<HomeBloc>(context),
      listener: (context, state) {
        if (state is HomeLoadUsersSuccessState) {
          setState(() {
            users = state.users;
          });
        }

        if (state is HomeLoadUsersFailState) {
          CommonWidget.toast(state.message);
        }
      },
      child: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    return Scaffold(
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) => new Container(
          color: ColorConstants.lightGray,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('${users[index].lastName} ${users[index].firstName}'),
              CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: users[index].avatar ??
                    'https://reqres.in/img/faces/1-image.jpg',
                placeholder: (context, url) => Image(
                  image: AssetImage('assets/images/icon_success.png'),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Text('${users[index].email}'),
            ],
          ),
        ),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 3 : 2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
