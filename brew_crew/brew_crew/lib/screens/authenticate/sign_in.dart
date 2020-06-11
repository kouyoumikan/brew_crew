import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  // firebase auth�p�b�P�[�W�ɃA�N�Z�X����ϐ��쐬
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0, // �A�v���o�[�̃h���b�v�V���h�E���폜
        title: Text("Sign in Brew Crew"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: RaisedButton(
            child: Text("sign in anon"),
            onPressed: () async {
               // auth.dart�Ŏ擾�����������O�C�����ʂ�񓯊��ŌĂяo��
               // �������O�C�������s���ɂ�no�A�������ɂ�databasa���[�U�[�Ƃ��ăf�[�^��Ԃ�
              dynamic result = await _auth.signInAnon();
              // �擾�����������O�C�����ʂ̔���
              if(result == null){
                print("error signing in");// ���O�C�����s����console�ɏo��
              }
              else{
                print("signed in"); // ���O�C����������console�ɏo��
                print(result.uid); // �擾�����������O�C�����ʂ��o��
              }
            },
          ),
        ),
    );
  }
}