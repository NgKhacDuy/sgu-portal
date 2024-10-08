
class LoginEntity {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? refreshToken;
  String? userName;
  String? id;
  String? logtime;
  String? code;
  String? result;
  String? passtype;
  String? name;
  String? principal;
  String? idpc;
  String? roles;
  String? wcf;
  String? expires;
  String? issued;

  LoginEntity(
      {this.accessToken,
      this.tokenType,
      this.expiresIn,
      this.refreshToken,
      this.userName,
      this.id,
      this.logtime,
      this.code,
      this.result,
      this.passtype,
      this.name,
      this.principal,
      this.idpc,
      this.roles,
      this.wcf,
      this.expires,
      this.issued});

  LoginEntity.fromJson(Map<String, dynamic> json) {
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
