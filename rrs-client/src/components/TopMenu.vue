<template>
	<div style="position:relative;z-index:200;width:100%;height:40px;background-color:black;">
		<div class="button-div">
			<div class="subcat-link">
				<router-link :to="{ name: 'dashboard' }" append>Dashboard</router-link>
			</div>
			<div class="subcat-link" id="subcat-request">
				<a name="requestForm" id="requestForm">Request Forms</a>
				<div class="subcat-div" id="request-dropdown">
					<router-link :to="{ name: 'artpackForm' }" append>Artpack</router-link>
					<router-link :to="{ name: 'embroideryForm' }" append>Embroidery</router-link>
				</div>
			</div>
		</div>
	</div>
</template>
<style>
.button-div {
	float:right;
}
.subcat-link {
	width: 200px;
	text-decoration: none;
	background-color: grey;
	margin: 2px;
	float:left;
	color: white;
	font-family: helvetica;
}
#subcat-request:hover #request-dropdown {
	display: block;
	visibility: visible;
	float: left;
	width: 100%;
	background-color: #95f9a3;
}
.subcat-div a {
	width: 100%;
	height: 20px;
	padding: 3px;
}
#request-dropdown {
	display: none;
	visibility: hidden;
}
.button-div a {
	width:150px;
	text-decoration: none;
	background-color: grey;
	margin: 2px;
	float:left;
	color: white;
	font-size: 18px;
	font-family: helvetica;
}
.subcat-div {
	width:100%;
	float:left;
	height:100px;
	background-color: green;
}
</style>