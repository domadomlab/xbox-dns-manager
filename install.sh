#!/bin/bash
echo "Installing Xbox DNS Switcher..."

# Copy main script
cp dns_manager.sh ~/dns_manager.sh
chmod +x ~/dns_manager.sh

# Install desktop files
mkdir -p ~/.local/share/applications
cp xbox-dns-on.desktop ~/.local/share/applications/
cp xbox-dns-off.desktop ~/.local/share/applications/
update-desktop-database ~/.local/share/applications/

# Add aliases if not present
if ! grep -q "alias don=" ~/.zshrc; then
    echo "alias don='/home/$USER/dns_manager.sh on'" >> ~/.zshrc
    echo "alias dof='/home/$USER/dns_manager.sh off'" >> ~/.zshrc
fi

echo "Done! Use 'don'/'dof' or check your applications menu."
