import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1') // Replace with your Appwrite endpoint
    .setProject('67aca3cf003d564936a3')
    .setSelfSigned(status: true);

const String db = "67aca5300009565fdb81";
const String userCollection = "67aca53f001b46e61d3b";


Account account = Account(client);
final Databases databases = Databases(client);


Future<bool> savePhoneToDb({required String phoneno, required String userId}) async {
  try {
    print("Saving phone number to database...");
    final response = await databases.createDocument(
      databaseId: db,
      collectionId: userCollection,
      documentId: ID.unique(), // Fix: Use unique document ID
      data: {
        "phone_no": phoneno,
        "userId": userId,
      },
    );
    print("Document saved successfully: $response");
    return true;
  } on AppwriteException catch (e) {
    print("Cannot save to user database: $e");
    return false;
  }
}

Future<String> checkPhoneNumber({required String phoneno}) async {
  try {
    final DocumentList matchUser = await databases.listDocuments(
      databaseId: db,
      collectionId: userCollection,
      queries: [Query.equal("phone_no", phoneno)],
    );

    if (matchUser.total > 0) {
      final Document user = matchUser.documents[0];

      if (user.data["phone_no"] != null && user.data["phone_no"].toString().isNotEmpty) {
        return user.data["userId"];
      } else {
        print("No user exists in DB");
        return "user_no_exist";
      }
    } else {
      print("No user exists in DB");
      return "user_no_exist";
    }
  } on AppwriteException catch (e) {
    print("Error reading database: $e");
    return "user_not_exist";
  }
}

Future<String> createPhoneSession({required String phone}) async {
  try {
    final String userId = await checkPhoneNumber(phoneno: phone);

    if (userId == "user_no_exist") {
      // Fix: Generate a unique user ID
      final String newUserId = ID.unique();
      final Token data = await account.createPhoneToken(userId: newUserId, phone: phone);

      // Save new user to user collection
      await savePhoneToDb(phoneno: phone, userId: newUserId);
      return newUserId;
    } else {
      // Create phone token for existing user
      final Token data = await account.createPhoneToken(userId: userId, phone: phone);
      return userId;
    }
  } catch (e) {
    print('Error creating phone session: $e');
    return "login_error";
  }
}

Future<bool> loginWithOtp({required String otp, required String userId}) async {
  try {
    if (userId == "user_no_exist" || userId.isEmpty) {
      print("Invalid user ID for login.");
      return false;
    }

    final Session session = await account.updatePhoneSession(userId: userId, secret: otp);
    print("User logged in: ${session.userId}");
    return true;
  } catch (e) {
    print("Error on login with OTP: $e");
    return false;
  }
}

Future<bool> checkSession() async {
  try {
    final Session session = await account.getSession(sessionId: "current");
    print("Session exists");
    return true;
  } catch (e) {
    print("No active session found.");
    return false;
  }
}


//to logout the user
Future logoutuser()async{
  await account.deleteSessions();
}
