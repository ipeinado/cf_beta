tinymce.PluginManager.add("tabfocus",function(a){function b(a){9!==a.keyCode||a.ctrlKey||a.altKey||a.metaKey||a.preventDefault()}function c(b){function c(c){function f(a){return"BODY"===a.nodeName||"hidden"!=a.type&&"none"!=a.style.display&&"hidden"!=a.style.visibility&&f(a.parentNode)}function i(a){return/INPUT|TEXTAREA|BUTTON/.test(a.tagName)&&tinymce.get(b.id)&&-1!=a.tabIndex&&f(a)}if(h=d.select(":input:enabled,*[tabindex]:not(iframe)"),e(h,function(b,c){return b.id==a.id?(g=c,!1):void 0}),c>0){for(j=g+1;j<h.length;j++)if(i(h[j]))return h[j]}else for(j=g-1;j>=0;j--)if(i(h[j]))return h[j];return null}var g,h,i,j;if(!(9!==b.keyCode||b.ctrlKey||b.altKey||b.metaKey||b.isDefaultPrevented())&&(i=f(a.getParam("tab_focus",a.getParam("tabfocus_elements",":prev,:next"))),1==i.length&&(i[1]=i[0],i[0]=":prev"),h=b.shiftKey?":prev"==i[0]?c(-1):d.get(i[0]):":next"==i[1]?c(1):d.get(i[1]))){var k=tinymce.get(h.id||h.name);h.id&&k?k.focus():window.setTimeout(function(){tinymce.Env.webkit||window.focus(),h.focus()},10),b.preventDefault()}}var d=tinymce.DOM,e=tinymce.each,f=tinymce.explode;a.on("init",function(){a.inline&&tinymce.DOM.setAttrib(a.getBody(),"tabIndex",null),a.on("keyup",b),tinymce.Env.gecko?a.on("keypress keydown",c):a.on("keydown",c)})});
