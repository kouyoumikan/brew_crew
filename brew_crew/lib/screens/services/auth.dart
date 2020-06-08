import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anon (匿名でサインイン)
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously(); // 匿名ログイン結果を取得する
      FirebaseUser user = result.user; // ユーザーにアクセス
      return user; // 取得した匿名ログイン結果を呼び出したユーザーに返す
    }catch (e){
      print(e.toString()); // console にエラー内容を文字列で表示
      return null; // 匿名ログイン結果の取得失敗
    }
  }

  // sign in with email & password (Email/Passwordでサインイン)

  // register with email & password (Email/Passwordで登録)

  // sign out (サインアウト)

}