import 'package:flutter_base/models/entities/notification/notification_entity.dart';
import 'package:flutter_base/models/response/array_response.dart';
import 'package:flutter_base/network/api_client.dart';

abstract class NotificationRepository {
  Future<ArrayResponse<NotificationEntity>> getNotification();
}

class NotificationRepositoryImpl extends NotificationRepository {
  ApiClient apiClient;

  NotificationRepositoryImpl({required this.apiClient});

  @override
  Future<ArrayResponse<NotificationEntity>> getNotification() async {
    return await apiClient.getNotifications();
  }
}
