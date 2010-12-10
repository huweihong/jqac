
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />

<title>(Demo)jquery.ajaxComboBox.3.5.7.js</title>
</head>
<body>

<h2>(Demo)jquery.ajaxComboBox.3.5.7.js</h2>
<p class="date">2010/11/16</p>


<!--**************************************************** -->
<h4 id="idx_area">Contents</h4>
<ol>
	<li class="big_idx"><a href="#sample01">Basic usage</a>
	<ol>
		<li><a href="#sample01_01">Basic</a></li>
		<li><a href="#sample01_02">改变每页显示记录数以及页码个数</a></li>
		<li><a href="#sample01_03">改变记录排序顺序</a></li>
	</ol>
	</li>

	<li class="big_idx"><a href="#sample02">Display Sub-info</a>
	<ol>
		<li><a href="#sample02_01">Basic</a></li>
		<li><a href="#sample02_02">The item name of the table is
		changed.</a></li>
		<li><a href="#sample02_03">Setting of display field of
		Sub-info.</a></li>
		<li><a href="#sample02_04">Setting of hidden field of
		Sub-info.</a></li>

	</ol>
	</li>
	<li class="big_idx"><a href="#sample03">Select-only</a>
	<ol>
		<li><a href="#sample03_01">Basic</a></li>
		<li><a href="#sample03_02">Setting of Primary key.</a></li>
	</ol>

	</li>
	<li class="big_idx"><a href="#sample04">Mini-size</a>
	<ol>
		<li><a href="#sample04_01">Basic</a></li>
		<li><a href="#sample04_02">Sub-info</a></li>
		<li><a href="#sample04_03">Select-only</a></li>

	</ol>
	</li>
	<li class="big_idx"><a href="#sample05">Package</a>
	<ol>
		<li><a href="#sample05_01">Basic</a></li>
		<li><a href="#sample05_02">Sub-info</a></li>

		<li><a href="#sample05_03">Select-only</a></li>
		<li><a href="#sample05_04">Mini-size</a></li>
	</ol>
	</li>
	<li class="big_idx"><a href="#sample06">Initial Value</a>
	<ol>

		<li><a href="#sample06_01">Basic</a></li>
		<li><a href="#sample06_02">Select-only</a></li>
		<li><a href="#sample06_03">Package</a></li>
	</ol>
	</li>
	<li class="big_idx"><a href="#sample07">for CakePHP</a>

	<ol>
		<li><a href="#sample07_01">Basic</a></li>
		<li><a href="#sample07_02">for the field of foreign-key</a></li>
		<li><a href="#sample07_03">Package</a></li>
	</ol>
	</li>
</ol>
<!--**************************************************** -->

<h4 id="sample01">基本用法</h4>

<h5 id="sample01_01">基本</h5>
<p>id => id<br />
domain => 要查询的Domain Class</p>
<label for="ac01_01_1">Name:</label>

<jqac:domain id="role-id" style="width:260px;" domain="jqac.Role"/>
<code> 
	&lt;jqac:domain 
		<span class="green">id="role-id" </span>
		style="width:260px" 
		<span class="green">domain="jqac.Role"</span>
	/&gt; </code>
<p>缺省情况下，会查询指定的Domain Class的name字段。并根据提供的id属性生成input。</p>
<code> 
	&lt;jqac:domain 
		id="<span class="green">role-id</span>" 
		style="width:260px" 
		domain="jqac.Role"
	/&gt;

↓ &lt;input id=&quot;<span class="green">role-id_1</span>&quot; name=&quot;<span
	class="green">role-id_1</span>&quot; /&gt; </code>
<!--------------------------------------------------------->
<h5 id="sample01_02">改变每页显示的个数以及页码数.</h5>
<p>"pageSize" option => 每页显示的记录数，缺省值为10；<br />

	"naviNum" option => 每页显示的页码数，缺省值为10。
</p>
<label for="ac01_02_1">Name:</label>
<jqac:domain id="role"  style="width:260px;" domain="jqac.Role" pageSize="2" naviNum="4"/>
<code>
  &lt;jqac:domain 
  	id="role" 
  	style="width:260px" 
  	domain="jqac.Role"
  	<span class="green">pageSize="2" </span>
  	<span class="green">naviNum="4"</span>
  	/&gt;


