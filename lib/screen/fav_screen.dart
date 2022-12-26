import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prectice/provider/fav_provider.dart';
import 'package:provider_prectice/screen/favlist.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<int> selectItem = [];
  @override
  Widget build(BuildContext context) {
    // final favProvidr = Provider.of<FavoriteProvider>(context);v
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: Border.all(color: Colors.green),
        actions: [
          InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyFavoriteScreen())),
              child: Icon(Icons.favorite_border_outlined)),
          SizedBox(width: 15)
        ],
        centerTitle: true,
        title: Text('Favorite App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Consumer<FavoriteProvider>(
                builder: (context, favProvidr, child) => ListTile(
                  onTap: () {
                    if (favProvidr.selectItem.contains(index)) {
                      favProvidr.removeItem(index);
                    } else {
                      favProvidr.addItem(index);
                    }
                    // print(selectItem.toString());
                    // setState(() {});
                    // print((index + 1).toString());
                    print(favProvidr.selectItem.length);
                  },
                  title: Text('Item - ' + (index + 1).toString()),
                  trailing: Icon(favProvidr.selectItem.contains(index)
                      ? Icons.favorite
                      : Icons.favorite_border_outlined),
                ),
              ),
              itemCount: 100,
            ),
          )
        ],
      ),
    );
  }
}
