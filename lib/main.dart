import 'package:flutter/material.dart';

main() => runApp(const ExampleApp());
//
// class ButtonOverlayColor implements MaterialStateProperty<Color?> {
//   @override
//   Color? resolve(Set<MaterialState> states) {
//     if (states.contains(MaterialState.hovered)) {
//       return Colors.greenAccent;
//     } else if (states.contains(MaterialState.pressed)) {
//       return Colors.lightGreenAccent;
//     }
//     return null;
//   }
// }
//
// class ButtonTextStyle implements MaterialStateProperty<TextStyle?> {
//   @override
//   TextStyle? resolve(Set<MaterialState> states) {
//     return states.contains(MaterialState.pressed)
//         ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 50)
//         : null;
//   }
// }

// class MaterialStateColor extends Color
//     implements MaterialStateProperty<Color?> {
//   MaterialStateColor(super.value);
//
//   @override
//   Color? resolve(Set<MaterialState> states) {
//     return states.contains(MaterialState.pressed) ? Colors.blue : Colors.pink;
//   }
// }

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          inputDecorationTheme: InputDecorationTheme(
            border: MaterialStateOutlineInputBorder.resolveWith((states) {
              final isFocused = states.contains(MaterialState.focused);
              final isDisabled = states.contains(MaterialState.disabled);
              final hasError = states.contains(MaterialState.error);
              final color = isDisabled
                  ? Colors.grey
                  : hasError
                      ? Colors.red
                      : Colors.yellow;
              final width = isFocused ? 2.0 : 1.0;
              return OutlineInputBorder(
                borderSide: BorderSide(color: color, width: width),
              );
            }),

            // errorStyle: TextStyle(fontStyle: FontStyle.italic),
            // floatingLabelStyle: TextStyle(
            //     fontWeight: FontWeight.bold, color: Colors.lightGreen),
            // hintStyle: TextStyle(
            //   fontStyle: FontStyle.italic,
            //   fontSize: 14,
            // ),

            // enabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.lightgreen,),),
            // focusedBorder: OutlineInputBorder(
            //     borderSide: BorderSide(color: Colors.green, width: 2)),
            // errorBorder: OutlineInputBorder(
            //     borderSide: BorderSide(color: Colors.red)),
            // focusedErrorBorder: OutlineInputBorder(
            //     borderSide: BorderSide(color: Colors.redAccent, width: 2)),
            // border: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.grey),),
            //suffixIconColor: Colors.red
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.blue,
            selectionColor: Colors.lime,
            selectionHandleColor: Colors.brown,
          ),
          scaffoldBackgroundColor: Colors.grey,
          appBarTheme: AppBarTheme(
            backgroundColor: MaterialStateColor.resolveWith((states) {
              return states.contains(MaterialState.scrolledUnder)
                  ? Colors.lime
                  : Colors.blue;
            }),
            elevation: 20.0,
            actionsIconTheme: IconThemeData(color: Colors.white),
            centerTitle: false,
          )),
      debugShowCheckedModeBanner: false,
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Consistent Design with Flutter Theme Widget'),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.account_circle)),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: ExampleWidget(),
          ),
        ),
      ),
    );
  }
}
// ThemeData(
// textTheme: Typography().black
//     .apply(
// displayColor: Colors.greenAccent,
// bodyColor: Colors.green,
// )
// .copyWith(
// displayLarge: TextStyle(
// color: Colors.lightGreen,
// fontSize: 18.0,
// fontWeight: FontWeight.bold,
// letterSpacing: 0.8,
// ),
// ),
// )
class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        TextField(
          decoration: InputDecoration(
            hintText: 'enabled',
            labelText: 'email',
            suffixIcon: Icon(Icons.email),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'enabled error',
            errorText: 'error',
            suffixIcon: Icon(Icons.error),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'disabled',
            labelText: 'disabled',
            suffixIcon: Icon(Icons.disabled_by_default),
          ),
          enabled: false,
        ),
      ],
    );
  }
}
