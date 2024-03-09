import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_track/models/issues.dart';
import 'package:github_track/services/github_services.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

class FetchBloc extends Bloc<FetchEvent, FetchState> {
  FetchBloc() : super(FetchInitial()) {
    on<FetchGitIssuesEvent>(fetchGitIssuesEvent);
  }

  FutureOr<void> fetchGitIssuesEvent(
      FetchGitIssuesEvent event, Emitter<FetchState> emit) async {
    emit(FetchGitIssuesLoadingState());
    final data = await GitHubRepo.fetchGitIssues();

    if (data != null) {
      print(data);
      emit(FetchGitIssuesSuccessState(data: data));
    } else {
      emit(FetchGitIssuesErrorState());
    }
  }
}
