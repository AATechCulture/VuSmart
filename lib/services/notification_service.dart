import 'package:flutter/material.dart';

class NotificationService {
  static final List<NotificationMessage> _notifications = [];
  static final ValueNotifier<int> notificationCount = ValueNotifier<int>(0);

  static void showNotification(String title, String message) {
    _notifications.add(NotificationMessage(
      title: title,
      message: message,
      timestamp: DateTime.now(),
    ));
    notificationCount.value = _notifications.length;
  }

  static List<NotificationMessage> getNotifications() {
    return _notifications;
  }

  static void clearNotifications() {
    _notifications.clear();
    notificationCount.value = 0;
  }
}

class NotificationMessage {
  final String title;
  final String message;
  final DateTime timestamp;

  NotificationMessage({
    required this.title,
    required this.message,
    required this.timestamp,
  });
}