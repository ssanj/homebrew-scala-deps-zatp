# Homebrew Formula for scala-deps-zatp


A PR is created whenever there is a new release of [scala-deps-zatp](https://github.com/ssanj/scala-deps-zatp).

You can manually create a PR with:

```
 curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR_TOKEN>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/ssanj/homebrew-scala-deps-zatp/dispatches \
  -d '{"event_type":"homebrew-pr","client_payload": {"version":"<VERSION>","sha":"<SHA256>"}}'
```
