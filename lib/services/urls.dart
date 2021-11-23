import 'package:secured_chat_app/services/domain_url.dart';

String urlLogin = domain + "/api/v1/user/login";
String urlRegister = domain + "/api/v1/user/register";
String urlAddFriend = domain + "/api/v1/friend/addfriend";
String urlGetAddFriendRequests = domain + "/api/v1/friend/getaddfriendrequests";
String urlAcceptFriendRequests =
    domain + "/api/v1/friend/acceptaddfriendrequests";
String urlRejectFriendRequests =
    domain + "/api/v1/friend/rejectaddfriendrequests";
String urlGetFriends = domain + "/api/v1/friend/GetFriends";
String urlRemoveFriend = domain + "/api/v1/friend/RemoveFriend";
String urlSocketMainHub = domain + "/mainhub";
String urlGetMessageBox = domain + "/api/v1/message/GetMessageBox";
String urlGetMessages = domain + "/api/v1/message/GetMessages";
