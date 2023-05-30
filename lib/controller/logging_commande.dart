import 'package:mvc_counter_app/controller/refresh_post_commande.dart';
import 'package:mvc_counter_app/controller/base_commande.dart';

class LoginCommand extends BaseCommand {
  Future<bool> run(String user, String pass) async {
    // Await some service call
    bool loginSuccess = await userService.login(user, pass);

    // Run a 2nd command if service call was successful
    if (loginSuccess) {
      await refreshPostCommande().run(user);

      // Update appModel with current user. Any views bound to this will rebuild
      appModel.currentUser = user;
    }

    return loginSuccess;
  }
}
