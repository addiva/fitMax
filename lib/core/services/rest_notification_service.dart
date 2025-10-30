import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// A service for managing rest notifications.
class RestNotificationService {
  RestNotificationService._internal();

  /// The singleton instance of the service.
  static final RestNotificationService instance =
      RestNotificationService._internal();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;
  final _tapController = StreamController<void>.broadcast();

  static const _channelId = 'fitmax_rest_timer';
  static const _channelName = 'Recupero FitMax';
  static const _channelDescription =
      'Mostra il conto alla rovescia durante i recuperi delle sessioni';
  static const _payloadActiveSession = 'active_session';

  /// Initializes the service.
  Future<void> initialize() async {
    if (_initialized) {
      return;
    }

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings(
      defaultPresentAlert: true,
      defaultPresentBadge: false,
      defaultPresentSound: false,
    );
    const macSettings = DarwinInitializationSettings(
      defaultPresentAlert: true,
      defaultPresentBadge: false,
      defaultPresentSound: false,
    );
    final initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
      macOS: macSettings,
    );

    await _plugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) {
        if (response.payload == _payloadActiveSession) {
          _tapController.add(null);
        }
      },
    );

    final androidImplementation = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await androidImplementation?.requestNotificationsPermission();

    final iosImplementation = _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();
    await iosImplementation?.requestPermissions(
      alert: true,
      badge: false,
      sound: false,
      critical: true,
    );

    final macImplementation = _plugin
        .resolvePlatformSpecificImplementation<
          MacOSFlutterLocalNotificationsPlugin
        >();
    await macImplementation?.requestPermissions(
      alert: true,
      badge: false,
      sound: false,
      critical: true,
    );

    await androidImplementation?.createNotificationChannel(
      const AndroidNotificationChannel(
        _channelId,
        _channelName,
        description: _channelDescription,
        importance: Importance.max,
        playSound: false,
        showBadge: false,
      ),
    );

    _initialized = true;
  }

  /// Updates the countdown notification.
  Future<void> updateCountdown(
    int seconds, {
    bool paused = false,
    required String sessionName,
    required int exerciseIndex,
    required int totalExercises,
    required String exerciseName,
  }) async {
    if (!_initialized) {
      return;
    }
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainder = (seconds % 60).toString().padLeft(2, '0');
    final exerciseNumber = exerciseIndex + 1;
    final statusLabel = paused ? 'Timer in pausa' : 'Tempo residuo';
    final countdown = '$minutes:$remainder';
    final body =
        'Esercizio $exerciseNumber/$totalExercises • $exerciseName • $statusLabel $countdown';

    await _plugin.show(
      1001,
      'Sessione in corso • $sessionName',
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          importance: Importance.max,
          priority: Priority.high,
          ongoing: !paused && seconds > 0,
          onlyAlertOnce: true,
          playSound: false,
          category: AndroidNotificationCategory.progress,
          largeIcon: const DrawableResourceAndroidBitmap('logo'),
        ),
        iOS: DarwinNotificationDetails(
          interruptionLevel: InterruptionLevel.timeSensitive,
          presentAlert: true,
          presentSound: false,
          presentBadge: false,
          subtitle: paused ? 'Timer in pausa' : 'Tempo residuo $countdown',
          threadIdentifier: _channelId,
        ),
        macOS: DarwinNotificationDetails(
          interruptionLevel: InterruptionLevel.timeSensitive,
          presentAlert: true,
          presentSound: false,
          presentBadge: false,
          subtitle: paused ? 'Timer in pausa' : 'Tempo residuo $countdown',
          threadIdentifier: _channelId,
        ),
      ),
      payload: _payloadActiveSession,
    );
  }

  /// Cancels the countdown notification.
  Future<void> cancel() async {
    if (!_initialized) {
      return;
    }
    await _plugin.cancel(1001);
  }

  /// A stream of notification tap events.
  Stream<void> get tapStream => _tapController.stream;
}
