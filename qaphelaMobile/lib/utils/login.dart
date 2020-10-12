List loginPageItems = [
  {
    "title": "Login",
    "fields": [
      {
        "id": "email",
      },
      {"id": "password"},
    ]
  },
  {
    "title": "Register",
    "fields": [
      {
        "id": "email",
      },
      {"id": "password"},
      {"id": "name"},
      {"id": "surname"},
      {"id": "phoneNumber"},
      {
        "id": "address",
        "fields": {
          {"id": "street"},
          {"id": "town"},
          {"id": "city"},
          {"id": "postalCode"},
          {"id": "note"}
        }
      }
    ]
  },
];
