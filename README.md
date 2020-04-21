# slide_scroll_stack

Widget that slides and scrolls to stack.

## How to use

```dart
import 'package:slide_scroll_stack/slide_scroll_stack.dart';
```

<p>
<img src="https://github.com/you0518/slide_scroll_stack/blob/master/screenshots/standard.jpg?raw=true" width="320" />
</p>

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

<p>
<img src="https://github.com/you0518/slide_scroll_stack/blob/master/screenshots/left.jpg?raw=true" width="320" />
</p>

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

<p>
<img src="https://github.com/you0518/slide_scroll_stack/blob/master/screenshots/rate.jpg?raw=true" width="320" />
</p>

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
