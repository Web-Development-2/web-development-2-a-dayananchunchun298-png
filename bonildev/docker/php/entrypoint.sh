#!/bin/sh
set -e

# Install deps if vendor is empty
if [ ! -f "vendor/autoload.php" ]; then
    composer install --no-interaction
fi

# Run migrations
php bin/console doctrine:migrations:migrate -n --no-interaction 2>/dev/null || true

# Start server
exec php -S 0.0.0.0:8000 -t public
