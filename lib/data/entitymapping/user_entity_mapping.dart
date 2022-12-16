import 'package:dio/dio.dart';

import '../../domain/entity/user/get_user_list_response.dart';
import '../../domain/entity/user/user.dart';
import '../../domain/entity/user/user_address.dart';
import '../../domain/entity/user/user_address_geo.dart';
import '../../domain/entity/user/user_company.dart';
import '../../misc/response_wrapper.dart';

extension UserEntityMapping on Response<dynamic> {
  GetUserListResponse mapFromResponseToGetUserListResponse() {
    return GetUserListResponse(
      userList: data.map<User>((response) => ResponseWrapper(response).mapToUser()).toList()
    );
  }
}

extension UserDetailEntityMapping on ResponseWrapper {
  User mapToUser() {
    return User(
      id: response['id'].toString(),
      name: response['name'],
      username: response['username'],
      email: response['email'],
      userAddress: ResponseWrapper(response["address"]).mapToUserAddress(),
      phone: response['phone'],
      website: response['website'],
      company: ResponseWrapper(response['company']).mapToUserCompany()
    );
  }
}

extension UserAddressDetailEntityMapping on ResponseWrapper {
  UserAddress mapToUserAddress() {
    return UserAddress(
      street: response["street"],
      suite: response["suite"],
      city: response["city"],
      zipcode: response["zipcode"],
      userAddressGeo: ResponseWrapper(response["geo"]).mapToUserAddressGeo()
    );
  }
}

extension UserGeoDetailEntityMapping on ResponseWrapper {
  UserAddressGeo mapToUserAddressGeo() {
    return UserAddressGeo(
      lat: double.parse(response["lat"]),
      lng: double.parse(response["lng"]),
    );
  }
}

extension UserCompanyDetailEntityMapping on ResponseWrapper {
  UserCompany mapToUserCompany() {
    return UserCompany(
      name: response["name"],
      catchPhrase: response["catchPhrase"],
      bs: response["bs"]
    );
  }
}