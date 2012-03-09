<title>"Notes"</title>

<link rel="stylesheet" type="text/css" href="style.css" />

## Notes

### Gentoo GNU/Linux

* Awesome WM **3.4.9-r1** has a bug setting the background, which may cause the `awsetbg` hang forever.  Try to debug it with *Xephyr* and the default configuration `/etc/xdg/awesome/rc.lua` and `ps` to see.  To summarize:

      $ Xephyr -ac -br -noreset -screen 800x600 :1 "$@" >/dev/null & disown
      $ DISPLAY=:1.0
      $ awesome -c /etc/xdg/awesome/rc.lua
  
  In another terminal:

      $ ps aux | grep awesome

## License

![Creative Commons License][CC_BY-NC-SA_Image]

[CC_BY-NC-SA_Image]: http://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png "license"

<div><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" property="dct:title" rel="dct:type">cmpitg&#39;s page</span> by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Dương &#34;Yang&#34; ヤン Nguyễn</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/">Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License</a>.</div>
