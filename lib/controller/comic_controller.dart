import 'package:assignment/models/comic_model.dart';
import 'package:assignment/service/api_service.dart';
import 'package:get/get.dart';

class ComicController extends GetxController
{

  var isLoading = true.obs;
  List<Comic> comicList = <Comic>[].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // fetchComicList(1);
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchComicList(int index) async {
    print('controller called');
    isLoading(true);
    try {
      // print('calling');
      var comics = await ApiService().serverGetComics(index);
      print('comics: $comics');
      if (comics != null) {
        comicList.add(comics);
      }
    } finally {
      isLoading(false);
    }
  }

}