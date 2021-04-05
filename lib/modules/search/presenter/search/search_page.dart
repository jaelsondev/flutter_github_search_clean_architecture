import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_search_clean/modules/search/presenter/search/search_bloc.dart';
import 'package:github_search_clean/modules/search/presenter/search/states/state.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bloc = Modular.get<SearchBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Github Search')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
            child: TextField(
              onChanged: bloc.add,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Search...'),
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: bloc,
                builder: (context, snapshot) {
                  final state = bloc.state;

                  if (state is SearchStart) {
                    return Center(child: Text('Digite um texto'));
                  }

                  if (state is SearchErro) {
                    return Center(child: Text('Hove um error'));
                  }

                  if (state is SearchLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final list = (state as SearchSuccess).list;
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, id) {
                        final item = list[id];
                        return ListTile(
                            leading: item.avatarUrl == null
                                ? Container()
                                : CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(item.avatarUrl),
                                  ),
                            title: Text(item.login ?? ''),
                            subtitle: Text(item.id?.toString() ?? ''));
                      });
                }),
          )
        ],
      ),
    );
  }
}
