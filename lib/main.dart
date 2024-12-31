import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime FAQs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FAQPage(),
    );
  }
}

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  // List of FAQ items
  final List<Item> _data = generateItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime FAQs'),
      ),
      body: SingleChildScrollView(
        child: _buildPanel(),
      ),
    );
  }

  // Build the expansion panel list
  Widget _buildPanel() {
    return ExpansionPanelList(
      elevation: 1,
      expandedHeaderPadding: EdgeInsets.all(0),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            subtitle: Text('Tap to close'),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

// Generate the list of FAQ items
List<Item> generateItems() {
  return [
    Item(
      headerValue: 'What is Anime?',
      expandedValue:
          'Anime is a style of animation that originated in Japan and has become popular worldwide. It includes a wide range of genres and is often characterized by colorful graphics, vibrant characters, and fantastical themes.',
    ),
    Item(
      headerValue: 'What are some popular anime series?',
      expandedValue:
          'Some popular anime series include "Naruto", "One Piece", "Attack on Titan", "My Hero Academia", and "Dragon Ball Z".',
    ),
    Item(
      headerValue: 'What is Manga?',
      expandedValue:
          'Manga are Japanese comic books or graphic novels. They are typically serialized in magazines before being published as individual volumes. Many anime series are based on manga.',
    ),
    Item(
      headerValue: 'What is the difference between subbed and dubbed anime?',
      expandedValue:
          'Subbed anime refers to anime with subtitles in the viewer’s language, while dubbed anime has voiceovers in the viewer’s language, replacing the original Japanese dialogue.',
    ),
    Item(
      headerValue: 'What is an Otaku?',
      expandedValue:
          'Otaku is a Japanese term used to describe people with consuming interests, particularly in anime and manga. Outside Japan, it’s often used to describe anime and manga fans.',
    ),
  ];
}
