import 'package:demo/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// Define the model for the counter


// Define the main app widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Example',
      home: ChangeNotifierProvider(
        create: (context) => CounterModel(), 
        // Provide the CounterModel
        child: MyHomePage(),
      ),
    );
  }
}

// Define the home page widget
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the CounterModel provided by the ChangeNotifierProvider
    final counters = Provider.of<CounterModel>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter Value:',
            ),
           Consumer<CounterModel>(
  builder: (context, value, child) {
    return Text(
      '${value.counter}', // Display the counter value
      style: Theme.of(context).textTheme.headline4,
    );
  },
            ),

            TextButton(  onPressed: () {
        // Call the increment method of the CounterModel
           counters.increment();
        }, child:Text("Increment") ),
         TextButton(  onPressed: () {
        // Call the increment method of the CounterModel
           counters.dicrement();
        }, child:Text("Decrement") ),
        Consumer<CounterModel>(
  builder: (context, value, child) {
    return Slider(value: value.valuess, onChanged: (c){
     value.slider(c);
    },min: 10,max: 200,);
  },
            ),

            Consumer<CounterModel>(builder: (context, value, child){
              return Text("${value.valuess}");
            } )
          ],
        ),
      ),
      
    );
  }
}
