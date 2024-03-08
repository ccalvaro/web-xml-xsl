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
                <meta name="description" content="Equipo" />
                <title>Equipo</title>
            </head>
            
            <body>
                <header>
                    <img src= "../img/logotipo.png" alt="Logo" />
                    <a href="tienda.xml">Tienda</a>
                    <a href="equipos.xml">Equipos</a>
                    <a href="partidos.xml">Partidos</a>
                </header>
                
                <main>
                    <!-- Variables para el entrenador -->
                    <xsl:variable name="nombEntrenador" select="club_voleibol/equipo/entrenador/nombre" />
                    <xsl:variable name="urlEntrenador" select="club_voleibol/equipo/entrenador/url" />
                    
                    <h1>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="$urlEntrenador"/>
                            </xsl:attribute>
                            <xsl:attribute name="target">_blank</xsl:attribute>
                            <xsl:value-of select="$nombEntrenador"/>
                        </a>
                    </h1>
                    <article class="equipos">
                        <h4><xsl:value-of select="club_voleibol/equipo/nombre"/></h4>
                        <xsl:apply-templates select="club_voleibol/equipo[@categoria='Primera']/jugadores/jugador"/>
                        
                    </article>
                </main>
                
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <!-- Plantilla para cada jugador -->
    <xsl:template match="jugador">
        <p>
            <xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/>
        </p>
    </xsl:template>
    
</xsl:stylesheet>
