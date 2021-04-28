import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/blocs/auth/auth.dart';
import 'package:flutter_bloc_boilerplate/blocs/home/home.dart';
import 'package:flutter_bloc_boilerplate/models/response/users_response.dart';
import 'package:flutter_bloc_boilerplate/routes/routes.dart';
import 'package:flutter_bloc_boilerplate/shared/shared.dart';

class MeTab extends StatefulWidget {
  @override
  _MeTabState createState() => _MeTabState();
}

class _MeTabState extends State<MeTab> {
  Datum user;

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          bloc: BlocProvider.of<HomeBloc>(context),
          listener: (context, state) {
            if (state is HomeGetUserSuccessState) {
              setState(() {
                user = state.user;
              });
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          bloc: BlocProvider.of<AuthBloc>(context),
          listener: (context, state) {
            if (state is AuthSignoutState) {
              Navigator.pushNamed(context, RoutePath.auth);
            }
          },
        ),
      ],
      child: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    return Stack(
      children: [
        Container(
          height: SizeConfig().screenHeight * .5,
          child: Stack(
            children: [
              GradientBackground(
                needWave: false,
              ),
              _buildUserInfo(),
            ],
          ),
        ),
        _buildListItems(),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Me',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        _buildAvatar(),
        SizedBox(
          height: 10,
        ),
        Text(
          '${user?.email}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 10.0),
            Expanded(
              child: BorderButton(
                text: '100 follower',
                backgroundColor: Colors.white,
                onPressed: () {},
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: BorderButton(
                text: '100 following',
                backgroundColor: Colors.white,
                onPressed: () {},
              ),
            ),
            SizedBox(width: 10.0),
          ],
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 110,
            width: 110,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl:
                  user?.avatar ?? 'https://reqres.in/img/faces/1-image.jpg',
              placeholder: (context, url) => Image(
                image: AssetImage('assets/images/icon_success.png'),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Container(
            width: 110,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: hexToColor('#9A434343'),
            ),
            child: Text(
              'firstName' ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItems() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: SizeConfig().screenHeight * .42,
        decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              IconTitleItem(
                title: 'Cards',
                icon: 'assets/svgs/icon_discover.svg',
                onTap: () {
                  Navigator.pushNamed(context, RoutePath.cards);
                },
              ),
              IconTitleItem(
                title: 'Resource',
                icon: 'assets/svgs/icon_resource.svg',
                onTap: () {},
              ),
              IconTitleItem(
                title: 'Inbox',
                icon: 'assets/svgs/icon_inbox.svg',
                onTap: () {},
              ),
              SizedBox(
                height: 8,
              ),
              IconTitleItem(
                backgroundColor: ColorConstants.lightGray,
                paddingLeft: 16,
                paddingTop: 16,
                paddingRight: 16,
                padingBottom: 16,
                marginRight: 16,
                marginLeft: 5,
                drawablePadding: 10.0,
                title: 'sign out',
                icon: 'assets/svgs/icon_sign_out.svg',
                onTap: () {
                  BlocProvider.of<AuthBloc>(context).add(AuthSignoutEvent());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
