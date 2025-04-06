#!/bin/sh

echo "🔁 Applying migrations..."
python manage.py migrate

echo "📦 Collecting static files..."
python manage.py collectstatic --noinput

# Wait for PostgreSQL to be ready
until pg_isready -h db -p 5432; do
  echo "⏳ Waiting for PostgreSQL to be ready..."
  sleep 2
done

echo "✅ Database is ready. Starting Django..."
echo ""

echo "🎯 Creating superuser if needed..."
python manage.py shell -c "
from django.contrib.auth import get_user_model;
User = get_user_model();
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', '', 'admin');
    print('✅ Superuser created successfully!');
else:
    print('ℹ️ Superuser already exists, skipping creation.');
"
echo ""

echo "🚀 Django is starting..."
echo "🌐 When everything is ready, go to: http://localhost:${NGINX_PORT}"
echo "🌐 When everything is ready, go to: http://localhost:${NGINX_PORT}/admin"
echo ""

# Run the Django server or any other command passed to the container
exec python manage.py "$@"
