import 'package:flutter/material.dart';

import '../../../utils/extensions/app_localization_extension.dart';
import '../../../utils/extensions/context_extension.dart';
import 'open_status_widget.dart';
import 'stars_rating_widget.dart';

class RestaurantListTileWidget extends StatelessWidget {
  const RestaurantListTileWidget({
    super.key,
    required this.image,
    required this.name,
    this.rating,
    this.price,
    this.isOpen = false,
    this.tags,
    this.onTap,
  });

  final ImageProvider image;
  final String name;
  final double? rating;
  final String? price;
  final bool isOpen;
  final List<String>? tags;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 16 * 6 + 8 + 10,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Material(
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                  child: Ink(
                    height: 16 * 6,
                    width: 16 * 6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        maxLines: 2,
                        style: context.appTypography.loraRegularTitle,
                      ),
                      SizedBox(
                        height: 16 * 2,
                        child: Wrap(
                          clipBehavior: Clip.antiAlias,
                          children: [
                            Text(
                              price ?? '',
                              style: context.appTypography.openRegularText,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            ...?tags?.map(
                              (e) => Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    e,
                                    style:
                                        context.appTypography.openRegularText,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (rating != null)
                            StarsRatingWidget(
                              rating: rating!,
                              totalStars: 5,
                              starColor: Colors.amber,
                              starSize: 12,
                            ),
                          OpenStatusWidget(
                            text: isOpen
                                ? context.l10n.openNow
                                : context.l10n.closed,
                            color: isOpen
                                ? context.appColors.openStatusColor
                                : context.appColors.closedStatusColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
