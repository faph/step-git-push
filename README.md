[![wercker status](https://app.wercker.com/status/5a25748ef809ea822d8298ac2be1f0a2/s "wercker status")](https://app.wercker.com/project/bykey/5a25748ef809ea822d8298ac2be1f0a2)

# step-git-push

Commit and push a local directory to a remote git repository.

## Options

- `repo` Full repo address, for example `ssh://git@github.com:{username}/{repo}.git`
- `branch` (optional) Remote branch to commit to. Default: `master`.
- `basedir` (optional) Local directory to commit and push. Default: `./`.
- `ignore_removed_files` (optional) Whether to ignore remove files in the 
  remote repo which are not in `basedir`. Default `false`.

## Examples

Simple example:

```yaml
deploy:
  steps:
  - faph/git-push:
      repo: ssh://git@github.com:{username}/{repo}.git
      branch: gh-pages
      basedir: public
```

Complete `wercker.yml` file example for building a Hugo site and publishing
it to GitHub Pages:

```yaml
box: faph/hugo-box:0.17

build:
  steps:
  - script:
      name: hugo-build
      code: hugo --source="${WERCKER_SOURCE_DIR}" --verbose

publish:
  steps:
  - wercker/add-ssh-key@1.0.3:
      keyname: github_publish  # Configure key on wercker.com
      host: github.com
  - wercker/add-to-known_hosts@2.0.1:
      hostname: github.com
      fingerprint: 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48
  - faph/git-push:
      repo: ssh://git@github.com:{username}/{repo}.git
      branch: gh-pages
      basedir: public
```

## Terms & Conditions

Copyright © 2015–2016 Wercker, Florenz A. P. Hollebrandse and contributors.
Released under the terms of the [MIT License (MIT)](LICENSE).

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
