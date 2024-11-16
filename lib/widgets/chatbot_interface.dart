import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatMessage({
    Key? key,
    required this.text,
    required this.isUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: isUser ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isUser ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatbotInterface extends StatefulWidget {
  const ChatbotInterface({Key? key}) : super(key: key);

  @override
  State<ChatbotInterface> createState() => _ChatbotInterfaceState();
}

class _ChatbotInterfaceState extends State<ChatbotInterface> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ParentApp Assistant'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Ask me anything...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _handleSubmitted,
          ),
        ],
      ),
    );
  }

  void _handleSubmitted() {
    if (_controller.text.isEmpty) return;
    setState(() {
      _messages.add(ChatMessage(
        text: _controller.text,
        isUser: true,
      ));
      // Add bot response
      _messages.add(ChatMessage(
        text: 'Thanks for your message. How can I help you today?',
        isUser: false,
      ));
    });
    _controller.clear();
  }
}