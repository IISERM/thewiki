echo "Hi! Let's install a vnc server to access the server"

echo "Clean old installation, if exists"
rm -rf --interactive=never ~/vncserver
rm -rf --interactive=never tigervnc*
rm ~/startvnc

echo "Installing tigervnc..."

echo "Dowloading tigervnc"
curl -#L https://bintray.com/tigervnc/stable/download_file?file_path=tigervnc-1.11.0.x86_64.tar.gz -o tigervnc.tar.gz

echo "Extracting tigervnc"
tar xf tigervnc.tar.gz

echo "Copying files"
mkdir ~/vncserver
cp -r tigervnc-1.11.0.x86_64/usr/* ~/vncserver

echo "Download startvnc file"
curl -#L https://iiserm.github.io/server_access/startvnc.sh -o ~/startvnc.sh

echo "Cleaning files"
rm -rf --interactive=never tigervnc*

echo "Installation done"

echo "Setup vncpasswd"
echo "Enter a new passwd for connecting to vnc session."
echo "You need to enter this password when connecting from VNCViewer later"
echo "Enter n for view only passwd"

~/vncserver/bin/vncpasswd
