import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_app_examples/core/manager/cache/user_cache_manager.dart';
import 'package:flutter_clean_app_examples/feature/user/model/user_model.dart';


class SearchView extends StatefulWidget {
   SearchView({Key? key, required this.model}) : super(key: key);
  final ICacheManager<User> model;
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<User> _items = [];

void findAndSet(String key){
_items = widget.model.getValues()?.where((element) => element.name?.toLowerCase().contains(key.toLowerCase()) ?? false).toList() ?? [];
setState(() {
  
});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value){
            findAndSet(value);
          },
        ),
        leading: InkWell(
          child: Icon(CupertinoIcons.back),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount:_items.length ,
        itemBuilder: (((context, index) {
        return Card(
          child: ListTile(
            title: Text(_items.map((e) => '${e.name}').join('')),
          ),
        );
      }) ) ),
    );
  }
}