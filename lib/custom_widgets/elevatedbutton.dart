import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final String text;
  final VoidCallback? callBack;
  const CustomElevatedButton({super.key, required this.text, this.callBack});

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: widget.callBack, child: Text(widget.text));
  }
}

class CustomElevatedButtonWithIcon extends StatefulWidget {
  final String text;
  final VoidCallback? callBack;
  final Icon icon;
  final Size? size;
  const CustomElevatedButtonWithIcon(
      {super.key,
      required this.text,
      this.callBack,
      required this.icon,
      this.size});

  @override
  State<CustomElevatedButtonWithIcon> createState() =>
      _CustomElevatedButtonWithIconState();
}

class _CustomElevatedButtonWithIconState
    extends State<CustomElevatedButtonWithIcon> {
  @override
  Widget build(BuildContext context) {
    Size? size;
    return ElevatedButton.icon(
      onPressed: widget.callBack,
      label: Text(widget.text),
      icon: widget.icon,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith<Size>(
            (Set<MaterialState> states) {
          if (widget.size == null) {
            return Size(100, 100);
          }

          if (states.contains(MaterialState.pressed)) {
            return Size((widget.size!.width * 0.4) - 10,
                (widget.size!.height * 0.05) - 10);
          }

          return Size(widget.size!.width * 0.4, widget.size!.height * 0.05);
        }),
      ),
    );
  }
}
