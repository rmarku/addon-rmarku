set -e

PUID="${PUID:-100}"
PGID="${PGID:-101}"

echo ""
echo "----------------------------------------"
echo " Starting FlexGet, using the following: "
echo "                                        "
echo "     UID: $PUID                         "
echo "     GID: $PGID                         "
echo "----------------------------------------"
echo ""

# Copy default config files
if [ ! -f "/flexget/config/config.yml" ]; then
    cp /defaults/config.yml /flexget/config/config.yml
fi

# Clear "config lock", if it exists
rm -f /flexget/config/.config-lock

# Set UID/GID of user
sed -i "s/^flexget\:x\:100\:101/flexget\:x\:$PUID\:$PGID/" /etc/passwd
sed -i "s/^flexget\:x\:101/flexget\:x\:$PGID/" /etc/group

# Set permissions
chown -R $PUID:$PGID /flexget/config

su -p -s /bin/sh flexget -c /usr/local/bin/flexget -c /flexget/config/config.yml --loglevel verbose daemon start --autoreload-config
