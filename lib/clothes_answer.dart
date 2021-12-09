import 'package:flutter/material.dart';

class ClothesAnswer extends StatelessWidget {
  final String? _answerText;
  final VoidCallback? _clickedEvent;

  const ClothesAnswer(this._clickedEvent, this._answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (_clickedEvent != null)
        ? Column(children: <Widget>[
            const SizedBox(height: 10),
            ElevatedButton(
                child: Text(_answerText!,
                    style: const TextStyle(color: Colors.red)),
                onPressed: _clickedEvent,
                style: ElevatedButton.styleFrom(primary: Colors.green)),
            const SizedBox(height: 10)
          ])
        : Text(_answerText!);
  }
}
