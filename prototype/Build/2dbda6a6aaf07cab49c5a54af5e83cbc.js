/*!
 * jQuery Tools v1.2.7 - The missing UI library for the Web
 * 
 * scrollable/scrollable.js
 * scrollable/scrollable.autoscroll.js
 * scrollable/scrollable.navigator.js
 * 
 * NO COPYRIGHTS OR LICENSES. DO WHAT YOU LIKE.
 * 
 * http://flowplayer.org/tools/
 * 
 */
(function(e){function t(e,t){var n=parseInt(e.css(t),10);if(n)return n;var r=e[0].currentStyle;return r&&r.width&&parseInt(r.width,10)}function n(t,n){var r=e(n);return r.length<2?r:t.parent().find(n)}function i(t,i){var s=this,o=t.add(s),u=t.children(),f=0,l=i.vertical;r||(r=s),u.length>1&&(u=e(i.items,t)),i.size>1&&(i.circular=!1),e.extend(s,{getConf:function(){return i},getIndex:function(){return f},getSize:function(){return s.getItems().size()},getNaviButtons:function(){return m.add(g)},getRoot:function(){return t},getItemWrap:function(){return u},getItems:function(){return u.find(i.item).not("."+i.clonedClass)},move:function(e,t){return s.seekTo(f+e,t)},next:function(e){return s.move(i.size,e)},prev:function(e){return s.move(-i.size,e)},begin:function(e){return s.seekTo(0,e)},end:function(e){return s.seekTo(s.getSize()-1,e)},focus:function(){return r=s,s},addItem:function(t){return t=e(t),i.circular?(u.children().last().before(t),u.children().first().replaceWith(t.clone().addClass(i.clonedClass))):(u.append(t),g.removeClass("disabled")),o.trigger("onAddItem",[t]),s},seekTo:function(t,n,c){t.jquery||(t*=1);if(i.circular&&t===0&&f==-1&&n!==0)return s;if(!i.circular&&t<0||t>s.getSize()||t<-1)return s;var h=t;t.jquery?t=s.getItems().index(t):h=s.getItems().eq(t);var p=e.Event("onBeforeSeek");if(!c){o.trigger(p,[t,n]);if(p.isDefaultPrevented()||!h.length)return s}var v=l?{top:-h.position().top}:{left:-h.position().left};return f=t,r=s,n===undefined&&(n=i.speed),u.animate(v,n,i.easing,c||function(){o.trigger("onSeek",[t])}),s}}),e.each(["onBeforeSeek","onSeek","onAddItem"],function(t,n){e.isFunction(i[n])&&e(s).on(n,i[n]),s[n]=function(t){return t&&e(s).on(n,t),s}});if(i.circular){var h=s.getItems().slice(-1).clone().prependTo(u),p=s.getItems().eq(1).clone().appendTo(u);h.add(p).addClass(i.clonedClass),s.onBeforeSeek(function(e,t,n){if(!e.isDefaultPrevented()){if(t==-1)return s.seekTo(h,n,function(){s.end(0)}),e.preventDefault();t==s.getSize()&&s.seekTo(p,n,function(){s.begin(0)})}});var v=t.parents().add(t).filter(function(){if(e(this).css("display")==="none")return!0});v.length?(v.show(),s.seekTo(0,0,function(){}),v.hide()):s.seekTo(0,0,function(){})}var m=n(t,i.prev).click(function(e){e.stopPropagation(),s.prev()}),g=n(t,i.next).click(function(e){e.stopPropagation(),s.next()});i.circular||(s.onBeforeSeek(function(e,t){setTimeout(function(){e.isDefaultPrevented()||(m.toggleClass(i.disabledClass,t<=0),g.toggleClass(i.disabledClass,t>=s.getSize()-1))},1)}),i.initialIndex||m.addClass(i.disabledClass)),s.getSize()<2&&m.add(g).addClass(i.disabledClass),i.mousewheel&&e.fn.mousewheel&&t.mousewheel(function(e,t){if(i.mousewheel)return s.move(t<0?1:-1,i.wheelSpeed||50),!1});if(i.touch){var y={};u[0].ontouchstart=function(e){var t=e.touches[0];y.x=t.clientX,y.y=t.clientY},u[0].ontouchmove=function(e){if(e.touches.length==1&&!u.is(":animated")){var t=e.touches[0],n=y.x-t.clientX,r=y.y-t.clientY;s[l&&r>0||!l&&n>0?"next":"prev"](),e.preventDefault()}}}i.keyboard&&e(document).on("keydown.scrollable",function(t){if(!(!i.keyboard||t.altKey||t.ctrlKey||t.metaKey||e(t.target).is(":input"))){if(i.keyboard!="static"&&r!=s)return;var n=t.keyCode;if(!(!l||n!=38&&n!=40))return s.move(n==38?-1:1),t.preventDefault();if(!l&&(n==37||n==39))return s.move(n==37?-1:1),t.preventDefault()}}),i.initialIndex&&s.seekTo(i.initialIndex,0,function(){})}e.tools=e.tools||{version:"v1.2.7"},e.tools.scrollable={conf:{activeClass:"active",circular:!1,clonedClass:"cloned",disabledClass:"disabled",easing:"swing",initialIndex:0,item:"> *",items:".items",keyboard:!0,mousewheel:!1,next:".next",prev:".prev",size:1,speed:400,vertical:!1,touch:!0,wheelSpeed:0}};var r;e.fn.scrollable=function(t){var n=this.data("scrollable");return n?n:(t=e.extend({},e.tools.scrollable.conf,t),this.each(function(){n=new i(e(this),t),e(this).data("scrollable",n)}),t.api?n:this)}})(jQuery),function(e){var t=e.tools.scrollable;t.autoscroll={conf:{autoplay:!0,interval:3e3,autopause:!0}},e.fn.autoscroll=function(n){typeof n=="number"&&(n={interval:n});var r=e.extend({},t.autoscroll.conf,n),i;return this.each(function(){function u(){s&&clearTimeout(s),s=setTimeout(function(){t.next()},r.interval)}var t=e(this).data("scrollable"),n=t.getRoot(),s,o=!1;t&&(i=t),t.play=function(){s||(o=!1,n.on("onSeek",u),u())},t.pause=function(){s=clearTimeout(s),n.off("onSeek",u)},t.resume=function(){o||t.play()},t.stop=function(){o=!0,t.pause()},r.autopause&&n.add(t.getNaviButtons()).hover(t.pause,t.resume),r.autoplay&&t.play()}),r.api?i:this}}(jQuery),function(e){function n(t,n){var r=e(n);return r.length<2?r:t.parent().find(n)}var t=e.tools.scrollable;t.navigator={conf:{navi:".navi",naviItem:null,activeClass:"active",indexed:!1,idPrefix:null,history:!1}},e.fn.navigator=function(r){typeof r=="string"&&(r={navi:r}),r=e.extend({},t.navigator.conf,r);var i;return this.each(function(){function h(e,n,r){t.seekTo(n),r.preventDefault(),f&&history.pushState({i:n},"")}function p(){return s.find(r.naviItem||"> *")}function v(t){var n=e("<"+(r.naviItem||"a")+"/>").click(function(n){h(e(this),t,n)});return t===0&&n.addClass(u),r.indexed&&n.text(t+1),r.idPrefix&&n.attr("id",r.idPrefix+t),n.appendTo(s)}var t=e(this).data("scrollable"),s=r.navi.jquery?r.navi:n(t.getRoot(),r.navi),o=t.getNaviButtons(),u=r.activeClass,f=r.history&&history.pushState,l=t.getConf().size;t&&(i=t),t.getNaviButtons=function(){return o.add(s)},f&&(history.pushState({i:0},""),e(window).on("popstate",function(e){var n=e.originalEvent.state;n&&t.seekTo(n.i)})),p().length?p().each(function(t){e(this).click(function(n){h(e(this),t,n)})}):e.each(t.getItems(),function(e){e%l==0&&v(e)}),t.onBeforeSeek(function(e,t){setTimeout(function(){if(!e.isDefaultPrevented()){var n=t/l,r=p().eq(n);r.length&&p().removeClass(u).eq(n).addClass(u)}},1)}),t.onAddItem(function(e,n){var r=t.getItems().index(n);r%l==0&&v(r)})}),r.api?i:this}}(jQuery);
;