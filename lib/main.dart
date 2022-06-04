import 'package:flutter/material.dart';

main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        textTheme: Typography().black.apply(
          displayColor: Colors.greenAccent,
          bodyColor: Colors.green,
        ).copyWith(displayLarge: const TextStyle(
          color: Colors.lightGreen,
          fontSize: 35,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.8
        )

        ),
        brightness: Brightness.dark,
        iconTheme:
            const IconThemeData(size: 50, color: Colors.lime, opacity: 0.5),
      ),
      debugShowCheckedModeBanner: false,
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consistent Design with Flutter Theme Widget'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle)),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: ExampleWidget(),
        ),
      ),
    );
  }
}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'displayLarge',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          'explicit bodyMedium',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Text(
          'implicit bodyMedium',
        ),
        Text(
          'labelSmall',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
