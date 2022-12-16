import 'package:flutter/material.dart';

class PromptIndicator extends StatelessWidget {
  final Widget? image;
  final String? promptTitleText;
  final String? promptText;
  final String? buttonText;
  final VoidCallback? onPressed;

  const PromptIndicator({
    Key? key,
    this.image,
    this.promptTitleText,
    this.promptText,
    this.buttonText,
    this.onPressed
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> columnWidget = <Widget>[
      SizedBox(
        height: 50,
        width: double.infinity,
        child: FittedBox(
          child: image
        )
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              promptTitleText ?? "",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center
            ),
            const SizedBox(height: 4.0),
            Text(promptText ?? "", style: const TextStyle(color: Colors.black), textAlign: TextAlign.center)
          ]
        ),
      ),
    ];
    if (onPressed != null) {
      columnWidget.addAll(
        <Widget>[
          const SizedBox(height: 3),
          SizedBox(
            width: 50,
            height: 7,
            child: TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(buttonText ?? ""),
            )
          ),
        ]
      );
    }
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: columnWidget,
      )
    );
  }
}