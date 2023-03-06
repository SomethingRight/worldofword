import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FirebaseProviderI)
class FirebaseProvider implements FirebaseProviderI {
  FirebaseFirestore databaseReference = FirebaseFirestore.instance;

  @override
  Future<String> getUserUid() async {
    final User userCredential = FirebaseAuth.instance.currentUser!;
    debugPrint('@@@ userCredential.user.uid=${userCredential.uid}');
    return userCredential.uid;
  }

  @override
  Future<UserCredential> getUser() async {
    return FirebaseAuth.instance.signInAnonymously();
  }

  @override
  Future<DocumentReference> getUserDoc() async {
    final String userId = await getUserUid();
    return databaseReference.collection('users').doc(userId);
  }

  @override
  FirebaseFirestore getDatabase() {
   return databaseReference;
  }

}

abstract class FirebaseProviderI {
  Future<String> getUserUid();

  Future<UserCredential> getUser();

  Future<DocumentReference> getUserDoc();

  FirebaseFirestore getDatabase();
}