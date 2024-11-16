import 'package:flutter/material.dart';

class ChatbotConversation extends StatefulWidget {
  const ChatbotConversation({Key? key}) : super(key: key);

  @override
  State<ChatbotConversation> createState() => _ChatbotConversationState();
}

class _ChatbotConversationState extends State<ChatbotConversation> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<String> _quickResponses = [
    'Meal recommendations',
    'Investment advice',
    'Insurance options',
    'Travel miles balance',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildQuickResponses(),
        Expanded(child: _buildMessageList()),
        _buildInputArea(),
      ],
    );
  }

  Widget _buildQuickResponses() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _quickResponses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ActionChip(
              label: Text(_quickResponses[index]),
              onPressed: () => _handleQuickResponse(_quickResponses[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMessageList() {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(8),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        return _buildMessage(_messages[index]);
      },
    );
  }

  Widget _buildMessage(ChatMessage message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: message.isUser ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
                border: InputBorder.none,
              ),
              onSubmitted: _handleSubmitted,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    if (text.isEmpty) return;
    
    setState(() {
      _messages.add(ChatMessage(text: text, isUser: true));
      _textController.clear();
      
      // Simulate AI response
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _messages.add(ChatMessage(
            text: 'Thanks for your message. How can I assist you today?',
            isUser: false,
          ));
        });
        _scrollToBottom();
      });
    });
  }

  void _handleQuickResponse(String response) {
    _handleSubmitted(response);
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}
