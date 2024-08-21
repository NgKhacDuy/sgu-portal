import 'package:sgu_portable/domain/entities/LoginEntity.dart';

class LoginModel extends LoginEntity {
  LoginModel(
      {super.accessToken,
      super.tokenType,
      super.expiresIn,
      super.refreshToken,
      super.userName,
      super.id,
      super.logtime,
      super.code,
      super.result,
      super.passtype,
      super.name,
      super.principal,
      super.idpc,
      super.roles,
      super.wcf,
      super.expires,
      super.issued});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    refreshToken = json['refresh_token'];
    userName = json['userName'];
    id = json['id'];
    logtime = json['logtime'];
    code = json['code'];
    result = json['result'];
    passtype = json['passtype'];
    name = json['name'];
    principal = json['principal'];
    idpc = json['idpc'];
    roles = json['roles'];
    wcf = json['wcf'];
    expires = json['.expires'];
    issued = json['.issued'];
  }
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['refresh_token'] = refreshToken;
    data['userName'] = userName;
    data['id'] = id;
    data['logtime'] = logtime;
    data['code'] = code;
    data['result'] = result;
    data['passtype'] = passtype;
    data['name'] = name;
    data['principal'] = principal;
    data['idpc'] = idpc;
    data['roles'] = roles;
    data['wcf'] = wcf;
    data['.expires'] = expires;
    data['.issued'] = issued;
    return data;
  }
}
