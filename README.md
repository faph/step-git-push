# step-git-push

Commits and pushes a directory to a remote repository

# Options

- `repo` Full repo address, for example `https://git@github.com:{username}/{repo}`
- `branch` Remote branch to commit to
- `basedir` Local directory to commit and push
- `clean_removed_files` (optional) Whether to remove files in the remote repo which are not in `basedir`

# Example

```yaml
deploy:
  steps:
  - git-push:
      repo: https://git@github.com:{username}/{repo}
      branch: gh-pages
      basedir: public
```

# Terms & Conditions

The MIT License (MIT)
