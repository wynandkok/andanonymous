<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
    <div class="wrapper">
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
                    <div class="container" style="max-width:600px; min-height: 600px;">
                        <div id="projectContainer"></div>
                    </div>
                    <div class="logo-container">
                        <div class="logo">
                            <a href="/play"><div class="work1"></div></a>
                            <a href="/work"><div class="work2"></div></a>
                            <a href="/contact"><div class="logo3"></div></a>
                        </div>
                    </div>
                </div>
            </xsl:when>
            <xsl:otherwise>
                 <div class="wrapper">
                <script type="text/javascript">
                    (function() {
                        window.location.href = "http://andanonymous.com/#work"
                    })();
                </script>
            </div>
            </xsl:otherwise>
        </xsl:choose>
    </div>
</xsl:template>

<xsl:template match="work/entry">
    <li id="{project-name/@handle}">
        <a id="{project-name/@handle}" onclick="navigateProject('{project-title/@handle}')" href="#work/{project-title/@handle}">
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