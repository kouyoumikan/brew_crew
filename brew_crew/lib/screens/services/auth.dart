import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anon (�����ŃT�C���C��)
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously(); // �������O�C�����ʂ��擾����
      FirebaseUser user = result.user; // ���[�U�[�ɃA�N�Z�X
      return user; // �擾�����������O�C�����ʂ��Ăяo�������[�U�[�ɕԂ�
    }catch (e){
      print(e.toString()); // console �ɃG���[���e�𕶎���ŕ\��
      return null; // �������O�C�����ʂ̎擾���s
    }
  }

  // sign in with email & password (Email/Password�ŃT�C���C��)

  // register with email & password (Email/Password�œo�^)

  // sign out (�T�C���A�E�g)

}