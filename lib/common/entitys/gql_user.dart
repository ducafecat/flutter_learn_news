// 用户登录 - request
class GqlUserLoginRequestEntity {
  GqlUserLoginRequestEntity({
    this.identifier,
    this.password,
  });

  String identifier;
  String password;

  factory GqlUserLoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      GqlUserLoginRequestEntity(
        identifier: json["identifier"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "password": password,
      };
}

// 用户登录 - request
class GqlUserRegisterRequestEntity {
  GqlUserRegisterRequestEntity({
    this.username,
    this.email,
    this.password,
  });

  String username;
  String email;
  String password;

  factory GqlUserRegisterRequestEntity.fromJson(Map<String, dynamic> json) =>
      GqlUserRegisterRequestEntity(
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
      };
}

//////////////////////////////////////////////////////////////////

// 用户登录 - response
class GqlUserLoginResponseEntity {
  GqlUserLoginResponseEntity({
    this.jwt,
    this.user,
  });

  String jwt;
  UserEntity user;

  factory GqlUserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      GqlUserLoginResponseEntity(
        jwt: json["jwt"],
        user: UserEntity.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "jwt": jwt,
        "user": user.toJson(),
      };
}

// 注册新用户 - response
class GqlUserRegisterResponseEntity {
  GqlUserRegisterResponseEntity({
    this.jwt,
    this.user,
  });

  String jwt;
  UserEntity user;

  factory GqlUserRegisterResponseEntity.fromJson(Map<String, dynamic> json) =>
      GqlUserRegisterResponseEntity(
        jwt: json["jwt"],
        user: UserEntity.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "jwt": jwt,
        "user": user.toJson(),
      };
}

// 用户
class UserEntity {
  UserEntity({
    this.id,
    this.username,
    this.email,
    this.role,
    this.blocked,
    this.confirmed,
  });

  String id;
  String username;
  String email;
  RoleEntity role;
  bool blocked;
  bool confirmed;

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        role: RoleEntity.fromJson(json["role"]),
        blocked: json["blocked"],
        confirmed: json["confirmed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "role": role.toJson(),
        "blocked": blocked,
        "confirmed": confirmed,
      };
}

// 角色
class RoleEntity {
  RoleEntity({
    this.id,
    this.name,
    this.description,
    this.type,
  });

  String id;
  String name;
  String description;
  String type;

  factory RoleEntity.fromJson(Map<String, dynamic> json) => RoleEntity(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "type": type,
      };
}
