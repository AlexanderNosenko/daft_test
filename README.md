# Daft Test

### Deploy
* Copy database.yml
```console
foo@bar:~$ cp config/database.yml.sample config/database.yml
```
* Adjust to your local setup in database.yml
* Install gems
```console
foo@bar:~$ bundle
```
* Initialize DB
```console
foo@bar:~$ rails db:create && rails db:migrate
```
* Install foreman
```console
foo@bar:~$ gem install foreman
```
* Install redis [like this](https://medium.com/@petehouston/install-and-config-redis-on-mac-os-x-via-homebrew-eb8df9a4f298)
* Run the app
```console
foo@bar:~$ foreman start -f Procfile.dev
```
