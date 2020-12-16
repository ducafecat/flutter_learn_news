// 参数

// {
//   "identifier": "dbuser",
//   "password": "12345678"
// }

const String GQL_USER_LOGIN = r'''

mutation UserLogin($identifier: String!, $password: String!) {
  login(input: { identifier: $identifier, password: $password }) {
    jwt
    user {
      id
      username
      email
      role {
        id
        name
        description
        type
      }
      blocked
      confirmed
    }
  }
}

''';
