# slide_scroll_stack

Widget that slides and scrolls to stack.

## How to use

```dart
import 'package:slide_scroll_stack/slide_scroll_stack.dart';
```

```dart
SlideScrollStack(
  children: <Widget>[
    Card(
      child: FlutterLogo(
        colors: Colors.red,
      ),
    ),
    Card(
      child: FlutterLogo(
        colors: Colors.blue,
      ),
    ),
    Card(
      child: FlutterLogo(
        colors: Colors.green,
      ),
    )
  ],
)
```

How to change slide direction, you can set the `slideDirection`.

```dart
SlideScrollStack(
  slideDirection: SlideDirection.left,
  children: <Widget>[
    Card(
      child: FlutterLogo(
        colors: Colors.red,
      ),
    ),
    Card(
      child: FlutterLogo(
        colors: Colors.blue,
      ),
    ),
    Card(
      child: FlutterLogo(
        colors: Colors.green,
      ),
    )
  ],
)
```

You can change the ratio of the size of the main widget to the next widget by specifying the `rate`.

```dart
SlideScrollStack(
  rate: 1 / 2,
  children: <Widget>[
    Card(
      child: FlutterLogo(
        colors: Colors.red,
      ),
    ),
    Card(
      child: FlutterLogo(
        colors: Colors.blue,
      ),
    ),
    Card(
      child: FlutterLogo(
        colors: Colors.green,
      ),
    )
  ],
)
```
