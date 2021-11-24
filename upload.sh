if [[ ! -z "$DUMP" ]]; then
  tcpdump -i any -w dump &
fi

for filename in $(find . -name "*.msi" -o -name "*.rpm" -o -name "*.deb" -o -name "*.zip" -o -name "*.tar.gz");do
	echo "===> Uploading to GH $TAG: ${filename}"
	gh release upload --repo nursejason/newrelic-infrastructure-agent "${TAG}" "${filename}" --clobber
done

if [[ ! -z "$DUMP" ]]; then
  cat dump | tcpdump -n -nn -r -
fi
