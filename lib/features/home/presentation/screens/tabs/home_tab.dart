import 'package:auvnet_internship_assessment/core/theme/app_text_styles.dart';
import 'package:auvnet_internship_assessment/core/utils/extensions.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/advertising_entity.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/services_entity.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/bloc/home_bloc.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Widget _customAppBar() {
    return Stack(
      alignment: Alignment.centerLeft,

      children: [
        Container(
          height: context.screenHeight * 0.20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [Color(0xFFFFDE59), Color(0xFF8900FE)],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deliver to",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Al Satwa, 81A Street",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Hi Hepa!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/user.png'),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _customAppBar(),

          BlocSelector<HomeBloc, HomeState, List<ServicesEntity>>(
            selector: (state) {
              if (state is HomeLoaded) {
                return state.services;
              }
              return [];
            },
            builder: (context, servicing) {
              if (servicing.isEmpty) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: servicing.length,
                  itemBuilder: (context, index) {
                    final ad = servicing[index];
                    return Container(
                      width: context.screenWidth / 3,
                      height: 100,
                      alignment: Alignment.center,

                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.network(
                        scale: 0.5,
                        ad.imgUrl,
                        alignment: Alignment.center,
                        height: 70,
                        width: 85,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
