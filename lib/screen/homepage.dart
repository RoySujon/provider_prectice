import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prectice/screen/providerclass.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // double value = 1;
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<OneChangeProvider>(context, listen: false);
    print('123');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Provider'),
      ),
      body: Consumer<OneChangeProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.red.withOpacity(provider.value),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.amberAccent.withOpacity(provider.value),
                    ),
                  ),
                ],
              ),
              Slider(
                value: provider.value,
                min: 0,
                max: 1,
                // max: 5,
                // min: 2,
                onChanged: (val) => provider.setValue(val),
              ),
            ],
          );
        },
      ),
    );
  }
}
