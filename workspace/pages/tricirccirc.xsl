<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="data">
	<div class="wrapper">
		<xsl:apply-templates select="tricirccirc/entry"/>
	</div>
</xsl:template>

<xsl:template match="tricirccirc/entry">
	<!--<h1><xsl:value-of select="$page-title"/></h1>-->
	<h2><xsl:value-of select="tricirccirc-title"/></h2>
	<div class="col-container">
		<div class="right-col">
			<div class="content-container description-container">
				<p><xsl:value-of select="tricirccirc-description"/></p>
			</div>
			<div class="content-container collaborator-list">
				<h3>Collaborators</h3>
				<div class="scroll-list">
			       	<ul>
						<xsl:apply-templates select="/data/collaborators/entry" />
			        </ul>
			    </div>
	        </div>
		</div>
		<div class="left-col">
			<iframe width="100%" height="100%" frameborder="0">
				<xsl:attribute name="src">
					<xsl:value-of select="tricirccirc-video-link"/>
					<xsl:text>?color=aea470</xsl:text>
				</xsl:attribute>
			</iframe>
		</div>
	</div>
	<div class="social-media"><a href="http://www.facebook.com/share.php?u=http%3A%2F%2Flocalhost%2F%231" title="Share this page on facebook" class="pop share-icon share-icon-facebook"></a><a href="https://twitter.com/share?url=http%3A%2F%2Flocalhost%2F%231&amp;text=%26Anonymous%20%E2%80%94%20Home" title="Share this page on twitter" class="pop share-icon share-icon-twitter"></a><a href="http://www.stumbleupon.com/submit?url=http%3A%2F%2Flocalhost%2F%231&amp;title=%26Anonymous%20%E2%80%94%20Home" title="Share this page on stumbleupon" class="pop share-icon share-icon-stumbleupon"></a><a href="http://pinterest.com/pin/create/button/?url=http%3A%2F%2Flocalhost%2F%231&amp;media=&amp;description=" title="Share this page on pinterest" class="pop share-icon share-icon-pinterest"></a><a href="mailto:?subject=%26Anonymous%20%E2%80%94%20Home" title="Share this page on email" class="pop share-icon share-icon-email"></a></div>
	<h3>Tri Circ Circ Photography</h3>
	<ul id="photography-list" class="content">
		<xsl:apply-templates select="/data/photography/entry" />
	</ul>
</xsl:template>

<xsl:template match="collaborators/entry">
	<li class="collaborator">
		<a>
			<xsl:attribute name="style">
				<xsl:text>background: url('</xsl:text>
				<xsl:value-of select="$workspace"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="normalize-space(collaborator-image)"/>
				<xsl:text>')</xsl:text>
				<!--<xsl:value-of select="$root"/>
				<xsl:text>/image/2/133/88/2/uploads/</xsl:text>
				<xsl:value-of select="image/filename"/>-->
			</xsl:attribute>
			<xsl:attribute name="href">
				<xsl:value-of select="collaborator-link" />
			</xsl:attribute>
		</a>
		<a href="http://{collaborator-link}"><xsl:value-of select="collaborator-name" /></a>
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
				<xsl:text>')</xsl:text>
				<!--<xsl:value-of select="$root"/>
				<xsl:text>/image/2/133/88/2/uploads/</xsl:text>
				<xsl:value-of select="image/filename"/>-->
			</xsl:attribute>
			<xsl:attribute name="href">
				<xsl:value-of select="$workspace"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="normalize-space(photo-resource)"/>
			</xsl:attribute>
        </a>
    </li>
</xsl:template>

</xsl:stylesheet>