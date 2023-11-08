import 'package:equatable/equatable.dart';
import 'package:flutter_base/models/entities/notification/notification_entity.dart';
import 'package:flutter_base/models/enums/load_status.dart';
import 'package:flutter_base/repositories/notification_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_list_state.dart';

class NotificationListCubit extends Cubit<NotificationListState> {
  NotificationRepository notificationRepository;

  NotificationListCubit({
    required this.notificationRepository,
  }) : super( const NotificationListState());

  Future<void> loadInitialData() async {
    emit(
      state.copyWith(loadDataStatus: LoadStatus.initial),
    );
    try {
      final result = await notificationRepository.getNotification();
      emit(
        state.copyWith(
            notificationEntity: result.results,
            loadDataStatus: LoadStatus.success),
      );
    } catch (e) {
      emit(state.copyWith(
        loadDataStatus: LoadStatus.failure,
      ));
    }
  }
}
