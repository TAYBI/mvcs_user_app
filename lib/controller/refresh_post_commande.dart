import 'package:mvc_counter_app/controller/base_commande.dart';

class refreshPostCommande extends BaseCommand {
  Future<List<String>> run(String user) async {
    List<String> posts = await userService.getPosts(user);
    userModel.userPosts = posts;

    return posts;
  }
}