</code>
<h5 id="sample01_03">修改记录排序.</h5>
<p>"orderField" option => 排序字段，缺省为name字段；<br />

	"orderBy" option => 排序属性，缺省为ASC。
</p>
<label for="ac01_02_1">Role:</label>
<jqac:domain id="order"  style="width:260px;" domain="jqac.Role" orderField="id" orderBy="DESC"/>
<code>
  &lt;jqac:domain 
  	id="role" 
  	style="width:260px" 
  	domain="jqac.Role"
  	<span class="green">orderField="id"</span>
  	<span class="green">orderBy="DESC"</span>
  /&gt;


</code>

<div class="top_navi"><a href="#idx_area"> To contents </a></div>
<!--**************************************************** -->
<h4 id="sample02">显示附加信息</h4>
<p>
	如果选择的内容相同，就需要通过附加信息来进行区分。
</p>
<h5 id="sample02_01">Basic</h5>
<p>
	使用subInfo，将其值设置为"true"，缺省会显示id以及name的附加信息。
</p>
<label for="ac02_01_1">Employee:</label>
<jqac:domain id="subinfo"  style="width:260px;" domain="jqac.Role" subInfo="true"/>

<code>
   &lt;jqac:domain 
  	id="subinfo" 
  	style="width:260px" 
  	domain="jqac.Role"
  	<span class="green">subInfo="true"</span>
  	/&gt;

</code>
<!--------------------------------------------------------->
<h5 id="sample02_02">可以设置详细的附加信息</h5>

<p>
	使用subSet设置需要显示的附加信息以及字段名的显示。
</p>
<label for="ac02_02_1">Role:</label>
<jqac:domain id="subset" style="width:260px" domain="jqac.Role" subInfo="true" subset="[id:'ID', name:'Name', version:'Version']" />

<code>
  &lt;jqac:domain 
  	id="subinfo" 
  	style="width:260px" 
  	domain="jqac.Role"
  	subInfo="true"
  	<span class="green">subset="[id:'ID', name:'Name', version:'Version']"</span>
  /&gt;

</code>
<!--------------------------------------------------------->
<h5 id="sample02_03">设置将某个字段为附加信息</h5>
<p>
	"showField" 属性设置某个字段为附加信息
</p>
<label for="ac02_03_1">Employee:</label>

<jqac:domain id="showfield" style="width:260px" domain="jqac.Role" subInfo="true" 
subset="[id:'ID', name:'Name', version:'Version']"
 showField="version"/>
<code>
  &lt;jqac:domain 
  	id="subinfo" 
  	style="width:260px" 
  	domain="jqac.Role"
  	subInfo="true"
  	subset="[id:'ID', name:'Name', version:'Version']"
  	<span class="green">showField="version"</span>
  /&gt;

</code>
<!--------------------------------------------------------->
<h5 id="sample02_04">附加信息中隐藏某个字段</h5>
<p>
	"hideField" 属性可设置隐藏字段。
</p>

<label for="ac02_04_1">Role:</label>
<jqac:domain id="hidefield" style="width:260px" domain="jqac.Role" subInfo="true" 
subset="[id:'ID', name:'Name', version:'Version']"
 hideField="version"/>
<code>
 &lt;jqac:domain 
  	id="subinfo" 
  	style="width:260px" 
  	domain="jqac.Role"
  	subInfo="true"
  	subset="[id:'ID', name:'Name', version:'Version']"
  	<span class="green">hideField="version"</span>
  /&gt;
  
</code>
<div class="top_navi"><a href="#idx_area"> To contents </a></div>
<!--**************************************************** -->
<h4 id="sample03">只执行选择</h4>

<h5 id="sample03_01">Basic</h5>
<p>
	如果输入框中的内容不是选择获得，就会出现提示。
