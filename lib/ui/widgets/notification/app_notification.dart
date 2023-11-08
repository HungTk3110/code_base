import 'package:flutter/material.dart';
import 'package:flutter_base/common/app_text_styles.dart';
import 'package:flutter_base/models/entities/notification/notification_entity.dart';

class AppNotification extends StatelessWidget {
  final NotificationEntities notification;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final Color? colorIconIsRead;
  final VoidCallback? onPressed;

  const AppNotification({
    Key? key,
    required this.notification,
    this.titleStyle,
    this.messageStyle,
    this.colorIconIsRead,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.lightBlue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: (notification.isRead == false)
                      ? (colorIconIsRead ?? Colors.red)
                      : Colors.white,
                  radius: 5,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    notification.title,
                    style: AppTextStyle.blackS14W800,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: onPressed,
                  child: const Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              notification.message,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
