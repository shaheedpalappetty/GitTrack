part of 'fetch_bloc.dart';

abstract class FetchState {}

final class FetchInitial extends FetchState {}

final class FetchGitIssuesLoadingState extends FetchState {}

final class FetchGitIssuesErrorState extends FetchState {}

final class FetchGitIssuesSuccessState extends FetchState {
  List<GitIssues> data;
  FetchGitIssuesSuccessState({required this.data});
  
}
