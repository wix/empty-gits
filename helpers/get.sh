curl --silent "https://api.github.com/orgs/$1/repos?access_token=$2&per_page=100&page=$3" | jq -r 'map(select(.size == 0 and (.updated_at | fromdate) < now - 604800)) | map("helpers/verify.sh $1 \"\(.commits_url | rtrimstr("{/sha}"))\" \"\(.html_url)\"") | .[]'
