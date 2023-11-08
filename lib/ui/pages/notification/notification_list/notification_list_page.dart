import 'package:flutter/material.dart';
import 'package:flutter_base/models/entities/notification/notification_entity.dart';
import 'package:flutter_base/repositories/notification_respository.dart';
import 'package:flutter_base/ui/widgets/notification/app_notification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_list_cubit.dart';

class NotificationListArguments {
  String param;

  NotificationListArguments({
    required this.param,
  });
}

class NotificationListPage extends StatelessWidget {
  final NotificationListArguments? arguments;

  const NotificationListPage({
    Key? key,
    this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final notiRepo = RepositoryProvider.of<NotificationRepository>(context);
        return NotificationListCubit(
          notificationRepository: notiRepo,
        );
      },
      child: const NotificationListChildPage(),
    );
  }
}

class NotificationListChildPage extends StatefulWidget {
  const NotificationListChildPage({Key? key}) : super(key: key);

  @override
  State<NotificationListChildPage> createState() =>
      _NotificationListChildPageState();
}

class _NotificationListChildPageState extends State<NotificationListChildPage> {
  late final NotificationListCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
    final notificationRepository =
        RepositoryProvider.of<NotificationRepository>(context);
    _cubit.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: SafeArea(
        child: _buildBodyWidget(),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return BlocBuilder<NotificationListCubit, NotificationListState>(
      bloc: _cubit,
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: state.notificationEntities.length ?? 0,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 14,
            );
          },
          itemBuilder: (context, index) {
            return AppNotification(
              notification: state.notificationEntities?[index] ?? [],
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
