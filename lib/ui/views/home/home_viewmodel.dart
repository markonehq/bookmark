part of 'home_view.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger("HomeViewModel");
  String get counterLabel => 'Counter is: $_counter';

  final int _counter = 0;

  final List<Map<String, dynamic>> bookmarks = [
    {
      'type': 'twitter',
      'preview': 'Twitter Post Preview',
      'text': 'This is a sample tweet about Flutter development.',
      'username': '@flutterdev',
    },
    {
      'type': 'pinterest',
      'image':
          'https://imgs.search.brave.com/mkpmBtA2vbkocGZfqvEWAqGBstGvSBHJpYbaY0HEFug/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/bW9zLmNtcy5mdXR1/cmVjZG4ubmV0L0pD/eHZvaERZQldKQ1ZZ/R1dQSHBVY0EuanBn',
      'info': 'Pinterest Board: UI Design Ideas',
    },
    {
      'type': 'website',
      'favicon':
          'https://imgs.search.brave.com/dJWJg2OU6rqspAbh5jKtaMxUeuHTkyZKsWxoi6QAykQ/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9hc3Nl/dHMuc3RpY2twbmcu/Y29tL3RodW1icy82/MmEyNGIwZGQ0Y2Iy/NTc3NTIwZmNhMWIu/cG5n',
      'title': 'Flutter Documentation',
      'description': 'Comprehensive guide to Flutter development.',
    },
    {
      'type': 'twitter',
      'preview': 'Another Twitter Post',
      'text': 'Check out this amazing Flutter package!',
      'username': '@dartlang',
    },
    {
      'type': 'pinterest',
      'image':
          'https://i.pinimg.com/736x/bb/ba/bf/bbbabf3d4da84ba5fcefe348918bb1f6.jpg',
      'info': 'Pinterest Board: App Development',
    },
    {
      'type': 'website',
      'favicon':
          'https://imgs.search.brave.com/BN-bx7jMmwWTjSTeKq8ROFu46CVpm3FiFOZVbRNsxhs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvOTI4/MDk0MzQvcGhvdG8v/cGFyaXMtaHViZXJ0/LWF1cmlvbC1hdHRl/bmRzLXRoZS16b3Jv/LWdhbGEtcHJlbWll/cmUtYXQtZm9saWVz/LWJlcmdlcmVzLW9u/LW5vdmVtYmVyLTUt/MjAwOS1pbi5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9blJu/MktaOHU0eXp2OEU4/cUJpY3I0VUZ5YzNH/UmtaVDhMMHBXNTk0/cGJpYz0',
      'title': 'Dart Programming Language',
      'description': 'Learn Dart, the language behind Flutter.',
    },
    {
      'type': 'twitter',
      'preview': 'Exciting Flutter News!',
      'text': 'Flutter 3.0 is here with amazing new features.',
      'username': '@flutternews',
    },
    {
      'type': 'pinterest',
      'image':
          'https://imgs.search.brave.com/2-LCwBgyrA_O-a8uwc4Y7njr23qijOHSOu363uI-kjA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/bW9zLmNtcy5mdXR1/cmVjZG4ubmV0L2Fk/SkY5NTgySm52eFpo/UUNnVlhWTUQuanBn',
      'info': 'Pinterest Board: Modern UI Concepts',
    },
    {
      'type': 'website',
      'favicon':
          'https://imgs.search.brave.com/xZWeqNstVwVINXaGarnwiaAkx44X7jtg2Zvn-Q9lK9g/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/bW9zLmNtcy5mdXR1/cmVjZG4ubmV0L2Z2/c00zcG1UZ21QOW9v/TFJZUzR4YmsuanBn',
      'title': 'Flutter Widgets Catalog',
      'description': 'Explore the complete catalog of Flutter widgets.',
    },
    {
      'type': 'twitter',
      'preview': 'Dart Tips & Tricks',
      'text': 'Learn how to optimize your Dart code for performance.',
      'username': '@darttips',
    },
    {
      'type': 'pinterest',
      'image':
          'https://imgs.search.brave.com/OmuGOhWvYFjj70MPN5agAr5VVuKfkA_uMilpvfEH9JA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuY3RmYXNzZXRz/Lm5ldC9oNjd6N2k2/c2JqYXUvM3hhWkhD/M256RnpJU0dqcXRK/b1lTei8yMmI1YmI5/MjcxOWI0NzUzZWE4/MDNmMDA5NjNjMGQz/Zi9MZWFkZXJzaGlw/LmpwZz9mbT13ZWJw/JnE9ODU',
      'info': 'Pinterest Board: Creative App Designs',
    },
    {
      'type': 'website',
      'favicon':
          'https://imgs.search.brave.com/kDDgSOIq6wO3aP-sBFtDSR1YhY5QJ21rw2rWP9dXn8E/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4t/MS53ZWJjYXRhbG9n/LmlvL2NhdGFsb2cv/ZGFydHBhZC9kYXJ0/cGFkLWljb24tZmls/bGVkLTI1Ni5wbmc_/dj0xNzE0Nzc0MDg4/MjUy',
      'title': 'Dart API Reference',
      'description': 'Comprehensive API reference for Dart programming.',
    },
  ];

  void incrementCounter() {
    notifyListeners();
  }
}
