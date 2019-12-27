
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        
        body:  Center(
          child:  RandomWords(),
          
        ),
       
        
        
      ),
    );
  }
}
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
  
}
class RandomWordsState extends State<RandomWords> {
  @override                                  // Add from this line ... 
  Widget build(BuildContext context) {
    final WordPair wordPair = WordPair.random();
    final List<WordPair> _suggestions = <WordPair>[];
    final TextStyle _biggerFont = const TextStyle(fontSize: 18); 
    
    

    Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

    Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
     
      itemBuilder: (BuildContext _context, int i) {
        
        if (i.isOdd) {
          return Divider();
        }

        
        final int index = i ~/ 2;
        
        if (index >= _suggestions.length) {
          
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }
  
  return Scaffold (                   // Add from here... 
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    ); 
  }

  
  
                                            // ... to this line.
}

