// 参数

// {
//   "username": "dbuser",
//   "email": "dbuser@ducafecat.tech",
//   "password": "12345678"
// }

const String GQL_USER_REGISTER = r'''

mutation UserRegister($username: String!, $email: String!, $password: String!) {
  register(input: { username: $username, email: $email, password: $password }) {
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
