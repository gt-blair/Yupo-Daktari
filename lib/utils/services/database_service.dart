import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  //reference for collection
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection = FirebaseFirestore.instance.collection("groups");


  //savin user data
  Future savingUserData(String fullName, String email, String speciality, String phoneNumber) async {
    return await userCollection.doc(uid).set({
      "fullName" : fullName,
      "email" : email,
      "speciality" : speciality,
      "profilePic" : "",
      "phoneNumber" : phoneNumber,
      "uid" : uid,
      "groups":[]
    });
    //0705371846
  }

  //Getting User Data
  Future gettingUserData(String email) async {
    QuerySnapshot snapShot = await userCollection.where("email", isEqualTo: email).get();
    return snapShot;
  }

  getUserGroups() async {
    return userCollection.doc(uid).snapshots();
  }

  //creating groups
  Future createGroup(String userName, String id, String groupName) async {
    DocumentReference groupDocumentReference = await groupCollection.add({
      "groupName" : groupName,
      "groupIcon" : "",
      "admin" : "${id}_${userName}",
      "members" : [],
      "groupId" : "",
      "recentMessage" : "",
      "recentMessageSender" : "",
    });

    //Update Member
    await groupDocumentReference.update({
      "members":FieldValue.arrayUnion(["${uid}_${userName}"]),
      "groupId" : groupDocumentReference.id,
    });

    //Update the user's group value
    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference.update({
      "groups": FieldValue.arrayUnion(["${groupDocumentReference.id}_${groupName}"])
    });

  }


  //getting the chats
  getChats(String groupId) async{
    return groupCollection
        .doc(groupId)
        .collection("messages")
        .orderBy("time")
        .snapshots();
  }


  //get group Admin
  Future getGroupAdmin(String groupId) async {
    DocumentReference d = groupCollection.doc(groupId);
    DocumentSnapshot documentSnapshot = await d.get();
    return documentSnapshot['admin'];
  }

  //get Members
  getGroupMembers(groupId) async {
    return groupCollection.doc(groupId).snapshots();
  }

  //search
  searchByName(String groupName){
    return groupCollection.where("groupName", isEqualTo: groupName).get();
  }

  Future<bool> isUserJoined(String groupName, String groupId, String userName)
  async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentSnapshot documentSnapshot = await userDocumentReference.get();

    List<dynamic> groups = await documentSnapshot['groups'];
    if(groups.contains("${groupId}_${groupName}")) {
      return true;
    } else {
      return false;
    }
  }

  Future toggleGroupJoin(String groupId, String userName, String groupName) async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);

    DocumentSnapshot documentSnapshot = await userDocumentReference.get();
    List<dynamic> groups = await documentSnapshot['groups'];

    if(groups.contains("${groupId}_${groupName}")){
      await userDocumentReference.update({
        "groups":FieldValue.arrayRemove(["${groupId}_${groupName}"])
      });
      await groupDocumentReference.update({
        "members":FieldValue.arrayRemove(["${uid}_${userName}"])
      });
    } else {
      await userDocumentReference.update({
        "groups":FieldValue.arrayUnion(["${groupId}_${groupName}"])
      });
      await groupDocumentReference.update({
        "members":FieldValue.arrayUnion(["${uid}_${userName}"])
      });
    }

  }

  sendMessage(String groupId, Map<String, dynamic> chatMessageData) async {
    groupCollection.doc(groupId).collection("messages").add(chatMessageData);
    groupCollection.doc(groupId).update({
      "recentMessage":chatMessageData['message'],
      "recentMessageSender": chatMessageData['sender'],
      "recentMessageTimer" : chatMessageData['time'].toString()
    });
  }

}