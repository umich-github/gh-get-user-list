# gh-get-enterprise-users

This tool queries the GitHub (Cloud) Enterprise API and produces a mapping of SAML identities to GitHub usernames. In some cases, we've seen GitHub not show a user in the UI that actually was linked to a SAML identity; this tool will help you find and un-link them if necessary.

## Usage

1. Obtain a GitHub personal authentication token.
   * It needs the `admin:org` and `admin:enterprise` scopes.
1. Run it to get back a tab-separated list:
```./Binaries/gh-get-enterprise-users --enterprise-slug slug-edu --auth-token ghp_your_token_here > mappings.tsv```
   * Your enterprise slug is in the GitHub URL `https://github.com/enterprises/slug-edu/...`

If you need to unlink a user you can't find, you'll need to make a URL by hand. The scheme is:
```https://github.com/enterprises/your-slug/
## Building

This tool uses the Apollo GraphQL library to do the actual querying. Apollo is built around Xcode builds, so the code generation documentation is designed around that. Instead, you need to use the Apollo CLI tools. As of June 2022 it's kind of confusing (to me, anyway) but these steps are what I used to create the API.swift file:

1. `npm install -g graphql apollo` to get the Apollo GraphQL client generator thing
1. Download the current Schema:
```apollo client:download-schema --endpoint=https://api.github.com/graphql --header="Authorization: Bearer ghp_personal_github_token_here"
```
1. Generate a new API file:
```apollo codegen:generate --target=swift --addTypename '--includes=./**/*.graphql' --localSchemaFile=schema.json API.swift```
1. `make` should construct a new binary
