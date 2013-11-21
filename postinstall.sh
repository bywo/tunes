echo "---------> Running frontend bootstrappage"

cp -r node_modules webapp
cd webapp
bower install

echo "HAHAHAHAHA"
echo $BUILD_ENV
if [[ $BUILD_ENV == "production" ]]; then
    echo "---------> building assets"
    grunt dist
    cp -r dist/assets ../public
fi
