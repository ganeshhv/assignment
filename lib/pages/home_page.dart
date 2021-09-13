import 'package:assignment/controller/comic_controller.dart';
import 'package:assignment/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ComicController _controller = Get.put(ComicController());

  int index = 1;

  fetchComics() async
  {
    for(int i = 1; i <= 20; i++)
      {
        setState((){
          index = i;
        });
        await _controller.fetchComicList(index);

      }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchComics();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Comics List'),),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: _controller.comicList.length,
          itemBuilder: (context, index) {
            var date = "${_controller.comicList[index].day}/${_controller.comicList[index].month}/${_controller.comicList[index].year}";

            // var date = "${_controller.comicList[index].day}/${DateFormat.MMMM().format(DateTime.parse(_controller.comicList[index].month.toString()))}/${_controller.comicList[index].year}";
            // var dateform = DateFormat('dd/MMMM/yyyy').parse(date);
            print(date);
            return GestureDetector(
              onTap: () {
                print('index:$index');
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(index: index)));
              },
              child: Card(
                color: Colors.white12,
                child: ListTile(
                  leading: Image.network(_controller.comicList[index].img.toString(),
                  height: 60,
                      width: 60,
                      fit: BoxFit.fill,),
                  title: Text(_controller.comicList[index].title.toString()),
                  subtitle: Text(date.toString()),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
