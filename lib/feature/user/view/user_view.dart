import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_app_examples/core/manager/cache/user_cache_manager.dart';
import 'package:flutter_clean_app_examples/feature/user/view_model/user_view_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../search_view.dart';
import '../model/user_model.dart';

class UserViewWidget extends StatefulWidget {
  const UserViewWidget({Key? key}) : super(key: key);

  @override
  State<UserViewWidget> createState() => _UserViewWidgetState();
}

class _UserViewWidgetState extends State<UserViewWidget> {
  late UserViewModel userViewModel;
  late final ICacheManager<User> cacheManager;
  List<User>? _items;
 
  @override
  void initState() {
    super.initState();
    userViewModel = UserViewModel();
    cacheManager = UserCacheManager('usersCacheFinaly4');
    userViewModel.fetchItem();
    fetchDatasInit();
  }

  Future<void> fetchDatasInit() async {
   await cacheManager.init();
    if (cacheManager.getValues()?.isNotEmpty ?? false) {
      _items = cacheManager.getValues();
     print("cache dolu ");
    }else{
      
      _items= userViewModel.userViewModelList;
      print("cache boş ");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return cacheManager.getValues()!.isNotEmpty  ?
    bodyView(context):
     ChangeNotifierProvider.value(
      value: userViewModel,
      child: Consumer<UserViewModel>(
          builder: ((context, value, child) => bodyViewProvider(context))),
    );
  }

  Scaffold bodyView(BuildContext context) {
    print("sükür");
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: (){
            Navigator.push<void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => SearchView(model: cacheManager,),
    ),
  );
          }, icon: Icon(CupertinoIcons.search))],
          title: const Text("Users"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          
          onPressed: () async {
             cacheManager.getValues();
          if (_items?.isNotEmpty ?? false) {
            await cacheManager.addItems(_items!);
          
          }
          }),
        body: ListView.builder(
          itemCount: _items!.length,
          itemBuilder: ((context, index) {
            return Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.account_circle_outlined),
                ),
                title: Text(
                    '${_items?[index].name}'),
              ),
            );
          }),
        ));
  }


  Scaffold bodyViewProvider(BuildContext context) {
    print("üzdü");
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: (){
            Navigator.push<void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => SearchView(model: cacheManager,),
    ),
  );
          }, icon: Icon(CupertinoIcons.search))],
          title: const Text("Users"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          
          onPressed: () async {
             cacheManager.getValues();
          if (_items?.isNotEmpty ?? false) {
            await cacheManager.addItems(_items!);
          
          }
          }),
        body: ListView.builder(
          itemCount: _items!.length,
          itemBuilder: ((context, index) {
            return Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.account_circle_outlined),
                ),
                title: Text(
                    '${_items?[index].name}'),
              ),
            );
          }),
        ));
  }
}
