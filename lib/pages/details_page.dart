import 'dart:async';

import 'package:assignment/controller/comic_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe/swipe.dart';

class DetailsPage extends StatefulWidget {
  final index;

  const DetailsPage({Key? key, required this.index}) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late int currentIndex;
  bool active = false;

  final ComicController _controller = Get.put(ComicController());

  String regex = "\\[|\\]{\\}";
  
  final controller = PageController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Details Page'),),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Swipe(
              onSwipeLeft: (){
                print('left');
                if(currentIndex == 19)
                {
                  Get.snackbar('', 'Reached last item');
                  setState(() {
                  });
                }
                else
                {
                  currentIndex += 1;
                  setState(() {
                  });
                }
              },
              onSwipeRight: (){
                if(currentIndex == 0)
                {
                  Get.snackbar('', 'Reached the first item');
                  setState(() {
                  });
                }
                else
                {
                  currentIndex -= 1;
                  setState(() {
                  });
                }
              },
              child: Card
                (child: Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Image.network(
                  _controller.comicList[currentIndex].img.toString(),
                  width: double.infinity,
                  fit: BoxFit.fill,),
              )
              ),
            ),
            ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                active = !active;
                setState(() {

                });
              },
              children: <ExpansionPanel>[
                ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        alignment: Alignment.centerLeft,
                        child: Text(_controller.comicList[currentIndex].title.toString(),textAlign: TextAlign.justify, style: TextStyle(

                        ),),
                      );
                    },
                    body: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      spacing: 7,
                      children: [
                        Text(_controller.comicList[currentIndex].safeTitle.toString()),
                        Text(_controller.comicList[currentIndex].transcript!.splitMapJoin(regex).toString())
                      ],
                    ),
                    isExpanded: active,
                    canTapOnHeader: true
                )
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: (){
                      if(currentIndex == 0)
                      {
                        Get.snackbar('', 'Reached the first item');
                        setState(() {
                        });
                      }
                      else
                      {
                        currentIndex -= 1;
                        setState(() {
                        });
                      }

                    },
                    child: Icon(Icons.navigate_before_outlined,
                      color: Colors.white,),
                  ),

                  FloatingActionButton(
                    onPressed: (){
                      if(currentIndex == 19)
                      {
                        Get.snackbar('', 'Reached last item');
                        setState(() {
                        });
                      }
                      else
                      {
                        currentIndex += 1;
                        setState(() {
                        });
                      }

                    },
                    child: Icon(Icons.navigate_next_outlined,
                      color: Colors.white,),
                  ),
                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}
