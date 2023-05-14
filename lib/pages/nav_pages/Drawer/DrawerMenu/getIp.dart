import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:network_info_plus/network_info_plus.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  // final channel = IOWebSocketChannel.connect('ws://192.168.63.35:81');
  final List<String> _messages = [];
  late final IOWebSocketChannel channel;

  @override
  void initState() {
    super.initState();
    initWebSocket();
  }

  Future<void> initWebSocket() async {
    final info = NetworkInfo();
    final String? ipAddress = await info.getWifiIP();
    List<String> parts = ipAddress!.split('.');
    String firstThreeParts = parts.sublist(0, 3).join('.');
    channel = IOWebSocketChannel.connect('ws://$firstThreeParts.35:81');
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebSocket Chat'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(_messages[index]);
                },
              ),
            ),
            const Divider(),
            Container(
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        hintText: 'Type a message',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _sendMessage,
                    child: const Text('Send'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_textController.text.isNotEmpty) {
      channel.sink.add(_textController.text);
      _textController.clear();
    }
  }
}
