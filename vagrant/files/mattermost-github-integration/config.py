# Vagrant Mattermost
# (c) 2016 Ian Dennis Miller
# http://github.com/iandennismiller/vagrant-mattermost

USERNAME = "Github"
ICON_URL = ""
MATTERMOST_WEBHOOK_URLS = {
    'default' : ("https://{{{ hostname }}}/hooks/{{{ mattermost_default_hook_url }}}", "off-topic"),
}
SECRET = "{{{ mattermost_secret }}}"
SHOW_AVATARS = True
