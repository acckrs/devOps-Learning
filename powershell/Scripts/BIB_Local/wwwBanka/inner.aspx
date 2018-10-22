<%@ Import Namespace="BankaIntesaWeb" %>
<%@ Import Namespace="BankaIntesaWeb.site.interfaces" %>
<%@ Import Namespace="ocp.main" %>
<%@ Import Namespace="ocp.util" %>
<%@ Import Namespace="ocp.site" %>
<%@ Page Language="C#" ValidateRequest="false" %>
<%
    try
    {
        SitePage.Init(Page);
        //if (SitePage.GetVersId(Page) == 2) Response.Redirect("/code/error.aspx");
        var pageId = SitePage.GetPageId(Page);
        SiteMenu menu = new SiteMenu(Page, pageId);
        var blackCard = menu.GetExtraParam(BasicConsts.PAGE_TYPE, SitePage.GetPageId(Page), "blackCard", false);
        var body = "";
        var isBlack = false;
        if (!string.IsNullOrEmpty(blackCard))
        {
            body = "class=\"blackcard\"";
            isBlack = true;
        }

%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <%= SitePage.GetMetaTags(Page) %>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" media="screen, projection" href="/css/general.min.css" />
    <link rel="stylesheet" type="text/css" media="screen, projection" href="/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" media="screen, projection" href="/css/fonts.min.css" />
    <link rel="stylesheet" type="text/css" media="screen, projection" href="/css/bootstrap-datepicker3.standalone.css">
    <link rel="stylesheet" type="text/css" media="screen, projection" href="/css/bootstrap-popover.css">
    <link rel="stylesheet" type="text/css" media="screen, projection" href="/css/template.min.css" />
    <link rel="stylesheet" type="text/css" media="screen, projection" href="/css/fancybox.css">
    <link rel="stylesheet" type="text/css" media="screen, projection" href="/css/jquery.mCustomScrollbar.min.css"
        data-noprefix>
    <link rel="stylesheet" type="text/css" media="screen and (min-width: 1001px) and (max-width: 4096px)"
        href="/css/desktop.min.css">
    <link rel="stylesheet" type="text/css" media="screen and (min-width: 0px) and (max-width: 1000px)"
        href="/css/mobile.min.css" />
    <link rel="stylesheet" type="text/css" media="print" href="/css/print.css" />
    <link rel="stylesheet" type="text/css" href="/css/mediaelementplayer.css" />
    <% if (isBlack) { %> 
    <link rel="stylesheet" type="text/css" media="screen, projection" href="/htdocs-blackcard/css/blackcard.css" />
    <% Server.Execute("/ocp/templates/lib/blackcard.aspx"); %>
    <% } %>
    <!--<script type="text/javascript" src="/jscript/prefixfree.min.js"></script>-->
    <!-- Java Script -->
    <script type="text/javascript" src="/jscript/modernizr.custom.js"></script>
    <script type="text/javascript" src="/jscript/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/jscript/jquery-ui-1.10.4.custom.min.js"></script>
    <script type="text/javascript" src="/jscript/jquery.ui.touch-punch.min.js"></script>
    <script type="text/javascript" src="/jscript/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="/jscript/fancySelect.js"></script>
    <script type="text/javascript" src="/jscript/easyResponsiveTabs.min.js"></script>
    <script type="text/javascript" src="/jscript/jquery.fancybox.js"></script>
    <script type="text/javascript" src="/jscript/jquery.fancybox-media.min.js"></script>
    <script type="text/javascript" src="/jscript/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="/jscript/mediaelement-and-player.min.js"></script>
    <script type="text/javascript" src="https://apis.google.com/js/client:plusone.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script type="text/javascript" src="/jscript/tools.js"></script>
    <script type="text/javascript" src="/jscript/jquery.nicefileinput.min.js"></script>
    <script type="text/javascript" src="/jscript/misc.min.js"></script>
    <link rel="shortcut icon" href="/favicon.png" type="image/x-icon" />
    <link rel="icon" href="/favicon.png" type="image/ico" />
    <!-- IE conditional CSS -->
    <!--[if IE 8]>
    <link rel="stylesheet" type="text/css" href="/css/ie8.css" media="screen"/>
    <![endif]-->
    <!--[if IE 9]>
    <link rel="stylesheet" type="text/css" href="/css/ie9.css" media="screen"/>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.min.js"></script>
    <script src="http://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
  m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-48952694-1', 'bancaintesa.rs');
        ga('send', 'pageview');
</script>
<!-- Google Tag Manager -->
<script>    (function (w, d, s, l, i) {
        w[l] = w[l] || []; w[l].push({ 'gtm.start':
new Date().getTime(), event: 'gtm.js'
        }); var f = d.getElementsByTagName(s)[0],
j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
    })(window, document, 'script', 'dataLayer', 'GTM-WSD9KVB');</script>
<!-- End Google Tag Manager -->
</head>
<body <%=body %>>
    <div class="pageWrap" id="top">
        <%
        Server.Execute("/ocp/templates/lib/header.aspx");                                        
        %>
        <div class="layout">
            <div class="gutter">
                <%
                 Server.Execute("/ocp/templates/lib/breadcrumb.aspx");
                %>
                <aside class="sideColumn">
                <span class="mobileToggler"><%=VersionLabels.Get(Page,"toggler_label")%></span>
                <div class="sideNav">
                    <%  Server.Execute("/ocp/templates/lib/side_menu.aspx"); %>
                </div><!-- /sideNav -->
              </aside>
                <section class="mainColumn" role="main">
                 <%
                    Server.Execute("/ocp/siteManager/lib/blok.aspx");
                  %>
                </section>
            </div>
        </div>
        <%
        Server.Execute("/ocp/templates/lib/footer_menu.aspx");
        Server.Execute("/ocp/templates/lib/footer.aspx");
        %>
    </div>
    <!-- /pageWrap -->
    <script>
        $(window).load(function () {
            Modernizr.load([
            //first test need for polyfill
            {
            test: window.matchMedia,
            nope: "/jscript/media.match.min.js"
        },

        //and then load enquire
            "/jscript/enquire.min.js",
            "/jscript/enquire.mics.js"
        ]);
    });
    </script>
    
</body>
</html>
<%

    }
    catch (Exception ex)
    {
        FileLogger.Log(ex);
        Response.Write(ex);
    } %>
