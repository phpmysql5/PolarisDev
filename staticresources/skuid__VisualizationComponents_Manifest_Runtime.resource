{
	"id" : "skuidvis",
	"components" : [{
		"id" : "chartset",
		"pathsToChildComponents" : ["charts"],
		"js" : [
			{ "path" : "prod_chart.js" }
		]
	},{
		"id" : "chart",
		"pathsToActions" : ["serieslist>series>actions"],
		"js" : [
			{ "path" : "prod_chart.js" }
		]
	},{
		"id" : "geochart",
		"pathsToActions" : ["serieslist>series>actions"],
		"js" : [
			{ "path" : "prod_geochart.js" }
		]
	}],
	"js" : [
		{ "path" : "prod_core.js" }
	],
	"css" : [
	    { "path" : "prod.css" }
	]
}