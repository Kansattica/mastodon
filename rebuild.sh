#docker-compose stop
docker-compose build
docker-compose run --rm web rails assets:precompile
docker exec mastodon_db_1 pg_dump -Fc -U postgres postgres > reload_backup.dump
docker-compose run --rm web rails db:migrate
docker-compose up -d
sudo systemctl restart nginx.service
