import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  static Future<bool> isLoggedIn() async {
    // https://flutter-ko.dev/docs/cookbook/persistence/key-value
    // 주요 운영 체제 모두에 안전한 데이터 저장 플러그인
    // 이 플러그인은 안전한 저장 기능을 제공하지만 비밀번호 및 PIN 번호를 포함한 민감한 데이터를 저장하지 않는 것이 좋습니다.
    // 디스크에 키-값 데이터 저장, 읽기, 삭제
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    // If it doesn't exist, returns null.
    final accessToken = prefs.getString('accessToken') ?? '';
    return accessToken.isNotEmpty;
  }

  static Future<String> getToken() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return 'access token';
  }
}
