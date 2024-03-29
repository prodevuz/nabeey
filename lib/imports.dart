export 'dart:io';
export 'dart:ui' show ImageFilter;
export 'dart:async';
export 'dart:convert';
export 'package:http/http.dart';
export 'package:nabeey/http_service.dart';
export 'package:flutter/material.dart' hide Image;
export 'package:flutter/services.dart';
export 'package:image_picker/image_picker.dart';
export 'package:icons_flutter/icons_flutter.dart';
export 'package:audioplayers/audioplayers.dart';
export 'package:nabeey/pages/home_page.dart';
export 'package:nabeey/pages/category_page.dart';
export 'package:nabeey/pages/article_page.dart';
export 'package:nabeey/pages/article_send.dart';
export 'package:nabeey/models.dart';
export 'package:youtube_player_flutter/youtube_player_flutter.dart'
    hide PlayerState;
export 'package:nabeey/pages/audio_page.dart';
export 'package:nabeey/pages/book_page.dart';
export 'package:nabeey/pages/content_page.dart';
export 'package:nabeey/pages/video_page.dart';
export 'package:nabeey/pages/video_content.dart';
export 'package:nabeey/pages/video_player.dart';
export 'package:nabeey/pages/quiz_page.dart';
export 'package:nabeey/pages/rating_page.dart';
export 'package:nabeey/pages/confirm_page.dart';
export 'package:nabeey/pages/profile_edit.dart';
export 'package:nabeey/pages/profile_page.dart';
export 'package:nabeey/pages/structure.dart';

List<Map<String, String>> offlineCategory = [
  {
    'title': "Payg'ambarlikdan oldingi davr",
    'description':
        "Payg'ambarimiz Muhammad Sollallohu alayhi vasallamni dunyoga kelishlari va vahiy nozil bo'lishigacha bo'lgan davr",
    'image': "assets/images/makkah.jpg",
  },
  {
    'title': "Payg'ambarlikdan oldingi davr",
    'description':
        "Payg'ambarimiz Muhammad Sollallohu alayhi vasallamni dunyoga kelishlari va vahiy nozil bo'lishigacha bo'lgan davr",
    'image': "assets/images/makkah.jpg",
  },
  {
    'title': "Payg'ambarlikni boshlanishi",
    'description':
        "Rosululloh Sollallohu alayhi vasallamga vahiy nozil bo'lishi va umumiy Makkadagi davrlari haqida",
    'image': "assets/images/categoryy2.jpg",
  },
  {
    'title': "Madinadagi davr",
    'description':
        "Rosululloh Sollallohu alayhi vasallamni Madinaga hijratlari va Madinadagi davrlari",
    'image': "assets/images/madina1.jpg",
  },
];
List views = [
  "124",
  "96",
  "106",
  "67",
  "78",
  '201',
];
List dates = [
  "1.10.2023",
  "3.10.2023",
  "3.10.2023",
  "2.10.2023",
  "5.10.2023",
  "6.10.2023",
];

int index = 0;
int categoryId = 1;
int articleId = 1;
int authorId = 0;
int audioId = 0;
List<String> authors = [];
