import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/core/helpers/extensions.dart';
import 'package:mobile_app/core/routing/routes.dart';
import 'package:mobile_app/features/search/models/hospital.dart';
import 'package:mobile_app/features/search/repository/search_repository.dart';

enum SearchState {
  init,
  request,
  waiting,
  notFound,
  found,
  faild,
}

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState.init);

  String pathologicalCase = '';
  String hospitalClass = '';
  String duration = '';
  int searchAttempt = 0;
  Hospital? hospital;

  void findHospital(BuildContext context) async {
    state = SearchState.waiting;
    context.pushNamed(Routes.searchingScreen);
    final response = await HttpSearchRepository.getHospital(searchAttempt);

    if (!context.mounted) return;

    searchAttempt++;

    if (response.statusCode == 204) {
      // in case of no hospitals found
      state = SearchState.notFound;
      return;
    } else if (response.statusCode != 200) {
      // in case any thing wrong happens
      state = SearchState.faild;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Something went wrong! please try again'),
      ));
      return;
    }

    hospital = Hospital.fromJson(jsonDecode(response.body));
    state = SearchState.found;

  }
}

final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>(
  (ref) => SearchNotifier(),
);
