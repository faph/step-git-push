# step-git-push

Commits and pushes a directory to a remote repository

## Options

- `repo` Full repo address, for example `ssh://git@github.com:{username}/{repo}.git`
- `branch` Remote branch to commit to
- `basedir` Local directory to commit and push
- `clean_removed_files` (optional) Whether to remove files in the remote repo which are not in `basedir`

## Example

```yaml
deploy:
  steps:
  - faph/git-push:
      repo: ssh://git@github.com:{username}/{repo}.git
      branch: gh-pages
      basedir: public
```

## Terms & Conditions

Released under the [MIT License (MIT)](LICENSE).

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
