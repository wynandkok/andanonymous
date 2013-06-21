<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/navigation.xsl"/>
<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$device-categorizr='mobile'">
			<div class="mobile-content">
				<div class="logo-container">
			    	<div class="logo">
				    	<a href="/play"><div class="logo4"></div></a>
			    		<a href="/work"><div class="logo2"></div></a>
			    		<a href="/contact"><div class="logo3"></div></a>
				    </div>
			  	</div>
			    <div class="container" style="max-width:600px;">
			    	<div class="row-fluid">
			    		<div class="span12 default contact">
			        		<h3>IF YOU NEED AN IDEA FOR ANYTHING OR YOU JUST WANT TO BE FRIENDS...</h3>
			        		<div class="emaily">
			         			<a href="mailto:anonymous@andanonymous.com">anonymous@andanonymous.com</a>
			          		</div>
			          		<a href="http://www.twitter.com/andanonymous"><div class="twitter"></div></a>
			        	</div>        
			      	</div>
			    </div>
			</div>
		</xsl:when>
		<xsl:otherwise>
			<script type="text/javascript">
				(function() {
					window.location.href = "http://andanonymous.com/#contact"
				})();
			</script>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>