</p>
<label for="ac03_01_1">Role:</label>
<jqac:domain id="selectonly" style="width:260px" domain="jqac.Role" subInfo="true" 
selectOnly="true"
/>
 <code>
 &lt;jqac:domain 
  	id="subinfo" 
  	style="width:260px" 
  	domain="jqac.Role"
  	subInfo="true"  	
  	<span class="green">selectOnly="true"</span>
  /&gt;


</code>
<p>
	如果设置了selectOnly属性，主键值就会赋给一个隐藏的input。
</p>
<code>
<span class="gray">//Text-box</span>
&lt;input type="text" autocomplete="off" 
	class="ac_input" name="selectonly_1" 
	id="<span class="green">selectonly_1</span>" style="width: 225px;" &gt;
<span class="gray">//List</span>
...
&lt;li id=&quot;1&quot; class=&quot;&quot;&gt;admin&lt;/li&gt;
&lt;li id=&quot;<span class="red">2</span>&quot; class=&quot;ac_over&quot;&gt;guest&lt;/li&gt;

&lt;li id=&quot;6&quot; class=&quot;&quot;&gt;powerUser&lt;/li&gt;
...

<span class="gray">//Hidden field</span>
&lt;input type="hidden" name="<span class="green">selectonly_1</span> id="selectonly_1_hidden" value="<span class="red">2</span>"/&gt;

</code>
<!--------------------------------------------------------->
<h5 id="sample03_02">设置主键</h5>
<p>
	primaryKey与selectOnly结合使用，设置页面提交的时候一并将primaryKey的值进行提交，提交的值为“[field,primaryKey]”
</p>
<label for="ac03_02_1">Role:</label>
<jqac:domain id="primarykey" style="width:260px" domain="jqac.Role" 
selectOnly="true" primaryKey="id"/>
<code>
  	&lt;jqac:domain id="primarykey" style="width:260px" 
  		domain="jqac.Role" 
		selectOnly="true" 
		<span class="green">primaryKey="id"</span>
 	/&gt;

</code>

<div class="top_navi"><a href="#idx_area"> To contents </a></div>
<!--**************************************************** -->
<h4 id="sample04">Mini-size</h4>
<h5 id="sample04_01">Basic</h5>
<p>
使用小图标
</p>
<label for="ac04_01_1">Role:</label>
<jqac:domain id="mini" style="width:260px" domain="jqac.Role" 
mini="true"/>
<code>
  	&lt;jqac:domain id="mini" style="width:260px" 
  		domain="jqac.Role" 
		<span class="green">mini="true"</span>
	/&gt;

</code>



<div class="top_navi"><a href="#idx_area"> To contents </a></div>
<!--**************************************************** -->
<h4 id="sample05">Package</h4>
<h5 id="sample05_01">Basic</h5>
<label for="ac05_01_1">Role:</label>
<jqac:domain id="package" style="width:260px" domain="jqac.Role" 
package="true"/>
<code>
  &lt;jqac:domain id="mini" style="width:260px" 
  		domain="jqac.Role" 
		<span class="green">package="true"</span>
	/&gt;

</code>

<!--------------------------------------------------------->
<h5 id="sample05_04">Mini-size</h5>
<label for="ac05_04_1">Nation:</label>
<jqac:domain id="packagemini" style="width:260px" domain="jqac.Role" 
package="true" mini="true"/>
<div class="top_navi"><a href="#idx_area"> To contents </a></div>

<!--**************************************************** -->
<h4 id="sample06">初始化数值</h4>
<p>
	使用initVal属性给input框赋初值。
</p>
<h5 id="sample06_01">Basic</h5>
<label for="ac06_01_1">Nrole:</label>
<jqac:domain id="inival" style="width:260px" domain="jqac.Role" 
initVal="'hello'"/>
<code>
 &lt;jqac:domain id="inival" style="width:260px" 
 	domain="jqac.Role" 
 	<span class="green">initVal="hello"</span> 
 /&gt;
     
</code>
<!--------------------------------------------------------->
<h5 id="sample06_02">Select-only</h5>
<p>
	selectOnly与initVal结合使用，从后台数据库中获取初始值。
</p>
<label for="ac06_02_1">Role:</label>

