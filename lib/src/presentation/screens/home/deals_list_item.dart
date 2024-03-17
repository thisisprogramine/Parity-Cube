
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:parity_cube/src/config/constants/size_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:parity_cube/src/presentation/theme/theme_color.dart';
import 'package:parity_cube/src/utilities/helper/ui_helper.dart';
import '../../../domain/entities/deals/deals_entity.dart';

class DealsListItem extends StatelessWidget {
  final DealEntity deal;
  const DealsListItem({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: Sizes.dimen_12.w, vertical: Sizes.dimen_4.h),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)
          )
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_12.w),
        height: ScreenUtil().screenHeight * 0.24,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpaceMedium,
            Expanded(
              flex: 7,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    width: ScreenUtil().screenHeight * 0.10,
                    height: ScreenUtil().screenHeight * 0.10,
                    imageUrl: deal.imageMedium ?? '',
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Container(
                          width: ScreenUtil().screenHeight * 0.10,
                          height: ScreenUtil().screenHeight * 0.10,
                          color: AppColor.grey,
                        ),
                    errorWidget: (context, url, error) => Container(
                        width: ScreenUtil().screenHeight * 0.10,
                        height: ScreenUtil().screenHeight * 0.10,
                      color: AppColor.grey,
                        child: const Icon(Icons.error)
                    ),
                  ),
                  UIHelper.horizontalSpaceMedium,
                  Text(deal.storeName ?? 'Not Available',
                    style: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  const Icon(Icons.thumb_up_alt_outlined, color: AppColor.grey,),
                  UIHelper.horizontalSpaceSmall,
                  Text('0',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  UIHelper.horizontalSpaceMedium,
                  const Icon(Icons.comment_rounded, color: AppColor.grey,),
                  UIHelper.horizontalSpaceSmall,
                  Text(deal.commentsCount != null ? deal.commentsCount.toString() : '0',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  UIHelper.horizontalSpaceMedium,
                  const Icon(Icons.access_time_outlined, color: AppColor.grey,),
                  UIHelper.horizontalSpaceSmall,
                  Text(DateFormat('dd MMM yyyy').format(deal.createdAt ?? DateTime.now()),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {

                          },
                          child: Text('At Other', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: AppColor.primary),),
                        ),
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
