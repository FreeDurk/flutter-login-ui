import 'package:http/http.dart';
import 'package:my_bud/app/authentication/model/registration_model.dart';

class AuthRepository {
  String url = 'http://localhost:3000';

  Future registration(RegistrationModel registerModel) async {
    Response response = await post(
      Uri.parse('$url/users'),
      body: {
        "firstname": registerModel.name,
        "lastname": "Amaba",
        "username": "Durrk",
        "mobile_number": "09196114506",
        "email": registerModel.email,
        "password": registerModel.password
      },
    );

    return response.body;
  }
}
