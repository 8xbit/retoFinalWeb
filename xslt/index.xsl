<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  
  <!-- Template to match the saga element -->
  <xsl:template match="/saga">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Saga</title>    
    <link rel="icon" href="../icons/sicon.ico" type="image/x-icon"/>

        <script src="./script/script.js"></script>
        <link rel="stylesheet" href="./css/style.css"/>

      </head>
      <body>
        <header>
          <div class="top"></div>
          <nav>
            <div class="container">
              <a href="index.php" class="logo">
                <img src="./images/logo.png"/>
              </a>
              <input type="checkbox" id="menu"/>
              <label for="menu"><i class="fas fa-bars"></i></label>
              <ul class="menuList">
                <li><a href="./php/Transformations/demons souls.php">Demon's Souls</a></li>
                <li><a href="./php/Transformations/bloodborne.php">Bloodborne</a></li>
                <li><a href="./php/Transformations/eldenring.php">Elden Ring</a></li>
                <li><a href="./php/Transformations/sekiro.php">Sekiro Shadows</a></li>
                
                <div class="dropdown">
                  <a>Dark Souls</a>
                  <div class="dropdown-content">
                    <li><a href="./php/Transformations/dark souls1.php">Dark Souls I</a></li>
                    <li><a href="./php/Transformations/dark souls2.php">Dark Souls II</a></li>
                    <li><a href="./php/Transformations/dark souls3.php">Dark Souls III</a></li>
                  </div>
                </div>
                <li><a href="./html/contact.html">Contact Us</a></li>
              </ul>
            </div>
          </nav>
        </header>
        <div class="empty"></div>
        <div class="main">
          
          <h2>Last 6 Bosses Added</h2>
          <div class ="boss-card-container">
            <!-- Apply templates to select the last 6 bosses -->
            <xsl:apply-templates select="bosses/boss[position() &gt; last() - 6]">
              <xsl:sort select="@id" order="descending" data-type="number"/>
            </xsl:apply-templates>
          </div>
          
        </div>
        <footer>
          <div class="topFooter">

            

          </div>    
          
          <div class="middleFooter">
            <div class="rectangleLeft">
              <!--<img src=".png" alt="Placeholder 2"/> the idea was to add somthing here-->
            </div>
            
            <div class="rectangleRight">
              <!--<img src=".png" alt="Placeholder 2"/> the idea was to add somthing here-->
            </div>
          </div>
          
          <div class="bottomFooter">
            <p>Made with <span>&#10084;</span> in Tartanga 2023-2024</p>
          </div>
        </footer>
        
      </body>
    </html>
  </xsl:template>
  
  <!-- Template to match boss elements -->
  <xsl:template match="boss">
  

    <div class="boss-card">
    <div class="boss-title">
          <h3><xsl:value-of select="nombre"/></h3>
        </div>
      <div class="boss-image">
        <img src="{concat('images/', imagen)}" alt="{nombre}"/>
      </div>
      <div class="boss-info">
        <div class="boss-details">
          <div class="boss-game">
            <p><strong>Game:</strong> <xsl:value-of select="../../juegos/juego[@id=current()/@juego]/titulo"/></p>
          </div>
          <!--<div class="boss-desc">
            <p><strong>Lore:</strong> <xsl:value-of select="lore"/></p>
          </div> -->
          <div class="boss-location">
            <p><strong>Location:</strong> <xsl:value-of select="localizacion"/></p>
          </div>
          <div class="boss-gender">
            <p><strong>Gender:</strong> <xsl:value-of select="genero"/></p>
          </div>
          <div class="boss-weapon">
            <p><strong>Weapons:</strong>
              <xsl:for-each select="armas/arma">
                <xsl:value-of select="."/>
                <xsl:if test="position() != last()">, </xsl:if>
              </xsl:for-each>
            </p>
          </div>
        </div>
      </div>
    </div>
    
  </xsl:template>
  
</xsl:stylesheet>
