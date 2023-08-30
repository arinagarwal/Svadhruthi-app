import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Chatbot extends StatefulWidget {
  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [];
  final Uri url = Uri.parse('https://your-server-url/chatbot');

  void _sendMessage() {
    String message = _messageController.text;
    _messages.add(message);
    Future response = getChatResponse(message);
    _messageController.clear();
  }

  Future<String> getChatResponse(String message) async {
    final response = await http.post(
      url,
      body: json.encode({'message': message}),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to get chat response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: _messages
                  .map((message) => Text(message))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: 'Send a message',
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Send'),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}