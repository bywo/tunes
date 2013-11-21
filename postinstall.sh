echo "---------> Running frontend bootstrappage"

cp -r node_modules webapp
cd webapp
bower install

grunt dist
cp -r dist/assets ../public
