import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';
import '../widgets/news_list_tile.dart';
import '../widgets/refresh.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Top News!'),
        ),
        body: buildList(bloc),
      ),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Refresh(
          child: ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, int index) {
              bloc.fetchItem(snapshot.data![index]);
              return NewsListTile(
                itemId: snapshot.data![index]
              );
            },
          ),
        );
      },
    );
  }
}