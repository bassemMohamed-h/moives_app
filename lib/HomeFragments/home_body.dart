import 'package:flutter/material.dart';
import 'package:moives_app/Screens/list_view_screen.dart';
import 'package:moives_app/ViewModel/WatchListVM.dart';
import 'package:provider/provider.dart';

import '../ViewModel/HomeVM.dart';
import '../screens/Widgets.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
        create: (context) => HomeBodyVM(),
        builder: (context, child) {
          //dnt remove this to know which movie is in watchlist
          // ignore: unused_local_variable
          WatchListVM watchListProvider = Provider.of(context);
          HomeBodyVM homeProvider = Provider.of(context);
          return homeProvider.isPopularLoading || homeProvider.isTopRatedLoading
              ? Widgets.loading(screenHeight, screenWidth)
              : SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //most latest movie
                      Widgets.movieDetails(screenHeight, screenWidth,
                          homeProvider.popular![0]!, homeProvider, true),
                      const SizedBox(),
                      //latest
                      Container(
                        height: screenHeight * .5,
                        child: OurListView(
                            'New Releases', false, homeProvider.popular!),
                      ),
                      //space
                      Container(
                        height: screenHeight * .03,
                      ),
                      //top rated
                      Container(
                        height: screenHeight * .5,
                        child: OurListView(
                            'Recommended', true, homeProvider.topRated!),
                      ),
                      //space
                      Container(
                        height: screenHeight * .03,
                      ),
                    ],
                  ),
                );
        });
  }
}
