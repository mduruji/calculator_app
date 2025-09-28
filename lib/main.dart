import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CalculatorApp",
      debugShowCheckedModeBanner: false,
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = "0";

  void _numClick(String text) {
    setState(() {
      if (_display == "0") {
        _display = text;
      } else {
        _display += text;
      }
    });
  }

  Widget _buildButton(String text, {Function()? onPressed}) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.all(4),
          height: 70,
          color: Colors.grey[300],
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CalculatorApp")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                _display,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              _buildButton("7", onPressed: () => _numClick("7")),
              _buildButton("8", onPressed: () => _numClick("8")),
              _buildButton("9", onPressed: () => _numClick("9")),
            ],
          ),
          Row(
            children: [
              _buildButton("4", onPressed: () => _numClick("4")),
              _buildButton("5", onPressed: () => _numClick("5")),
              _buildButton("6", onPressed: () => _numClick("6")),
            ],
          ),
          Row(
            children: [
              _buildButton("1", onPressed: () => _numClick("1")),
              _buildButton("2", onPressed: () => _numClick("2")),
              _buildButton("3", onPressed: () => _numClick("3")),
            ],
          ),
          Row(
            children: [
              _buildButton("0", onPressed: () => _numClick("0")),
            ],
          ),
        ],
      ),
    );
  }
}
