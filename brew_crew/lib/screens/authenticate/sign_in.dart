import 'package:flutter/material.dart';

import '../services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  // firebase authパッケージにアクセスする変数作成
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0, // アプリバーのドロップシャドウを削除
        title: Text("Sign in Brew Crew"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: RaisedButton(
            child: Text("sign in anon"),
            onPressed: () async {
               // auth.dartで取得した匿名ログイン結果を非同期で呼び出す
               // 匿名ログインが失敗時にはno、成功時にはdatabasaユーザーとしてデータを返す
              dynamic result = await _auth.signInAnon();
              // 取得した匿名ログイン結果の判定
              if(result == null){
                print("error signing in");// ログイン失敗時にconsoleに出力
              }else{
                print("signed in"); // ログイン成功時にconsoleに出力
                print(result); // 取得した匿名ログイン結果を表示
              }
            },
          ),
        ),
    );
  }
}