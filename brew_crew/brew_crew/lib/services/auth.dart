import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  User _userFormFirebaseUser(FirebaseUser user) {
    // firebaseUser�̃f�[�^�Ŏ擾�������[�U�[��uid���擾
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream (�F�؂̕ύX�����o����streams���Z�b�g�A�b�v)
  Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFormFirebaseUser(user));
      .map(_userFormFirebaseUser); // ��L�̃\�[�X�R�[�h���ȗ���
  }

  // sign in anon (�����ŃT�C���C��)
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously(); // �������O�C�����ʂ��擾����
      FirebaseUser user = result.user; // ���[�U�[�ɃA�N�Z�X
      return _userFormFirebaseUser(user); // �A�N�Z�X�������[�U�[�Ɏ擾���ʂ�Ԃ�
    }
    catch (e){
      print(e.toString()); // console �ɃG���[���e�𕶎���ŕ\��
      return null; // �������O�C�����ʂ̎擾���s
    }
  }

  // sign in with email & password (Email/Password�ŃT�C���C��)

  // register with email & password (Email/Password�œo�^)

  // sign out (�T�C���A�E�g)

}