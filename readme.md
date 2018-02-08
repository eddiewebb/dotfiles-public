# Eddie's dotfiles

This project lets a user share certain dotfiles (i.e. .bash_profile, .gitconfig) or user home folders (i.e. scripts) across machiens or even team members.

Multiple 'collections' may exist in harmony

```
LIBP45P-3089053:~ n0158588$ ls -la ~
lrwxr-xr-x  1 n0158588  staff    43B Oct 27 15:26 ../.bash_profile@ -> /Users/n0158588/dotfiles/home/.bash_profile
lrwxr-xr-x  1 n0158588  staff    42B Oct 27 15:26 ../.bash_prompt@ -> /Users/n0158588/dotfiles/home/.bash_prompt
lrwxr-xr-x  1 n0158588  staff    51B Oct 27 15:26 ../.bash_secrets@ -> /Users/n0158588/dotfiles-secrets/home/.bash_secrets
...
drwxr-xr-x     7 n0158588  wheel      238 Oct 25 10:21 dotfiles  # <- git repo
drwxr-xr-x     7 n0158588  wheel      238 Oct 25 10:21 dotfiles-secrets  # <- git repo
...
```

Supports nested/overlapping folders as well.  This allows a user for instance to have both private and shared contents in a `~/scripts/` folder.

**Pro tip** Consider keybase for encrypted private git repo for sensitive files.

```
LIBP45P-31715DD:dotfiles n0158588$ ls -la ~/scripts/
lrwxr-xr-x   1 n0158588  staff    51B Oct 27 15:26 ngrok@ -> /Users/n0158588/dotfiles-secrets/home/scripts/ngrok
lrwxr-xr-x   1 n0158588  staff    46B Oct 27 15:26 proxy.sh@ -> /Users/n0158588/dotfiles/home/scripts/proxy.sh
```

# Making this your own

1) Just fork this repo as you would normally, then...
2) Replace my specific dotfiles with your own, and commit then to your fork
```
git clone [YOUR repo URL]
cd dotfiles
# remove my files entirely or selectively
rm -Rf home/* home/.*
# add your files
cp -a ~/[.dotFileToTrack] home/
cp -a ~/[.dotFileToTrackEtc] home/
# Create symlinks
bash install.sh

git commit -am"Adding my own files instead of eddies"
git push
```
3)Now use the instructions below moving forward.

# Usage

### setting up new machine (from existing repo)

```
cd ~
git clone [YOUR repo URL]
bash dotfiles/install.sh
```

### Getting remote changes

```
cd ~/dotfiles
git pull
bash install.sh
```

### sharing/saving new configs/files

```
mv [.dotfilename or folder] ~/dotfiles/home
git commit -am"added new file [.dotfilename or folder]"
git push
```
