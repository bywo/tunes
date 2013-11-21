cp -r node_modules webapp
cd webapp
bower install

if [[ $RAILS_ENV == "production" ]]; then
    grunt dist
    cp dist/assets/* ../public/assets
fi
