This is the configuration of my Emacs which has worked for me on MacOS 10.14.6 and Emacs 26.3. Just copy this to ~/.emacs.d and start Emacs!

You need to install TeX Live to allow for LaTeX compilation: brew cask install mactex. Install R to run R programs: brew install r.

After installation, mv .latexmkrc to ~/ to allow latexmk to continue compilation even if it encounters error.

Install Skim (pdf viewer) which allows SyncTex to jump from pdf to latex source (and vice versa). After installation, in Preferences --> Sync, click "Check for file changes" and "Reload automatically". Choose "Custom" Preset and put Command = /usr/local/bin/emacsclient and Arguments = --no-wait +%line "%file".

Install aspell: brew install aspell
