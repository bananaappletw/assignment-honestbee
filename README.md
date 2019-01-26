# assignment honestbee

## Demo page

http://34.80.36.164/

## Run the server

```bash
docker-compose -d
```

Server will be available at http://localhost:3000

Using devise, rolify and cancancan for user management and access control

Admin panel is under `/admin/` namespace

Only user with admin role could access the namespace

Admin could edit products under `/admin/products` url

Admin could set user as admin under `/admin/users` url

User could upgrade to premium account from `/users/edit` page by entering the current password

Image upload by active storage
