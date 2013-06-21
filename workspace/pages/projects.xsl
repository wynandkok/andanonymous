<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="data">
	<xsl:apply-templates select="project/entry"/>
</xsl:template>

<xsl:template match="project/entry">
    <xsl:choose>
       	<xsl:when test="$device-categorizr='mobile'">
       		<div class="row-fluid">
                    <div class="span12 default">
                        <div class="video-container">
                            <iframe width="100%" height="200" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="">
								<xsl:attribute name="src">
									<xsl:value-of select="project-video-embed-link"/>
									<xsl:text>?color=999999</xsl:text>
								</xsl:attribute>
							</iframe>
                        </div>
                        <h3>THE STORY</h3>
                        <div class="story">
                            <p><xsl:value-of select="project-description"/></p>
                        </div>
                    </div>
                </div>
                <div class="row-fluid">   
                    <div class="span12 default">            
                        <div class="accordion" id="accordion2">
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                                        <h3>VIEW COLLABORATORS</h3>
                                    </a>
                                </div>
                                    <div id="collapseOne" class="accordion-body collapse">
                                        <div class="accordion-inner">

                                            <xsl:for-each select="project-collaborators/item">
                                                <div class="colab" id="{collaborator-name/@handle}">
                                                    <div class="colab-img">
                                                        <img width="80px;" height="80px;">
                                                            <xsl:attribute name="src">
                                                                <xsl:value-of select="$workspace"/>
                                                                <xsl:text>/</xsl:text>
                                                                <xsl:value-of select="normalize-space(collaborator-image)"/>
                                                            </xsl:attribute>
                                                        </img>
                                                    </div>
                                                    <div class="colab-amp"></div>
                                                    <div class="colab-name"><a href="{collaborator-link}"><h4><xsl:value-of select="collaborator-name" /></h4></a></div>
                                                </div>
                                                <div class="clearfix"></div>
                                            </xsl:for-each>

                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-group">
                                    <div class="accordion-heading">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                                            <h3>UPCOMING WORK</h3>
                                        </a>
                                    </div>
                                    <div id="collapseTwo" class="accordion-body collapse">
                                        <div class="accordion-inner" align="center">
                                          <div class="coming-soon-photo-grolsch">
                                          </div>
                                          <div class="coming-soon-photo-multichoice">
                                          </div>
                                          <div class="coming-soon-photo-majorlazer">
                                          </div>  
                                        </div>
                                        <ul id="projects-list02" style="display: none;">
										    <xsl:apply-templates select="work/entry"/>
										</ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
       	</xsl:when>
       	<xsl:otherwise>
       		<div id="project" class="content">
				<div class="col-container">
					<xsl:choose>
			    		<xsl:when test="project-video-embed-link">
			    			<div class="left-col" id="{project-video-embed-link}">
			    				<h3>Working Hard</h3>
			    				<div class="multicontent">
									<iframe width="100%" height="100%" frameborder="0">
										<xsl:attribute name="src">
											<xsl:value-of select="project-video-embed-link"/>
											<xsl:text>?color=999999</xsl:text>
										</xsl:attribute>
									</iframe>
								</div>
							</div>
			    		</xsl:when>
			    		<xsl:otherwise>
			    			<div class="left-col">
			    				<h3><xsl:value-of select="project-title"/></h3>
			    				<div class="multicontent">
									<a>
										<xsl:attribute name="style">
								                <xsl:text>background: url('</xsl:text>
								                <xsl:value-of select="$workspace"/>
								                <xsl:text>/</xsl:text>
								                <xsl:value-of select="normalize-space(project-preview-image)"/>
								                <xsl:text>') #706F6F center</xsl:text>
								        </xsl:attribute>
							        </a>
							    </div>
							</div>
			    		</xsl:otherwise>
		    		</xsl:choose>
		    		<div id="workDetails" class="right-col">
						<h3>The Story</h3>
						<xsl:choose>
			    			<xsl:when test="project-collaborators">
								<div class="content-box description-container description-container-project">
									<p><xsl:value-of select="project-description"/></p>
									<br />
								</div>
								<div class="content-box collaborator-list collaborator-list-project">
									<h3>Collaborators</h3>
									<div class="scroll-list">
								       	<ul>
								        	<xsl:for-each select="project-collaborators/item">
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
						    </xsl:when>
						    <xsl:otherwise>
						    	<div class="content-box description-container description-container-project">
									<p><xsl:value-of select="project-description"/></p>
									<br />
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<script>
						(function() {
							$('#workDetails .description-container').perfectScrollbar();
		  					$('#workDetails .collaborator-list .scroll-list').perfectScrollbar();
						})();
					</script>
				</div>
				<div class="social-media">
					<a href="http://www.facebook.com/share.php?u=http%3A%2F%2Fandanonymous.com%2F%23Work" title="Share this page on facebook" class="pop share-icon share-icon-facebook"></a>
					<a href="https://twitter.com/share?url=http%3A%2F%2Fandanonymous.com%2F%23Work&amp;text=%26Anonymous%20%E2%80%94%20Home" title="Share this page on twitter" class="pop share-icon share-icon-twitter"></a>
					<a href="http://www.stumbleupon.com/submit?url=http%3A%2F%2Fandanonymous.com%2F%23Work&amp;title=%26Anonymous%20%E2%80%94%20Home" title="Share this page on stumbleupon" class="pop share-icon share-icon-stumbleupon"></a>
					<a href="http://pinterest.com/pin/create/button/?url=http%3A%2F%2Fandanonymous.com%2F%23Work&amp;media=&amp;description=" title="Share this page on pinterest" class="pop share-icon share-icon-pinterest"></a>
					<a href="mailto:?subject=%26Anonymous%20%E2%80%94%20Work&amp;body=http%3A%2F%2Fandanonymous.com%2F%23Work" title="Share this page on email" class="pop share-icon share-icon-email"></a></div>
			</div>
       	</xsl:otherwise>
    </xsl:choose>
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
				<xsl:value-of select="collaborator-link" />
			</xsl:attribute>
			<div class="collaborator-hover"></div>
		</a>
		<a href="http://{collaborator-link}"><xsl:value-of select="collaborator-name" /></a>
	</li>
</xsl:template>

</xsl:stylesheet>
	