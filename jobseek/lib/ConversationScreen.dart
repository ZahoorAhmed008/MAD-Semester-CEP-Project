import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  final String senderName;
  final String senderAvatarUrl = 'https://via.placeholder.com/150';

  const ConversationScreen({super.key, required this.senderName});

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final List<Map<String, dynamic>> conversation = [
    {
      "message": "Hi Developer, I need an update on the project.",
      "time": "10:00 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "Sure! I'll update you in a minute.",
      "time": "10:01 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "The feature integration is 80% complete.",
      "time": "10:02 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "That’s great! Will it be ready by tomorrow?",
      "time": "10:03 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "Yes, I’m on track to finish it.",
      "time": "10:04 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "Don’t forget to test the user authentication part.",
      "time": "10:05 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "Absolutely. I’ll make sure it’s covered.",
      "time": "10:06 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "There’s a small issue with the login page design.",
      "time": "10:07 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message":
          "I noticed that too. I’ll fix it and push the changes shortly.",
      "time": "10:08 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "Please prioritize the mobile responsiveness.",
      "time": "10:09 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "Sure! I’ll ensure it works smoothly on all devices.",
      "time": "10:10 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "Any updates on the API integration?",
      "time": "10:11 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "I’ve tested the API, and everything looks good so far.",
      "time": "10:12 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "Great! Is the payment gateway working?",
      "time": "10:13 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "Yes, the payment gateway is fully functional.",
      "time": "10:14 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "We may need to add some error handling there.",
      "time": "10:15 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "Got it. I’ll add detailed error messages.",
      "time": "10:16 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "What about the dashboard analytics?",
      "time": "10:17 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "I’m working on that now. Should be done by the afternoon.",
      "time": "10:18 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "Good. Just make sure to include export options.",
      "time": "10:19 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "Noted! I’ll include CSV and PDF export options.",
      "time": "10:20 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "Is there any delay in the project timeline?",
      "time": "10:21 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "No delays so far. Everything is on schedule.",
      "time": "10:22 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "Perfect! Let me know if you encounter any blockers.",
      "time": "10:23 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "Will do! Thanks for your support.",
      "time": "10:24 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "One more thing: can we have a demo later today?",
      "time": "10:25 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "Yes, let’s schedule it for 4 PM.",
      "time": "10:26 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "Great! I’ll prepare feedback after the demo.",
      "time": "10:27 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "Looking forward to it!",
      "time": "10:28 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "By the way, how’s the performance optimization?",
      "time": "10:29 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "I’ve applied lazy loading and caching for better speed.",
      "time": "10:30 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "Excellent! That will improve the user experience.",
      "time": "10:31 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "Indeed. I’ll run more tests to confirm.",
      "time": "10:32 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "Have you updated the documentation?",
      "time": "10:33 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "Yes, the latest version is available on GitHub.",
      "time": "10:34 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "I’ll review it today. Thanks!",
      "time": "10:35 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "Let me know if you have any suggestions.",
      "time": "10:36 AM",
      "isSentByMe": true,
      "isSeen": true
    },
    {
      "message": "Will do. Keep up the good work!",
      "time": "10:37 AM",
      "isSentByMe": false,
      "isSeen": true
    },
    {
      "message": "Thank you! Talk to you soon.",
      "time": "10:38 AM",
      "isSentByMe": true,
      "isSeen": true
    }
  ];

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        conversation.add({
          "message": _messageController.text,
          "time": "Now",
          "isSentByMe": true,
          "isSeen": false,
        });
        _messageController.clear();
      });
    }
  }

  void _showAppBarMenu(BuildContext context) async {
    String? selected = await showMenu<String>(
      context: context,
      position: const RelativeRect.fromLTRB(90, 80, 0, 0),
      items: [
        const PopupMenuItem<String>(
            value: 'delete', child: Text('Delete Conversation')),
        const PopupMenuItem<String>(
            value: 'clear', child: Text('Clear Conversation')),
        const PopupMenuItem<String>(value: 'block', child: Text('Block User')),
      ],
    );

    switch (selected) {
      case 'delete':
        setState(() {
          conversation.clear();
        });
        break;
      case 'clear':
        setState(() {
          conversation.clear();
        });
        break;
      case 'block':
        // Implement block functionality
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.senderAvatarUrl),
            ),
            const SizedBox(width: 10),
            Text(widget.senderName),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call, color: Colors.purple),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.purple),
            onPressed: () => _showAppBarMenu(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: conversation.length,
              itemBuilder: (context, index) {
                final message = conversation[index];
                bool isSentByMe = message["isSentByMe"];

                return Align(
                  alignment:
                      isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    padding: const EdgeInsets.all(10),
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: isSentByMe
                          ? Color.fromARGB(255, 226, 113, 246)
                          : Color.fromARGB(255, 166, 102, 189),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message["message"],
                          style: TextStyle(
                              color: isSentByMe ? Colors.black : Colors.black),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          message["time"],
                          style: TextStyle(
                            color: isSentByMe ? Colors.black54 : Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                        if (isSentByMe && message["isSeen"])
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.done_all,
                                  color: Color.fromARGB(255, 99, 50, 224),
                                  size: 16),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Colors.purple),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.photo, color: Colors.purple),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.purple),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
