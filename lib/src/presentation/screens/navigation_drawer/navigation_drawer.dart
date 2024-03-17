
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:parity_cube/src/config/extension/size_extensions.dart';

import '../../../config/constants/size_constants.dart';
import '../../../utilities/helper/ui_helper.dart';
import '../../theme/theme_color.dart';
import 'drawer_item.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({super.key});

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).drawerTheme.backgroundColor?.withOpacity(0.5)
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () async{

                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_12.h, horizontal: Sizes.dimen_4.w),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: Sizes.dimen_12.w),
                                  child: const Icon(Icons.person, size: Sizes.dimen_42,)
                                ),
                                Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h, horizontal: Sizes.dimen_16.w),
                                      child: Text('Siddhant',
                                        style: Theme.of(context).textTheme.titleLarge,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                  )
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: Sizes.dimen_12.w),
                                    child: const Icon(Icons.close),
                                  ),
                                ),
                                UIHelper.horizontalSpaceMedium
                              ],
                            ),
                          ),
                        ),

                        Divider(color: AppColor.white.withOpacity(0.2)),

                        Expanded(
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                DrawerItem(
                                  title: 'Document',
                                  icon: Icons.access_time_outlined,
                                  onPressed: () {

                                  },
                                ),
                                DrawerItem(
                                  title: 'Cart',
                                  icon: Icons.card_travel,
                                  onPressed: () {

                                  },
                                ),
                                DrawerItem(
                                  title: 'Wishlist',
                                  icon: Icons.save,
                                  onPressed: () {

                                  },
                                )
                              ],
                            )
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
