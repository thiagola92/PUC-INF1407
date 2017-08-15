# PUC-INF1407
Programação para a Web

## Geral

**G1**: 2 Trabalhos práticos  
**G2**: 2 Trabalhos práticos  
**M**: (G1+G2)/2  

Trabalho prático é uma prova em sala de aula com consulta ao material

**Site da Matéria**: http://cursos.meslin.com.br/home/Programao-para-a-Web

## G1

Instalar  
* [Instalar Java (JRE)](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html)  
* [Instalar servidor Web e container JSP](http://tomcat.apache.org/download-90.cgi)  
* [Instalar Eclipse EE](http://www.eclipse.org/)  

Extrair **apache-tomcat-x.x.x.zip**  

Eclipse EE > Window > Preferences > Java > Installed JREs  
Verifique se tem algum **jre** selecionado e se o Type dele está **Standard VM**  
Se não tiver  
Add > Standard VM > Directory...  
Selecione a pasta do **jre**  
Clique finish.

Eclipse EE > Window > Preferences > Server > Runtime Environments > Add... > **Apache Tomcat vx.x** > Next > Browse...  
Selecione o **apache-tomcat-x.x.x.zip**  
JRE > jrex.x.x > Finish > Apply and Close  

File > New > Other > Wizards:  
Write **web**  
Dynamic Web Project > Next > Project Name  
Give your son a name  
Next > Next > **Genereate web.xml deployment descriptor**  
