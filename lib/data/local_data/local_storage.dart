import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  static final TokenService _instance = TokenService._internal();
  late final FlutterSecureStorage storage;

  factory TokenService() {
    return _instance;
  }

  TokenService._internal() {
    storage = const FlutterSecureStorage();
  }

  Future<void> saveToken({required String token}) async {
    await storage.write(key: 'token', value: token);
  }

  Future<String?> retrieveToken() async {
    final token = await storage.read(key: 'token');
    return token;
  }

  Future<void> saveResetToken({required String resetToken}) async {
    await storage.write(key: 'reset_token', value: resetToken);
  }

  Future<String?> retrieveResetToken() async {
    final resetToken = await storage.read(key: 'reset_token');
    return resetToken;
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'token');
  }

  Future<void> saveUserId({required String userId}) async {
    await storage.write(key: 'userId', value: userId);
  }

  Future<String?> retrieveUserId() async {
    final userId = await storage.read(key: 'userId');
    return userId;
  }

  Future<void> saveUserEmail({required String email}) async {
    await storage.write(key: 'email', value: email);
  }

  Future<String?> retrieveUsrEmail() async {
    final email = await storage.read(key: 'email');
    return email;
  }

    Future<void> saveUserFirstname({required String firstName}) async {
    await storage.write(key: 'firstName', value: firstName);
  }

  Future<String?> retrieveUserFirstname() async {
    final firstName = await storage.read(key: 'firstName');
    return firstName;
  }

    Future<void> saveUserLastname({required String lastName}) async {
    await storage.write(key: 'lastName', value: lastName);
  }

  Future<String?> retrieveUserLastname() async {
    final lastName = await storage.read(key: 'lastName');
    return lastName;
  }

  Future<void> saveUserPassword({required String password}) async {
    await storage.write(key: 'password', value: password);
  }

  Future<String?> retrieveUsrPassword() async {
    final password = await storage.read(key: 'password');
    return password;
  }

  Future<void> biametricsEnabled({required bool enabled}) async {
    await storage.write(key: 'enabled', value: enabled.toString());
  }

  Future<bool?> retrieveBiametricsEnabled() async {
    final enabledString = await storage.read(key: 'enabled');

    final enabled =
        enabledString != null ? enabledString.toLowerCase() == 'true' : null;
    return enabled;
  }

  Future<void> loggedIn({required bool isLogged}) async {
    await storage.write(key: 'isLogged', value: isLogged.toString());
  }

  Future<bool?> retrieveLoggedIn() async {
    final enabledString = await storage.read(key: 'isLogged');

    final isLogged =
        enabledString != null ? enabledString.toLowerCase() == 'true' : null;
    return isLogged;
  }
  // Future<String?> retrieveUserId() async {
  //   return await storage.read(key: 'userId');
  // }
}
