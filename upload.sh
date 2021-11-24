for filename in $(find . -name "*.msi" -o -name "*.rpm" -o -name "*.deb" -o -name "*.zip" -o -name "*.tar.gz");do
	echo "===> Uploading to GH test: ${filename}"
	gh release upload "test" "${filename}" --clobber
done
