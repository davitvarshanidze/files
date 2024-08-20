config.load_autoconfig(True)
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
c.aliases = {'w': 'session-save', 'q': 'close', 'qa': 'quit', 'wq': 'quit --save', 'wqa': 'quit --save'}
c.fonts.default_size = '14pt'
c.url.searchengines = {'DEFAULT': 'https://searx.hu/?q={}'}
c.url.start_pages = ['https://searx.hu/']
config.set("colors.webpage.darkmode.enabled", True)
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
config.set('content.local_content_can_access_remote_urls', True, 'file:///Users/lyssa/Library/Application%20Support/qutebrowser/userscripts/*')
config.set('content.local_content_can_access_file_urls', False, 'file:///Users/lyssa/Library/Application%20Support/qutebrowser/userscripts/*')
