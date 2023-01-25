import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final String aniPath = 'assets/git_theme.riv';
  late final RiveAnimationController _controller;

  void _togglePlay() {
    setState(() {
      _controller.isActive = !_controller.isActive;
    });
  }

  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  Icons.settings,
                  size: 72,
                  color: Colors.grey[400],
                ),
              ),
              const ListTile(
                leading: Icon(Icons.info),
                title: Text('Version 1.0.1'),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.shop),
                title: Text('About Us'),
              ),
              const Divider(),
              Flexible(
                child: Center(
                  child: RiveAnimation.network(
                    'https://cdn.rive.app/animations/git_theme.riv',

                    controllers: [_controller],
                    // Update the play state when the widget's initialized
                    onInit: (_) => setState(() {}),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
