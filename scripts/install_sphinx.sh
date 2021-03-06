#!/usr/bin/env bash

#------------------------------------------------------------------------------
# Install Sphinx
#------------------------------------------------------------------------------
## http://newznab.readthedocs.org/en/latest/misc/sphinx/
##  searchd: /usr/local/bin/searchd
##  indexer: /usr/local/bin/indexer
##  conf   : /Users/Newznab/Sites/newznab/db/sphinxdata/sphinx.conf

echo "Download latest Sphinx from http://sphinxsearch.com"
open http://sphinxsearch.com/

### ???
## brew install libstemmer_c
### ???

cd ~/Downloads
#curl -O http://sphinxsearch.com/files/sphinx-2.0.6-release.tar
while ( [ ! -e sphinx-2.0.6-release.tar ] )
do
    printf 'Waiting for Sphinx to be downloaded…\n' "YELLOW" $col '[WAIT]' "$RESET"
    sleep 15
done
tar xvzf sphinx-2.0.6-release.tar
cd sphinx-2.0.6-release

#./configure -prefix=/usr/local/bin --with-pgsql --with-mysql
#?? ./configure --prefix=/usr/local  --with-pgsql --with-mysql --with-libstemmer

./configure --prefix=/usr/local --with-pgsql --with-mysql
make
sudo make install

## cd /Users/Newznab/Sites/newznab/misc/sphinx
## ./nnindexer.php generate
## 
## echo "Creating Lauch Agent file:"
## cat >> /tmp/com.nnindexer.nnindexer.plist <<'EOF'
## <?xml version="1.0" encoding="UTF-8"?>
## <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
## <plist version="1.0">
## <dict>
##     <key>Label</key>
##     <string>com.nnindexer.nnindexer</string>
##     <key>ProgramArguments</key>
##     <array>
##         <string>/usr/bin/php</string>
##         <string>nnindexer.php</string>
##         <string>--daemon</string>
##     </array>
##     <key>RunAtLoad</key>
##     <true/>
##     <key>WorkingDirectory</key>
##     <string>/Users/Newznab/Sites/newznab/misc/sphinx</string>
## </dict>
## </plist>
## EOF
## mv /tmp/com.nnindexer.nnindexer.plist ~/Library/LaunchAgents/
## launchctl load ~/Library/LaunchAgents/com.nnindexer.nnindexer.plist
## 
## ./nnindexer.php daemon
## ./nnindexer.php index full all
## ./nnindexer.php index delta all
## ./nnindexer.php daemon --stop
## ./nnindexer.php daemon

#### ERR:
## WARNING: index 'releases': preload: failed to open /Users/Newznab/Sites/newznab/db/sphinxdata/releases.sph: No such file or directory; NOT SERVING
## precaching index 'releases_delta'

## /Users/Newznab/Sites/newznab/db/sphinxdata
## indexer --config /Users/Newznab/Sites/newznab/db/sphinxdata/sphinx.conf --all

## ./nnindexer.php search --index releases "some search term"

## 
## echo "-----------------------------------------------------------"
## echo "| Configure Sphinx:"
## echo "| Use Sphinx                 : Yes"
## echo "| Sphinx Configuration Path  : <full path to sphinx.conf>"
## echo "| Sphinx Binaries Path       : /usr/local/bin/"
## echo "-----------------------------------------------------------"
## open http://localhost/newznab/admin


echo "Install Sphinx complete."
#echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
