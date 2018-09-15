<#--

    Solo - A small and beautiful blogging system written in Java.
    Copyright (c) 2010-2018, b3log.org & hacpai.com

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->
<#include "macro-head.ftl">
<#include "macro-comments.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${article.articleTitle} - ${blogTitle}">
        <meta name="keywords" content="${article.articleTags}" />
        <meta name="description" content="${article.articleAbstract?html}" />
        </@head>
        <#if previousArticlePermalink??>
            <link rel="prev" title="${previousArticleTitle}" href="${servePath}${previousArticlePermalink}">
        </#if>
        <#if nextArticlePermalink??>
            <link rel="next" title="${nextArticleTitle}" href="${servePath}${nextArticlePermalink}">
        </#if>
            <!-- Open Graph -->
            <meta property="og:locale" content="zh_CN"/>
            <meta property="og:type" content="article"/>
            <meta property="og:title" content="${article.articleTitle}"/>
            <meta property="og:description" content="${article.articleAbstract?html}"/>
            <meta property="og:image" content="${article.authorThumbnailURL}"/>
            <meta property="og:url" content="${servePath}${article.articlePermalink}"/>
            <meta property="og:site_name" content="Solo"/>
            <!-- Twitter Card -->
            <meta name="twitter:card" content="summary"/>
            <meta name="twitter:description" content="${article.articleAbstract?html}"/>
            <meta name="twitter:title" content="${article.articleTitle}"/>
            <meta name="twitter:image" content="${article.authorThumbnailURL}"/>
            <meta name="twitter:url" content="${servePath}${article.articlePermalink}"/>
            <meta name="twitter:site" content="@DL88250"/>
            <meta name="twitter:creator" content="@DL88250"/>
    </head>
    <body>
        <#include "header.ftl">
        <div class="wrapper">
            <div class="main-wrap">
                <main>
                    <article class="post">
                        <header>
                            <h1>
                                <a rel="bookmark" href="${servePath}${article.articlePermalink}">
                                    ${article.articleTitle}
                                </a>
                                <#if article.articlePutTop>
                                    <sup>
                                        ${topArticleLabel}
                                    </sup>
                                </#if>
                                <#if article.hasUpdated>
                                    <sup>
                                        ${updatedLabel}
                                    </sup>
                                </#if>
                            </h1>
                            <div class="meta">
                                <span class="tooltipped tooltipped-n" aria-label="${createDateLabel}">
                                    <i class="icon-date"></i>
                                    <time>
                                        ${article.articleCreateDate?string("yyyy-MM-dd")}
                                    </time>
                                </span>
                                                &nbsp; | &nbsp;
                                                <span class="tooltipped tooltipped-n" aria-label="${commentCountLabel}">
                                    <i class="icon-comments"></i>
                                    <a href="${servePath}${article.articlePermalink}#comments">
                                        ${article.articleCommentCount} ${commentLabel}</a>
                                </span>
                                                &nbsp; | &nbsp;
                                                <span class="tooltipped tooltipped-n" aria-label="${viewCountLabel}">
                                    <i class="icon-views"></i>
                                    ${article.articleViewCount} ${viewLabel}
                                </span>
                            </div>
                        </header>

                        <div class="content-reset">
                            ${article.articleContent}
                            <#if "" != article.articleSign.signHTML?trim>
                                <div>
                                    ${article.articleSign.signHTML}
                                </div>
                            </#if>
                        </div>

                        <footer class="tags">
                            <#list article.articleTags?split(",") as articleTag>
                                <a class="tag" rel="tag" href="${servePath}/tags/${articleTag?url('UTF-8')}">
                                    ${articleTag}</a>
                            </#list>

                            <#-- div class="copyright">
                                ${articleCP1Label}
                                <a rel="bookmark" href="${servePath}${article.articlePermalink}">
                                    ${article.articleTitle}
                                </a> -
                                <a href="${servePath}">
                                    ${blogTitle}
                                </a>
                            </div -->
                                <div style="padding: 10px 0; margin: 20px auto; width: 90%; text-align: center;">
                                <#--<div>坚持原创技术分享，您的支持将鼓励我继续创作！</div>-->
                                    <div>坚持原创技术，您的支持是对我最大的鼓励和认可！</div>
                                    <button id="rewardButton" disable="enable"
                                            onclick="var qr = document.getElementById('QR'); if (qr.style.display === 'none') {qr.style.display='block';} else {qr.style.display='none'}">
                                        <span>打赏</span>
                                    </button>
                                    <div id="QR" style="display: none;">
                                        <div id="wechat" style="display: inline-block">
                                            <a href="#" class="fancybox fancybox.image" rel="group"><img id="wechat_qr"
                                                                                                         src="http://imgs.zhenziren.com/play/180915/l0CFLH30E2.jpg?imageslim"
                                                                                                         alt="许仕鹏（tianduo4@163.com） 微信支付"></a>
                                            <p>微信支付</p>
                                        </div>
                                        <div id="alipay" style="display: inline-block">
                                            <a href="#" class="fancybox fancybox.image" rel="group"><img id="alipay_qr"
                                                                                                         src="http://imgs.zhenziren.com/play/180915/ABj4d95266.jpg?imageslim"
                                                                                                         alt="许仕鹏（tianduo4@163.com） 支付宝"></a>
                                            <p>支付宝</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="post-spread">

                                    <!-- Go to www.addthis.com/dashboard to customize your tools -->
                                    <div class="addthis_inline_share_toolbox"
                                         data-url="${servePath}${article.articlePermalink}"
                                         data-title=" ${article.articleTitle}"
                                         data-description="${article.articleAbstract?html}" style="clear: both;">
                                        <script type="text/javascript"
                                                src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5b94daf7bb0ce8c5"
                                                async="async"></script>
                                        <div id="atstbx"
                                             class="at-resp-share-element at-style-responsive addthis-smartlayers addthis-animated at4-show"
                                             aria-labelledby="at-29908123-80bc-4db2-9d6f-a4edba10b0a2" role="region">
                                            <span id="at-29908123-80bc-4db2-9d6f-a4edba10b0a2"
                                                  class="at4-visually-hidden">AddThis Sharing Buttons</span>
                                            <div class="at-share-btn-elements"><a role="button" tabindex="1"
                                                                                  class="at-icon-wrapper at-share-btn at-svc-wechat"
                                                                                  style="background-color: rgb(45, 193, 0); border-radius: 0px;"><span
                                                    class="at4-visually-hidden">Share to WeChat</span><span
                                                    class="at-icon-wrapper"
                                                    style="height: 32px; width: 32px;"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32"
                                                    version="1.1" role="img" aria-labelledby="at-svg-wechat-1"
                                                    class="at-icon at-icon-wechat"
                                                    style="fill: rgb(255, 255, 255); width: 32px; height: 32px;"><title
                                                    id="at-svg-wechat-1">WeChat</title><g><path
                                                    d="M20.285 12.248c-2.042.107-3.818.727-5.26 2.128-1.457 1.415-2.122 3.15-1.94 5.3-.798-.1-1.525-.208-2.256-.27-.254-.02-.554.01-.767.13-.71.4-1.39.854-2.198 1.36.148-.67.244-1.26.414-1.823.123-.416.066-.647-.316-.917-2.452-1.734-3.485-4.328-2.712-7 .716-2.47 2.473-3.97 4.86-4.75 3.26-1.066 6.92.022 8.902 2.613a6.113 6.113 0 0 1 1.27 3.228zM24.873 25c-.647-.288-1.24-.72-1.87-.787-.63-.066-1.292.298-1.95.365-2.005.205-3.8-.354-5.282-1.726-2.816-2.61-2.414-6.61.845-8.75 2.897-1.9 7.145-1.266 9.187 1.37 1.782 2.302 1.572 5.357-.603 7.29-.63.56-.857 1.02-.453 1.757.074.136.083.308.126.48zM10.886 11.416c.02-.49-.404-.93-.906-.944a.915.915 0 0 0-.952.886.904.904 0 0 0 .895.94.93.93 0 0 0 .963-.882zm4.904-.944c-.504.01-.93.44-.92.93a.92.92 0 0 0 .944.9.903.903 0 0 0 .91-.928.91.91 0 0 0-.934-.902zm1.722 7.39c.412 0 .75-.323.766-.73a.767.767 0 0 0-.76-.794.775.775 0 0 0-.77.79.768.768 0 0 0 .764.734zm4.745-1.523a.762.762 0 0 0-.755.728.75.75 0 0 0 .745.79c.413 0 .74-.313.755-.725a.757.757 0 0 0-.745-.794z"
                                                    fill-rule="evenodd"></path></g></svg></span></a><a role="button"
                                                                                                       tabindex="1"
                                                                                                       class="at-icon-wrapper at-share-btn at-svc-tencentqq"
                                                                                                       style="background-color: rgb(0, 0, 0); border-radius: 0px;"><span
                                                    class="at4-visually-hidden">Share to Tencent QQ</span><span
                                                    class="at-icon-wrapper"
                                                    style="height: 32px; width: 32px;"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32"
                                                    version="1.1" role="img" aria-labelledby="at-svg-tencentqq-2"
                                                    style="fill: rgb(255, 255, 255); width: 32px; height: 32px;"
                                                    class="at-icon at-icon-tencentqq"><title id="at-svg-tencentqq-2">Tencent QQ</title><g><path
                                                    d="M8.494 14.895c-.066-.155-.098-.368-.098-.638 0-.164.045-.365.135-.602.09-.237.19-.42.295-.552-.008-.18.023-.397.092-.65.07-.255.162-.43.277-.53 0-1.137.378-2.317 1.135-3.54C11.085 7.158 11.975 6.3 13 5.81c1.137-.54 2.463-.81 3.977-.81 1.09 0 2.177.225 3.266.675.4.172.77.37 1.105.59.335.22.626.45.87.687.247.237.472.516.676.835.205.32.377.622.516.908.14.287.272.633.4 1.038.126.405.23.77.312 1.098.082.33.172.73.27 1.205l.012.06c.45.68.676 1.294.676 1.842 0 .115-.037.28-.11.492-.074.21-.11.367-.11.465 0 .008.005.023.017.043a.56.56 0 0 0 .043.06c.016.022.025.036.025.044.63.933 1.123 1.81 1.48 2.634a6.38 6.38 0 0 1 .533 2.56c0 .35-.08.76-.24 1.227-.16.467-.386.7-.68.7a.42.42 0 0 1-.24-.092 1.287 1.287 0 0 1-.233-.214 3.28 3.28 0 0 1-.234-.32c-.085-.13-.15-.24-.195-.325a61.17 61.17 0 0 1-.276-.533c-.01-.008-.022-.012-.038-.012l-.062.05c-.482 1.26-1.023 2.172-1.62 2.737.164.164.415.32.755.473.34.15.622.32.847.51.225.187.37.453.436.797a.816.816 0 0 0-.05.197.462.462 0 0 1-.085.22c-.524.793-1.76 1.19-3.708 1.19-.434 0-.886-.036-1.356-.11-.472-.074-.873-.156-1.204-.246-.332-.09-.76-.212-1.283-.368a4.16 4.16 0 0 0-.283-.086 2.423 2.423 0 0 0-.564-.055 6.403 6.403 0 0 1-.492-.02c-.335.37-.857.636-1.565.8a9.17 9.17 0 0 1-2.07.245c-.286 0-.568-.006-.847-.018-.278-.013-.658-.05-1.14-.11a7.404 7.404 0 0 1-1.24-.253 2.634 2.634 0 0 1-.916-.492c-.266-.22-.4-.483-.4-.785 0-.328.042-.57.124-.73.083-.16.25-.36.504-.596.09-.017.256-.07.497-.16.243-.09.445-.14.61-.147.032 0 .09-.008.17-.025.017-.016.026-.032.026-.05L9.88 23.6c-.392-.09-.834-.522-1.325-1.296-.49-.773-.79-1.414-.896-1.92l-.062-.038c-.033 0-.082.082-.148.246a2.73 2.73 0 0 1-.67.914c-.298.274-.615.428-.95.46h-.013c-.032 0-.057-.018-.073-.055-.017-.036-.037-.058-.062-.066-.188-.442-.282-.85-.282-1.228 0-2.25 1.03-4.158 3.094-5.72z"
                                                    fill-rule="evenodd"></path></g></svg></span></a><a role="button"
                                                                                                       tabindex="1"
                                                                                                       class="at-icon-wrapper at-share-btn at-svc-link"
                                                                                                       style="background-color: rgb(23, 139, 244); border-radius: 0px;"><span
                                                    class="at4-visually-hidden">Share to Copy Link</span><span
                                                    class="at-icon-wrapper"
                                                    style="height: 32px; width: 32px;"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32"
                                                    version="1.1" role="img" aria-labelledby="at-svg-link-3"
                                                    class="at-icon at-icon-link"
                                                    style="fill: rgb(255, 255, 255); width: 32px; height: 32px;"><title
                                                    id="at-svg-link-3">Copy Link</title><g><path
                                                    d="M23.476 20.663c0-.324-.114-.6-.34-.825l-2.524-2.524a1.124 1.124 0 0 0-.826-.34c-.34 0-.63.13-.873.388.024.024.1.1.23.225s.217.212.26.26c.046.05.106.126.183.23a.976.976 0 0 1 .2.644c0 .325-.113.6-.34.827-.226.226-.5.34-.825.34-.12 0-.23-.015-.332-.043a.976.976 0 0 1-.31-.158 2.89 2.89 0 0 1-.23-.182 7.506 7.506 0 0 1-.26-.26l-.226-.23c-.267.25-.4.545-.4.885 0 .322.113.597.34.824l2.5 2.512c.218.218.493.328.825.328.323 0 .598-.106.825-.316l1.784-1.772a1.11 1.11 0 0 0 .34-.813zm-8.532-8.556c0-.323-.113-.598-.34-.825l-2.5-2.512a1.124 1.124 0 0 0-.825-.34c-.316 0-.59.11-.826.328L8.67 10.53a1.11 1.11 0 0 0-.34.813c0 .323.113.598.34.825l2.524 2.524c.22.22.494.328.825.328.34 0 .63-.126.873-.376-.024-.025-.1-.1-.23-.225a7.506 7.506 0 0 1-.26-.262 2.89 2.89 0 0 1-.183-.23.976.976 0 0 1-.2-.644c0-.323.113-.598.34-.825.226-.227.5-.34.824-.34a.976.976 0 0 1 .643.2c.106.077.183.137.23.182.05.044.137.13.262.26s.2.207.224.23c.267-.25.4-.545.4-.885zm10.862 8.556c0 .97-.344 1.792-1.032 2.464L22.99 24.9c-.67.67-1.492 1.006-2.463 1.006-.98 0-1.805-.344-2.476-1.032l-2.5-2.512c-.67-.67-1.006-1.493-1.006-2.463 0-.997.356-1.842 1.068-2.538l-1.068-1.068c-.696.712-1.538 1.068-2.525 1.068-.97 0-1.797-.34-2.476-1.02L7.02 13.82C6.34 13.138 6 12.314 6 11.343c0-.97.344-1.792 1.032-2.464l1.784-1.773c.67-.67 1.492-1.007 2.463-1.007.978 0 1.803.344 2.475 1.032l2.5 2.512c.67.67 1.007 1.492 1.007 2.463 0 .995-.356 1.84-1.068 2.537l1.068 1.068c.696-.712 1.537-1.068 2.524-1.068.97 0 1.797.34 2.476 1.02l2.524 2.523c.68.68 1.02 1.505 1.02 2.476z"
                                                    fill-rule="evenodd"></path></g></svg></span></a><a role="button"
                                                                                                       tabindex="1"
                                                                                                       class="at-icon-wrapper at-share-btn at-svc-sinaweibo"
                                                                                                       style="background-color: rgb(230, 22, 45); border-radius: 0px;"><span
                                                    class="at4-visually-hidden">Share to Sina Weibo</span><span
                                                    class="at-icon-wrapper"
                                                    style="height: 32px; width: 32px;"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32"
                                                    version="1.1" role="img" aria-labelledby="at-svg-sinaweibo-4"
                                                    style="fill: rgb(255, 255, 255); width: 32px; height: 32px;"
                                                    class="at-icon at-icon-sinaweibo"><title id="at-svg-sinaweibo-4">Sina Weibo</title><g><g
                                                    fill-rule="evenodd"></g><path
                                                    d="M14.24 23.808c-3.64.367-6.785-1.307-7.022-3.734-.236-2.43 2.525-4.693 6.164-5.06 3.642-.367 6.786 1.307 7.02 3.734.24 2.43-2.522 4.696-6.16 5.06m7.28-8.063c-.31-.096-.523-.157-.362-.57.352-.898.39-1.672.006-2.227-.713-1.036-2.667-.98-4.907-.028 0 0-.705.312-.523-.253.343-1.125.29-2.065-.243-2.61-1.214-1.238-4.446.045-7.216 2.86C6.205 15.023 5 17.26 5 19.192c0 3.694 4.664 5.942 9.226 5.942 5.98 0 9.96-3.53 9.96-6.333.003-1.695-1.402-2.657-2.665-3.055M25.494 8.983a5.76 5.76 0 0 0-5.542-1.823.855.855 0 0 0-.646 1.015.84.84 0 0 0 1 .657c1.398-.303 2.912.138 3.938 1.295a4.254 4.254 0 0 1 .865 4.113c-.144.45.1.93.542 1.076a.84.84 0 0 0 1.06-.55v-.002a5.973 5.973 0 0 0-1.218-5.78"></path><path
                                                    d="M23.276 11.018a2.8 2.8 0 0 0-2.698-.885.74.74 0 0 0-.56.876c.086.396.472.65.86.563.467-.102.977.046 1.32.432.343.388.437.915.29 1.378a.742.742 0 0 0 .466.928.724.724 0 0 0 .913-.474c.3-.947.113-2.026-.59-2.818M14.44 19.41c-.126.223-.408.328-.627.235-.218-.09-.285-.34-.16-.555.127-.215.397-.32.612-.234.22.08.298.33.176.555m-1.16 1.512c-.353.57-1.11.82-1.676.558-.56-.26-.726-.922-.374-1.48.35-.555 1.078-.802 1.642-.56.57.25.753.905.407 1.482m1.322-4.04c-1.733-.46-3.69.42-4.443 1.97-.77 1.583-.025 3.34 1.723 3.914 1.815.595 3.95-.318 4.695-2.023.734-1.67-.182-3.39-1.976-3.86"></path></g></svg></span></a><a
                                                    role="button" tabindex="1"
                                                    class="at-icon-wrapper at-share-btn at-svc-email"
                                                    style="background-color: rgb(132, 132, 132); border-radius: 0px;"><span
                                                    class="at4-visually-hidden">Share to 電子郵件</span><span
                                                    class="at-icon-wrapper"
                                                    style="height: 32px; width: 32px;"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32"
                                                    version="1.1" role="img" aria-labelledby="at-svg-email-5"
                                                    style="fill: rgb(255, 255, 255); width: 32px; height: 32px;"
                                                    class="at-icon at-icon-email"><title
                                                    id="at-svg-email-5">Email</title><g><g fill-rule="evenodd"></g><path
                                                    d="M27 22.757c0 1.24-.988 2.243-2.19 2.243H7.19C5.98 25 5 23.994 5 22.757V13.67c0-.556.39-.773.855-.496l8.78 5.238c.782.467 1.95.467 2.73 0l8.78-5.238c.472-.28.855-.063.855.495v9.087z"></path><path
                                                    d="M27 9.243C27 8.006 26.02 7 24.81 7H7.19C5.988 7 5 8.004 5 9.243v.465c0 .554.385 1.232.857 1.514l9.61 5.733c.267.16.8.16 1.067 0l9.61-5.733c.473-.283.856-.96.856-1.514v-.465z"></path></g></svg></span></a><a
                                                    role="button" tabindex="1"
                                                    class="at-icon-wrapper at-share-btn at-svc-tencentweibo"
                                                    style="background-color: rgb(49, 158, 221); border-radius: 0px;"><span
                                                    class="at4-visually-hidden">Share to Tencent Weibo</span><span
                                                    class="at-icon-wrapper"
                                                    style="height: 32px; width: 32px;"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32"
                                                    version="1.1" role="img" aria-labelledby="at-svg-tencentweibo-6"
                                                    style="fill: rgb(255, 255, 255); width: 32px; height: 32px;"
                                                    class="at-icon at-icon-tencentweibo"><title
                                                    id="at-svg-tencentweibo-6">Tencent Weibo</title><g><path
                                                    d="M22.973 16.124c.374-.208.628-.62.628-1.093 0-.682-.53-1.235-1.183-1.235s-1.183.553-1.183 1.236c0 .648.475 1.18 1.08 1.233.967 2.35 2.886 4.18 5.26 4.948a.326.326 0 0 0 .41-.225.346.346 0 0 0-.215-.43c-2.147-.693-3.89-2.327-4.797-4.43zm-13.718-2.68a2.59 2.59 0 0 1-.137-.834c0-1.378 1.07-2.494 2.387-2.494 1.32 0 2.388 1.116 2.388 2.494 0 1.377-1.07 2.494-2.388 2.494a2.32 2.32 0 0 1-1.562-.608c-2.372 2.606-3.75 6.09-3.75 9.814 0 .343.012.683.035 1.022a.615.615 0 0 1-.553.666.606.606 0 0 1-.638-.578A16.412 16.412 0 0 1 5 24.31c0-4.142 1.567-8.01 4.255-10.865zm.512 5.54a6.078 6.078 0 0 0 1.68.236c3.493 0 6.325-2.96 6.325-6.61 0-3.65-2.832-6.61-6.326-6.61C7.952 6 5.12 8.96 5.12 12.61c0 .965.198 1.9.576 2.76.138.313.492.45.79.306.3-.144.432-.515.294-.827a5.543 5.543 0 0 1-.467-2.24c0-2.962 2.298-5.363 5.133-5.363 2.834 0 5.132 2.4 5.132 5.363 0 2.962-2.298 5.363-5.132 5.363-.466 0-.923-.065-1.363-.19a.594.594 0 0 0-.733.435c-.088.332.1.675.417.766zm15.334-1.39c.582-.68.908-1.56.908-2.49 0-2.066-1.603-3.74-3.58-3.74-1.978 0-3.582 1.674-3.582 3.74 0 2.066 1.604 3.742 3.58 3.742.166 0 .3-.14.3-.312a.305.305 0 0 0-.3-.312c-1.647 0-2.983-1.396-2.983-3.118s1.336-3.118 2.984-3.118c1.65 0 2.985 1.396 2.985 3.118 0 .776-.272 1.507-.757 2.074-.11.13-.098.326.025.44a.29.29 0 0 0 .42-.025z"
                                                    fill-rule="evenodd"></path></g></svg></span></a><a role="button"
                                                                                                       tabindex="1"
                                                                                                       class="at-icon-wrapper at-share-btn at-svc-google_plusone_share"
                                                                                                       style="background-color: rgb(220, 78, 65); border-radius: 0px;"><span
                                                    class="at4-visually-hidden">Share to Google+</span><span
                                                    class="at-icon-wrapper"
                                                    style="height: 32px; width: 32px;"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32"
                                                    version="1.1" role="img"
                                                    aria-labelledby="at-svg-google_plusone_share-7"
                                                    style="fill: rgb(255, 255, 255); width: 32px; height: 32px;"
                                                    class="at-icon at-icon-google_plusone_share"><title
                                                    id="at-svg-google_plusone_share-7">Google+</title><g><path
                                                    d="M12 15v2.4h3.97c-.16 1.03-1.2 3.02-3.97 3.02-2.39 0-4.34-1.98-4.34-4.42s1.95-4.42 4.34-4.42c1.36 0 2.27.58 2.79 1.08l1.9-1.83C15.47 9.69 13.89 9 12 9c-3.87 0-7 3.13-7 7s3.13 7 7 7c4.04 0 6.72-2.84 6.72-6.84 0-.46-.05-.81-.11-1.16H12zm15 0h-2v-2h-2v2h-2v2h2v2h2v-2h2v-2z"
                                                    fill-rule="evenodd"></path></g></svg></span></a><a role="button"
                                                                                                       tabindex="1"
                                                                                                       class="at-icon-wrapper at-share-btn at-svc-compact"
                                                                                                       style="background-color: rgb(255, 101, 80); border-radius: 0px;"><span
                                                    class="at4-visually-hidden">Share to 更多...</span><span
                                                    class="at-icon-wrapper"
                                                    style="height: 32px; width: 32px;"><svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32"
                                                    version="1.1" role="img" aria-labelledby="at-svg-addthis-8"
                                                    style="fill: rgb(255, 255, 255); width: 32px; height: 32px;"
                                                    class="at-icon at-icon-addthis"><title
                                                    id="at-svg-addthis-8">Addthis</title><g><path
                                                    d="M18 14V8h-4v6H8v4h6v6h4v-6h6v-4h-6z" fill-rule="evenodd"></path></g></svg></span></a>
                                            </div>
                                        </div>
                                    </div>


                                </div>

                            <div class="rel fn-clear">
                                <#if previousArticlePermalink??>
                                    <a href="${servePath}${previousArticlePermalink}" rel="prev"
                                       class="fn-left tooltipped tooltipped-n"
                                       aria-label="${previousArticleTitle}">
                                        ${previousArticleLabel}
                                    </a>
                                </#if>
                                <#if nextArticlePermalink??>
                                    <a href="${servePath}${nextArticlePermalink}" rel="next"
                                       class="fn-right tooltipped tooltipped-n"
                                       aria-label="${nextArticleTitle}">
                                        ${nextArticleLabel}
                                    </a>
                                </#if>
                            </div>
                        </footer>
                        <@comments commentList=articleComments article=article></@comments>
                        <div id="externalRelevantArticles" class="list"></div>
                        <div id="relevantArticles" class="list"></div>
                        <div id="randomArticles" class="list"></div>
                    </article>
                </main>
                <#include "side.ftl">
            </div>
        </div>
        <#include "footer.ftl">
        <@comment_script oId=article.oId>
        page.tips.externalRelevantArticlesDisplayCount = "${externalRelevantArticlesDisplayCount}";
        <#if 0 != randomArticlesDisplayCount>
        page.loadRandomArticles();
        </#if>
        <#if 0 != externalRelevantArticlesDisplayCount>
        page.loadExternalRelevantArticles("<#list article.articleTags?split(",") as articleTag>${articleTag}<#if articleTag_has_next>,</#if></#list>"
            , "<header class='title'><h2>${externalRelevantArticlesLabel}</h2></header>");
        </#if>
        <#if 0 != relevantArticlesDisplayCount>
        page.loadRelevantArticles('${article.oId}', '<h4>${relevantArticlesLabel}</h4>');
        </#if>
        </@comment_script>    
    </body>
</html>
