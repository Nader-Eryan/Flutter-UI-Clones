// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:jobfinder_ui/src/components/custom_appbar.dart';
import 'package:jobfinder_ui/src/components/searchbox.dart';

import 'package:jobfinder_ui/src/components/verticalbar_decoration.dart';
import 'package:jobfinder_ui/src/data/job_data.dart';
import 'package:jobfinder_ui/src/theme/colors.dart';

import '../components/category_icon.dart';
import '../components/recent_job_card.dart';
import '../data/category_data.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline1;
    return Scaffold(
      appBar: CustomAppBar(
        prefixIcon: Icons.grid_view_rounded,
        title: 'Hi, Gideon',
        suffixIcon: IconlyBold.notification,
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SearchBox(),
              const SizedBox(height: 10),
              VerticalBarDecoration(title: 'Tips for you'),
              const SizedBox(height: 10),
              Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'How to create a\nperfect cv for you',
                          style: textStyle!
                              .copyWith(fontSize: 20, color: Colors.grey[50]),
                        ),
                        const SizedBox(height: 10),
                        MaterialButton(
                          onPressed: () {},
                          color: Colors.white,
                          child: Text(
                            'Details',
                            style: textStyle.copyWith(
                                fontSize: 17,
                                color: primaryColor.withOpacity(0.8)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: -1,
                    right: 25,
                    child: CircleAvatar(
                      backgroundColor: primaryColor.withOpacity(0.9),
                      radius: 65,
                    ),
                  ),
                  Positioned(
                    bottom: -14,
                    right: 0,
                    // alignment: Alignment.bottomRight,
                    child: Icon(
                      IconlyBold.profile,
                      color: Colors.grey.withOpacity(0.5),
                      size: 180,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 20),
              VerticalBarDecoration(title: 'Category'),
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryIcons(
                      iconColor: categoryData[index].iconColor,
                      title: categoryData[index].category,
                      icon: categoryData[index].icon,
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              VerticalBarDecoration(title: 'Recent Jobs'),
              const SizedBox(height: 20),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                shrinkWrap: true,
                itemCount: jobsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return RecentJobCard(
                    id: jobsData[index].id,
                    type: jobsData[index].type,
                    title: jobsData[index].title,
                    isSaved: jobsData[index].isSaved,
                    location: jobsData[index].location,
                    imageUrl: jobsData[index].imageUrl,
                    imageBackground: jobsData[index].imageBackground,
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ]),
    );
  }
}