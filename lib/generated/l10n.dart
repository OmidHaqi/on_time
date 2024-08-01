// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `On . Time`
  String get name {
    return Intl.message(
      'On . Time',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Planning`
  String get planning {
    return Intl.message(
      'Planning',
      name: 'planning',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get well {
    return Intl.message(
      'Ok',
      name: 'well',
      desc: '',
      args: [],
    );
  }

  /// `let s Go...`
  String get letsGo {
    return Intl.message(
      'let s Go...',
      name: 'letsGo',
      desc: '',
      args: [],
    );
  }

  /// `set a goal !`
  String get goal {
    return Intl.message(
      'set a goal !',
      name: 'goal',
      desc: '',
      args: [],
    );
  }

  /// `Plan for tomorrow!`
  String get plan {
    return Intl.message(
      'Plan for tomorrow!',
      name: 'plan',
      desc: '',
      args: [],
    );
  }

  /// `Touch it!`
  String get target {
    return Intl.message(
      'Touch it!',
      name: 'target',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get tasks {
    return Intl.message(
      'Tasks',
      name: 'tasks',
      desc: '',
      args: [],
    );
  }

  /// `You have not added a note yet`
  String get emptyNote {
    return Intl.message(
      'You have not added a note yet',
      name: 'emptyNote',
      desc: '',
      args: [],
    );
  }

  /// `You have no plans today`
  String get emptyPlan {
    return Intl.message(
      'You have no plans today',
      name: 'emptyPlan',
      desc: '',
      args: [],
    );
  }

  /// `New Task`
  String get newTask {
    return Intl.message(
      'New Task',
      name: 'newTask',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get taskTitle {
    return Intl.message(
      'Title',
      name: 'taskTitle',
      desc: '',
      args: [],
    );
  }

  /// `Write your title here`
  String get taskTitleHint {
    return Intl.message(
      'Write your title here',
      name: 'taskTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get taskNoteTitle {
    return Intl.message(
      'Note',
      name: 'taskNoteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Write your note here`
  String get taskNoteHint {
    return Intl.message(
      'Write your note here',
      name: 'taskNoteHint',
      desc: '',
      args: [],
    );
  }

  /// `Place`
  String get taskPlaceTitle {
    return Intl.message(
      'Place',
      name: 'taskPlaceTitle',
      desc: '',
      args: [],
    );
  }

  /// `What is the name of the place you want to go?`
  String get taskPlaceHint {
    return Intl.message(
      'What is the name of the place you want to go?',
      name: 'taskPlaceHint',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Task added successfully`
  String get addTaskSnackBar {
    return Intl.message(
      'Task added successfully',
      name: 'addTaskSnackBar',
      desc: '',
      args: [],
    );
  }

  /// `The task successfully deleted`
  String get deleteTaskSnackBar {
    return Intl.message(
      'The task successfully deleted',
      name: 'deleteTaskSnackBar',
      desc: '',
      args: [],
    );
  }

  /// `You must fill in the title`
  String get emptyTextFieldError {
    return Intl.message(
      'You must fill in the title',
      name: 'emptyTextFieldError',
      desc: '',
      args: [],
    );
  }

  /// `save`
  String get save {
    return Intl.message(
      'save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Discard`
  String get discard {
    return Intl.message(
      'Discard',
      name: 'discard',
      desc: '',
      args: [],
    );
  }

  /// `Edit Task`
  String get editTask {
    return Intl.message(
      'Edit Task',
      name: 'editTask',
      desc: '',
      args: [],
    );
  }

  /// `The task edited successfully`
  String get editTaskSnackBar {
    return Intl.message(
      'The task edited successfully',
      name: 'editTaskSnackBar',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this task?`
  String get deleteTaskDialogContent {
    return Intl.message(
      'Are you sure you want to delete this task?',
      name: 'deleteTaskDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `delete it`
  String get deleteDialogPrimaryBtn {
    return Intl.message(
      'delete it',
      name: 'deleteDialogPrimaryBtn',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get deleteDialogSecendaryBtn {
    return Intl.message(
      'Cancel',
      name: 'deleteDialogSecendaryBtn',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get noteTextFieldTitleHint {
    return Intl.message(
      'Title',
      name: 'noteTextFieldTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `Write your note here...`
  String get noteTextFieldNoteHint {
    return Intl.message(
      'Write your note here...',
      name: 'noteTextFieldNoteHint',
      desc: '',
      args: [],
    );
  }

  /// `Note added successfully`
  String get addNoteSnackBar {
    return Intl.message(
      'Note added successfully',
      name: 'addNoteSnackBar',
      desc: '',
      args: [],
    );
  }

  /// `Note edited successfully`
  String get editNoteSnackBar {
    return Intl.message(
      'Note edited successfully',
      name: 'editNoteSnackBar',
      desc: '',
      args: [],
    );
  }

  /// `created at :`
  String get createAt {
    return Intl.message(
      'created at :',
      name: 'createAt',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this note?`
  String get deleteNoteDialogContent {
    return Intl.message(
      'Are you sure you want to delete this note?',
      name: 'deleteNoteDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Note deleted successfully`
  String get deleteNoteSnackBar {
    return Intl.message(
      'Note deleted successfully',
      name: 'deleteNoteSnackBar',
      desc: '',
      args: [],
    );
  }

  /// `ERROR`
  String get error {
    return Intl.message(
      'ERROR',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Time:`
  String get taskCardTime {
    return Intl.message(
      'Time:',
      name: 'taskCardTime',
      desc: '',
      args: [],
    );
  }

  /// `Place: `
  String get taskCardPlace {
    return Intl.message(
      'Place: ',
      name: 'taskCardPlace',
      desc: '',
      args: [],
    );
  }

  /// `Note: `
  String get taskCardNote {
    return Intl.message(
      'Note: ',
      name: 'taskCardNote',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fa'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
