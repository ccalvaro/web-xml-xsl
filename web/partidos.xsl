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
                <meta name="description" content="Partidos" />
                <title>Partidos</title>
            </head>
            
            <body>
                <header>
                    <img src= "../img/logotipo.png" alt="Logo" />
                    <a href="tienda.xml">Tienda</a>
                    <a href="equipos.xml">Equipos</a>
                    <a href="partidos.xml">Partidos</a>
                </header>
                
                <main>
                    <h1>PARTIDOS</h1>
                    <table>
                        <tr>
                            <th>PARTIDO</th>
                            <th>FECHA</th>
                            <th>RESULTADO</th>
                        </tr>
                        <!-- For-each que muestra los datos de los equipos -->
                        <xsl:for-each select="club_voleibol/partido[lugar/@ciudad='Lima']">
                        <xsl:sort select="fecha" order="descending"/>
                            
                            <tr>
                                <td><xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/></td>
                                <td><xsl:value-of select="fecha"/></td>
                                <xsl:choose>
                                    <xsl:when test="equipos/visitante/@puntuacion &gt; equipos/local/@puntuacion">
                                        <td class="azul"><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></td>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </tr>
                            
                        </xsl:for-each>
                        
                    </table>			
                </main>
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    
</xsl:stylesheet>
