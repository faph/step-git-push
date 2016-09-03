[![wercker status](https://app.wercker.com/status/eebff18522810f61a9467b0cd03e095b/m "wercker status")](https://app.wercker.com/project/bykey/eebff18522810f61a9467b0cd03e095b)

# step-git-push

Commit and push a local folder to a remote git repository.

## Options

- `repo` Full repo address, for example `ssh://git@github.com:{username}/{repo}.git`
- `branch` (optional) Remote branch to commit to. Default: `master`.
- `basedir` (optional) Local directory to commit and push. Default: `./`.
- `ignore_removed_files` (optional) Whether to ignore remove files in the remote repo which are not in `basedir`. Default `false`.

## Example

```yaml
deploy:
  steps:
  - faph/git-push:
      repo: ssh://git@github.com:{username}/{repo}.git
      branch: gh-pages
      basedir: public
      ignore_removed_files: false
```

## Terms & Conditions

Copyright © 2015–2016 Wercker, Florenz A. P. Hollebrandse and contributors. Released under the terms of the [MIT License (MIT)](LICENSE).

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
