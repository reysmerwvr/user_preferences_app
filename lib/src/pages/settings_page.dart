import 'package:flutter/material.dart';
import 'package:user_preferences_app/src/shared_preferences/user_preferences.dart';
import 'package:user_preferences_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor;
  int _genre;

  TextEditingController _textController;

  final prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();
    _genre = prefs.genre;
    _secondaryColor = prefs.secondaryColor;
    prefs.lastPage = SettingsPage.routeName;

    _textController = new TextEditingController(text: prefs.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
            value: _secondaryColor,
            onChanged: (bool value) {
              setState(() {
                _secondaryColor = value;
                prefs.secondaryColor = value;
              });
            },
            title: Text("Scondary Color"),
          ),
          RadioListTile(
            value: 1,
            groupValue: _genre,
            title: Text("Female"),
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            groupValue: _genre,
            title: Text("Male"),
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: "Name",
                helperText: "User Name",
              ),
              onChanged: (value) {
                prefs.userName = value;
              },
            ),
          )
        ],
      ),
    );
  }

  _setSelectedRadio(int value) {
    prefs.genre = value;
    setState(() {
      _genre = value;
    });
  }
}
