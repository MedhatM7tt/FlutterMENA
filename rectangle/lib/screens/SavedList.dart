import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedList extends StatelessWidget {
  final Set<WordPair> _saved;
  SavedList(this._saved);
  @override
  Widget build(BuildContext context) {
    Iterable<ListTile> tiles = _saved.map(
      (WordPair pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
          ),
        );
      },
    );
    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: new ListView(children: divided),
    );
  }
}
