<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/navigation.xsl"/>
<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$device-categorizr='mobile'">
			<div class="mobile-content">
				<div class="logo-container" style="margin-top:200px;">
			    	<div class="logo">
			    		<a href="/play"><div class="logo4"></div></a>
			    		<a href="/work"><div class="logo2"></div></a>
			    		<a href="/contact"><div class="logo3"></div></a>
			    	</div>
			    </div>
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div id="sticky_header"><a class="hidden-phone" href="http://thewallbreakers.com/culture/1357-learning-english-the-right-way" target="_blank">&amp;</a></div>
			<div class="liquid-slider"  id="slides">
				<div>
			        <div style="width:960px; margin: 0 auto;">
			        	<h2 class="title">Home</h2>
			        </div>
			    </div>
			    <div>
			        <div style="width:960px; margin: 0 auto;">
			        	<h2 class="title">tricirccirc</h2>
						<xsl:apply-templates select="tricirccirc/entry"/>
			        </div>
			    </div>
			    <div>
			        <div style="width:960px; margin: 0 auto;">
			        	<h2 class="title">Work</h2>
						<div id="projectContainer"></div>
						<h3>Work</h3>
						<ul id="projects-list" class="content coming-soon">
						    <li class="grolsch"></li>
						    <li class="multichoice"></li>
						    <li class="majorlazer"></li>
						    <li class="dawg"></li>
						</ul>
						<ul id="projects-list02" style="display: none;">
						    <xsl:apply-templates select="work/entry"/>
						 </ul>
			        </div>
			    </div> 
			    <div>
			        <div style="width:960px; margin: 0 auto;">
			        	<h2 class="title">Contact</h2>
						<div class="contact-container">
							<h4>If you need an idea for anything or you just want to be friends.</h4>
							<a class="mail-link" href="mailto:anonymous@andanonymous.com?subject=%26Anonymous" title="Share this page on email"></a>
							<a href="https://twitter.com/AndAnonymous" target="_blank" class="twitter-link"></a>
						</div>
			        </div>
			    </div>
			</div>
			<div id="mask"></div>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="tricirccirc/entry">
	<div class="col-container">
		<div class="left-col">
			<h3><xsl:value-of select="tricirccirc-title"/></h3>
			<div class="multicontent">
				<iframe width="100%" height="100%" frameborder="0">
					<xsl:attribute name="src">
						<xsl:value-of select="tricirccirc-video-link"/>
						<xsl:text>?color=999999&amp;title=1&amp;byline=1&amp;portrait=1</xsl:text>
					</xsl:attribute>
				</iframe>
			</div>
		</div>
		<div class="right-col">
			<h3>The Story</h3>
			<div class="content-box description-container">
				<p><xsl:value-of select="tricirccirc-description"/></p>
				<br />
			</div>
			<div class="content-box collaborator-list">
				<h3>Collaborators</h3>
				<div class="scroll-list">
			        <ul>
			        	<xsl:for-each select="tricirccirc-collaborators/item">
			        		<li id="{collaborator-name/@handle}" class="collaborator">
								<a target="_blank">
									<xsl:attribute name="style">
										<xsl:text>background: url('</xsl:text>
										<xsl:value-of select="$workspace"/>
										<xsl:text>/</xsl:text>
										<xsl:value-of select="normalize-space(collaborator-image)"/>
										<xsl:text>') center</xsl:text>
									</xsl:attribute>
									<xsl:attribute name="href">
										<xsl:value-of select="collaborator-link" />
									</xsl:attribute>
									<div class="collaborator-hover"></div>
								</a>
								<a href="{collaborator-link}" target="_blank"><xsl:value-of select="collaborator-name" /></a>
							</li>
			        	</xsl:for-each>
			        </ul>
			    </div>
	        </div>
		</div>
	</div>
	<div class="social-media">
		<a href="http://www.facebook.com/share.php?u=http%3A%2F%2Fandanonymous.com%2F%23tricirccirc" title="Share this page on facebook" class="pop share-icon share-icon-facebook"></a>
		<a href="https://twitter.com/share?url=http%3A%2F%2Fandanonymous.com%2F%23tricirccirc&amp;text=%26Anonymous" title="Share this page on twitter" class="pop share-icon share-icon-twitter"></a>
		<a href="http://www.stumbleupon.com/submit?url=http%3A%2F%2Fandanonymous.com%2F%23tricirccirc&amp;title=%26Anonymous" title="Share this page on stumbleupon" class="pop share-icon share-icon-stumbleupon"></a>
		<a href="http://pinterest.com/pin/create/button/?url=http%3A%2F%2Fandanonymous.com%2F%23tricirccirc&amp;media=&amp;description=" title="Share this page on pinterest" class="pop share-icon share-icon-pinterest"></a>
		<a href="mailto:?subject=%26Anonymous&amp;body=http%3A%2F%2Fandanonymous.com" title="Share this page on email" class="pop share-icon share-icon-email"></a>
	</div>
	<h3>Tri Circ Circ Photography</h3>
	<ul id="photography-list" class="content">
		<xsl:apply-templates select="/data/photography/entry" />
	</ul>
	<div class="library-nav">
		    <a class="prev" id="stills_prev" href="#"></a>
		    <a class="next" id="stills_next" href="#"></a>
	</div>
</xsl:template>

<xsl:template match="collaborators/entry">
	<li class="collaborator">
		<a target="_blank">
			<xsl:attribute name="style">
				<xsl:text>background: url('</xsl:text>
				<xsl:value-of select="$workspace"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="normalize-space(collaborator-image)"/>
				<xsl:text>')</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="href">
				<xsl:text>http://</xsl:text>
				<xsl:value-of select="collaborator-link" />
			</xsl:attribute>
		</a>
		<a href="http://{collaborator-link}" target="_blank"><xsl:value-of select="collaborator-name" /></a>
	</li>
</xsl:template>

<xsl:template match="photography/entry">
	<li id="{photo-name/@handle}">
        <a>
            <xsl:attribute name="style">
				<xsl:text>background: url('</xsl:text>
				<xsl:value-of select="$workspace"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="normalize-space(photo-resource)"/>
				<xsl:text>') center -235px</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="href">
				<xsl:value-of select="$workspace"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="normalize-space(photo-resource)"/>
			</xsl:attribute>
        </a>
    </li>
</xsl:template>

<xsl:template match="work/entry">
    <li id="{project-title/@handle}">
        <a id="{project-title/@handle}" onclick="navigateProject('{project-title/@handle}')" href="#work/{project-title/@handle}">
            <xsl:attribute name="style">
                <xsl:text>background: url('</xsl:text>
                <xsl:value-of select="$workspace"/>
                <xsl:text>/</xsl:text>
                <xsl:value-of select="normalize-space(project-preview-image)"/>
                <xsl:text>') #706F6F center</xsl:text>
            </xsl:attribute>
            <div class="meta">
                <p><xsl:value-of select="project-title"/></p>
                <p><xsl:value-of select="project-role"/></p>
            </div>
        </a>
    </li>
</xsl:template>

</xsl:stylesheet>