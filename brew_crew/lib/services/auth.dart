import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  User _userFormFirebaseUser(FirebaseUser user) {
    // firebaseUserのデータで取得したユーザーとuidを取得
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream (認証の変更を検出するstreamsをセットアップ)
  Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFormFirebaseUser(user));
      .map(_userFormFirebaseUser); // 上記のソースコードを簡略化
  }

  // sign in anon (匿名でサインイン)
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously(); // 匿名ログイン結果を取得する
      FirebaseUser user = result.user; // ユーザーにアクセス
      return _userFormFirebaseUser(user); // アクセスしたユーザーに取得結果を返す
    }
    catch (e){
      print(e.toString()); // console にエラー内容を文字列で表示
      return null; // 匿名ログイン結果の取得失敗
    }
  }

  // sign in with email & password (Email/Passwordでサインイン)

  // register with email & password (Email/Passwordで登録)

  // sign out (サインアウト)
  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

}