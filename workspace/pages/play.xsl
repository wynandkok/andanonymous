<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/navigation.xsl"/>
<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>

<xsl:template match="data">
	<div class="wrapper">
		<xsl:apply-templates select="tricirccirc/entry"/>
	</div>
</xsl:template>

<xsl:template match="tricirccirc/entry">
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
		        		<div class="span12 default">
		          			<h3>TRI-CIRC-CIRC</h3>
		          			<div class="video-container">
		            			<iframe width="100%" height="200" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="">
									<xsl:attribute name="src">
										<xsl:value-of select="tricirccirc-video-link"/>
										<xsl:text>?color=999999&amp;title=1&amp;byline=1&amp;portrait=1</xsl:text>
									</xsl:attribute>
								</iframe>
		          			</div>
		          			<h3>THE STORY</h3>
		          			<div class="story">
		            			<p><xsl:value-of select="tricirccirc-description"/></p>
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
				                        	<xsl:for-each select="tricirccirc-collaborators/item">
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
						                            <h3>VIEW PHOTOGRAPHY</h3>
						                        </a>
		                    				</div>
		                    				<div id="collapseTwo" class="accordion-body collapse">
		                        				<div class="accordion-inner photos">
		                        					<xsl:apply-templates select="/data/photography/entry" />
		                    					</div>
		                    				</div>
		                    			</div>
		                    		</div>
		                        </div>
		                    
		            </div>
		    		<div class="logo-container">
		    			<div class="logo">
		                	<a href="/play"><div class="logo1"></div></a>
		                	<a href="/work"><div class="logo2"></div></a>
		                	<a href="/contact"><div class="logo3"></div></a>
		            	</div>
		           	</div>
		        </div>
		    </div>
		</xsl:when>
		<xsl:otherwise>
			<script type="text/javascript">
				(function() {
					window.location.href = "http://andanonymous.com/#tricirccirc"
				})();
	        </script>
			<!--<div class="col-container">
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
			</div>-->
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
				<xsl:text>http://</xsl:text>
				<xsl:value-of select="collaborator-link" />
			</xsl:attribute>
		</a>
		<a href="http://{collaborator-link}" target="_blank"><xsl:value-of select="collaborator-name" /></a>
	</li>
</xsl:template>

<xsl:template match="photography/entry">
	<xsl:choose>
		<xsl:when test="$device-categorizr='mobile'">
			<img>
				<xsl:attribute name="src">
				<xsl:value-of select="$workspace"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="normalize-space(photo-resource)"/>
				</xsl:attribute>
			</img>
		</xsl:when>
		<xsl:otherwise>
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
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>