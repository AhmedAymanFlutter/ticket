import 'dart:convert';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

class HybridAssetLoader extends AssetLoader {
  const HybridAssetLoader();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    // 1. Load local asset
    final String localAssetPath = '$path/${locale.languageCode}.json';
    Map<String, dynamic> localData = {};

    try {
      final String jsonString = await rootBundle.loadString(localAssetPath);
      localData = json.decode(jsonString);
    } catch (e) {
      print(
        'HybridAssetLoader: Could not load local asset $localAssetPath: $e',
      );
    }

    // 2. Load remote/cached data (Placeholder for now)
    // In a real app, you might fetch from an API or Hive here.
    Map<String, dynamic> remoteData = {};
    // try { ... fetch from API/DB ... } catch (e) { ... }

    // 3. Merge: Remote overrides Local
    final Map<String, dynamic> mergedData = {};
    mergedData.addAll(localData);
    mergedData.addAll(
      remoteData,
    ); // Remote keys overwrite local keys if duplicates exist

    return mergedData;
  }
}
