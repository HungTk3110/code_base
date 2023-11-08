part of 'notification_list_cubit.dart';

class NotificationListState extends Equatable {
  final LoadStatus loadDataStatus;
  final List<NotificationEntity> notificationEntity;

  const NotificationListState({
    this.loadDataStatus = LoadStatus.initial,
    this.notificationEntity = const [],
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
        notificationEntity,
      ];

  get notificationEntities => null;

  NotificationListState copyWith({
    LoadStatus? loadDataStatus,
    List<NotificationEntity>? notificationEntity,
  }) {
    return NotificationListState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
      notificationEntity: notificationEntity ?? this.notificationEntity,
    );
  }
}
