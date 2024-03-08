<?xml version="1.0" encoding="UTF-8"?>
<!-- 
Módulo: LMSGI
UD: 04
Fecha 08/03/2024
Autor: Álvaro Calo
Tarea: Tarea Evaluativa 02
 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-system="about:legacy-compat" />
    
    <xsl:template match="/">
        
        <html lang="es">
            
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Tienda" />
                <title>Tienda</title>
            </head>
            
            <body>
                <header>
                    <img src= "../img/logotipo.png" alt="Logo" />
                    <a href="tienda.xml">Tienda</a>
                    <a href="equipos.xml">Equipos</a>
                    <a href="partidos.xml">Partidos</a>
                </header>
                
                <main class="principal">
                    
                    <xsl:apply-templates select="club_voleibol/tienda/articulo" />
                    
                </main>
                
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
        
    </xsl:template>
    
    <!-- Plantilla para mostrar los artículos -->
    <xsl:template match="articulo">
        <article>
            <section>
                <img class="articulo" src="../img/{@foto}" />	
            </section>
            <section>
                <h2><xsl:value-of select="precio"/> €</h2>
                <h3>Comentarios: <xsl:value-of select="count(comentarios)"/></h3>
                <ul>
                    <xsl:apply-templates select="comentarios" />
                </ul>
            </section>
        </article>
    </xsl:template>
    
    <!-- Plantilla para mostras los comentarios -->
    <xsl:template match="comentarios">
        <li><xsl:value-of select="@fecha"/>: <xsl:value-of select="."/></li>
    </xsl:template>
    
</xsl:stylesheet>
