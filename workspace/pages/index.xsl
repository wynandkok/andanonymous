<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/navigation.xsl"/>
<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/get-article.xsl"/>

<xsl:template match="data">
	<div id="slides">
		<ul class="slides-container">
			<li>
			    <div id="intro" class="container">
			    </div>
			</li>
			<li>
			    <div id="tricirccirc" class="container">
			    </div>
			</li>
			<li>
			    <div id="work" class="container">
			    </div>
			</li>
			<li>
			    <div id="contact" class="container">
			    </div>
			</li>
		</ul>
		<!--<nav class="slides-navigation">
	      <a href="#" class="next">Next</a>
	      <a href="#" class="prev">Previous</a>
	    </nav>-->
	</div>
	<div id="navContainer">
            <div class="logo-container">
              <div class="logo-mark">
              </div>
              <div class="logo-nav">
                <div class="logo-text">
                </div>
                <div class="logo-tricirccirc">
                </div>
                <ul class="nav-list">
                  <li class="nav-play"><a href="#tricirccirc">play</a></li>
                  <li class="nav-work"><a href="#work">work</a></li>
                  <li class="nav-contact"><a href="#contact">contact</a></li>
                </ul>
              </div>
            </div>
    </div>
</xsl:template>

</xsl:stylesheet>