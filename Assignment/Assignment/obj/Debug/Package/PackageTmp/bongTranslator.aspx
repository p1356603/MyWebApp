<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bongTranslator.aspx.cs" Inherits="Assignment.bongTranslator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <div>
    <h1><a href="Home.aspx">Alex Lim's E-Learning Activities</a></h1>
    <a href="bongTranslator.aspx">Translator</a> | 
    <a href="ServerTime.html">Server Time</a> | 
    <a href="getWeather.aspx">Weather</a>
    </div><hr />
<body> 
 
<form id="form1" runat="server"> 
 
<div> 
 
<h2>My Translator</h2> 
 
<p> 
 
Enter your text in English:&nbsp; </p> 
 
<p> 
 
<asp:TextBox ID="TextBox1" runat="server" 
 
Width="198px"></asp:TextBox> 
 
</p> 
 
<p> 
 
<asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
 
Text="Translate" /> 
 
</p> 
 
<p> 
 
Here is your translation:</p> 
 
<p> 
 
<asp:Literal ID="lbl1" runat="server"></asp:Literal> 
 
</p> 
 
</div> 
 
</form></body>
</html>
