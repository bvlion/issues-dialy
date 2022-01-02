## 作成

```
docker-compose run web rails new . -d postgresql --api
```

## マイグレーション

```
docker-compose exec web bundle exec rails db:create
docker-compose exec web bundle exec rails db:migrate
```