<jqac:domain id="inival2" style="width:260px" domain="jqac.Role" 
selectOnly="true" initVal="2"/>
<code>
  &lt;jqac:domain id="inival" style="width:260px" 
 	domain="jqac.Role" 
 	<span class="green">selectOnly="true" </span>
 	<span class="green">initVal="2"</span> 
 /&gt;

</code>
<!--------------------------------------------------------->
<h5 id="sample06_03">Package</h5>
<label for="ac06_03_1">Role:</label>
<jqac:domain id="inival3" style="width:260px" domain="jqac.Role" 
primaryKey="name"
selectOnly="true" initVal="'admin','guest'"
package="true"
/>
<code>
   &lt;jqac:domain id="inival3" style="width:260px" domain="jqac.Role" 
	<span class="green">primaryKey="name"</span>
	selectOnly="true" 
	<span class="green">initVal="admin','guest"</span>
	<span class="green">package="true"</span>
   /&gt;
   </code>
  <label for="ac06_03_1">Role:</label>
<jqac:domain id="inival4" style="width:260px" domain="jqac.Role" 
primaryKey="id"
selectOnly="true" initVal="5,3"
package="true"
/>

  <code> 
   &lt;jqac:domain id="inival3" style="width:260px" domain="jqac.Role" 
	<span class="green">primaryKey="id"</span>
	selectOnly="true" 
	<span class="green">initVal="5,3"</span>
	<span class="green">package="true"</span>
   /&gt;

     

</code>

<div class="top_navi"><a href="#idx_area"> To contents </a></div>

<!--**************************************************** -->
<h4 id="sample07">for Cake</h4>
<p>
	指定input框的name和id属性。
</p>
<h5 id="sample07_01">Basic</h5>
<p>
	如果cakeRule属性设置为true，If "cake_rule" option is "true", "id" and "name" attributes output<br />
	from "db_table" and "field" options.
</p>
<label for="nationName">Role:</label>

<jqac:domain id="cakerule" style="width:260px" domain="jqac.Role" 
field="name"
orderField="id"
cakeRule="true"
cakeModel="Role"
cakeField="id"
/>
<code>
<span class="bold">jQuery:</span>
	&lt;jqac:domain id="cakerule" style="width:260px" domain="jqac.Role" 
		field="name"
		orderField="id"
		<span class="green">cakeRule="true"</span>
		<span class="green">cakeModel="Role"</span>
		<span class="green">cakeField="id"</span>
	/&gt;

<span class="bold">HTML:</span>

&lt;input type="text" autocomplete="off" class="ac_input" 
name="<span class="green">Roleid</span>" 
id="<span class="green">RoleId</span>" style="width: 225px;"/&gt;

</code>



<!--------------------------------------------------------->
<h5 id="sample07_03">Package</h5>
<p>
	如果使用了package属性，input的id以及name会添加相应的编号。
</p>
<label for="UserNationId0">Role:</label>
<jqac:domain id="cakerulepackage" style="width:260px" domain="jqac.Role" 
field="name"
orderField="id"
cakeRule="true"
cakeModel="Role"
cakeField="id"
package="true"
/>
<code>
<span class="bold">jQuery:</span>
	&lt;jqac:domain id="cakerule" style="width:260px" domain="jqac.Role" 
		field="name"
		orderField="id"
		<span class="green">cakeRule="true"</span>
		<span class="green">cakeModel="Role"</span>
		<span class="green">cakeField="id"</span>
		<span class="green">package="true"</span>
	/&gt;

<span class="bold">HTML:</span>

&lt;input type="text" autocomplete="off" class="ac_input" 
name="<span class="green">Roleid0</span>" 
id="<span class="green">RoleId0</span>" style="width: 225px;"/&gt;

</code>

<div class="top_navi"><a href="#idx_area"> To contents </a></div>
<!--**************************************************** -->
<hr />
<address>
Author : GroovyQ /
<a href="http://www.groovyq.net">Blog</a> /
<a href="http://twitter.com/groovyq">Twitter</a> /

</address>
</body>

</html>
