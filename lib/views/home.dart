import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_track/bloc/fetch_bloc/fetch_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'GitHub Issues',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: const [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: BlocBuilder<FetchBloc, FetchState>(
          builder: (context, state) {
            if (state is FetchGitIssuesSuccessState) {
              return ListView.separated(
                itemCount: state.data.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(10),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 30,
                          backgroundImage:
                              NetworkImage(state.data[index].user.avatarUrl),
                        ),
                        title: Text(state.data[index].title),
                        subtitle: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("FirstName MiddleName"),
                            Text("March-08-2024")
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          state.data[index].body.toString().length > 200
                              ? state.data[index].body
                                  .toString()
                                  .substring(0, 200)
                              : state.data[index].body.toString(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              );
            } else if (state is FetchGitIssuesErrorState) {
              return const Center(
                child: Text("Error while Loading Data"),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  fetchData() async {
    context.read<FetchBloc>().add(FetchGitIssuesEvent());
  }
}
