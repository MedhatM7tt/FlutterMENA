import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'screens/secondScreen.dart';
import 'screens/SavedList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: new MyStateFul(),
    );
  }
}

class MyStateFul extends StatefulWidget {
  _MyStateFulState createState() => _MyStateFulState();
}

class _MyStateFulState extends State<MyStateFul> {
  final WordPair wordPair = new WordPair.random();
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Center(
            child: new Text("Words Suggestions"),
          ),
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.list),
              onPressed: _savedItems,
            ),
          ],
        ),
        body:
            /*Center(
          child: new Text(
            wordPair.toString(),
            style: TextStyle(color: Colors.redAccent),
          ),
        ),*/
            _buildSuggestions(),
      ),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(18.0),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return new Divider();
        }
        final int index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return new ListTile(
      trailing: IconButton(
        icon: alreadySaved ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
        color: alreadySaved ? Colors.red : Colors.yellow,
        onPressed: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        },
      ),
      leading: CircleAvatar(
        child: Text(
          pair.toString()[0].toUpperCase(),
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      subtitle: Text("My " + pair.toString()),
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => SecondScreen(pair),
        ));
      },
    );
  }

  void _savedItems() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => SavedList(_saved),
    ));
  }
}
