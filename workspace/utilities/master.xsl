<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="page-title.xsl"/>
<xsl:import href="navigation.xsl"/>
<xsl:import href="date-time.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:variable name="is-logged-in" select="/data/logged-in-author/author"/>

<xsl:template match="/">

<html>
	<head>
		<title>
			<xsl:call-template name="page-title"/>
		</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
		<link rel="icon" type="images/png" href="{$workspace}/images/icons/bookmark.png" />
		<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/bootstrap.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/bootstrap-responsive.css" />
		<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
		<script src="{$workspace}/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/aa.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/jquery.lightbox-0.5.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/perfect-scrollbar.min.css" />
		<link rel="alternate" type="application/rss+xml" href="{$root}/rss/" />
		<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
		<script src="{$workspace}/js/jquery.easing.1.3.js"></script>
		<script src="{$workspace}/js/jquery.animate-enhanced.min.js"></script>
		<script src="{$workspace}/js/jquery.share.js"></script>
		<script src="{$workspace}/js/jquery.lightbox-0.5.js"></script>
		<script src="{$workspace}/js/perfect-scrollbar.with-mousewheel.min.js"></script>
		<script src="{$workspace}/js/jquery.carouFredSel-6.2.1-packed.js"></script>
		<script src="{$workspace}/modules/liquid-slider-hashtags.js"></script>
		<script src="{$workspace}/js/jquery.touchSwipe.min.js"></script>
		<script src="{$workspace}/js/jquery.liquid-slider.js"></script>
		<script src="{$workspace}/js/application.js"></script>
		<script>
			$(window).load(function() {
				$('#photography-list a').lightBox({
					maxHeight: 500,
		          		maxWidth: 700
				});
			});
		</script>
		<script>
			(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

			ga('create', 'UA-41643316-1', 'andanonymous.com');
			ga('send', 'pageview');
		</script>
	</head>
	<body class='no-js' style="margin:0">
		<xsl:apply-templates/>
		<!--<ul id="footer">
			<li><a href="#">Some copyright stuff, maybe?</a></li>
		</ul>-->
	</body>
</html>

</xsl:template>

</xsl:stylesheet>
