{
	"id" : "skuidcore",
	"components" : [
	    {
	    	"id" : "panelset",
	    	"pathsToChildComponents" : ["panels>panel>components"]
	    },
	    {
	    	"id" : "grid",
	    	"pathsToChildComponents" : ["divisions>division>components"]
	    },
	    {
	    	"id" : "file",
	    	"customLabelDependencies" : [
	    		"error_invalid_file_upload_data_source",
	    		"error_could_not_find_upload_method"
	    	],
	    	"pathsToDataSourceAttributes" : [":datasource"]
	    },
	    {
			"id" : "image",
			"pathsToDataSourceAttributes" : [":datasource"]
		},
	    {
			"id" : "pagetitle",
			"customLabelDependencies" : [
				"clone",
	        	"confirm_delete",
	        	"delete",
	        	"deleting",
	        	"edit_page",
	        	"no",
	        	"no_but_i_would_like_to_delete",
	        	"no_dont_delete_anything",
	        	"share",
	        	"yes"
			],
			"pathsToActions" : ["actions"]
		},
		{
			"id" : "panel",
			"pathsToChildComponents" : ["components"]
		},
		{
			"id" : "search",
			"pathsToActions" : ["selectactions","resultactions>action>actions","objects>object>resultactions>action>actions"],
			"pathsToDataSourceAttributes" : ["objects>object:datasource"]
		},
		{
			"id" : "skootable",
			"pathsToActions" : ["actions","rowactions","massactions"]
		},
	    {
			"id" : "tabset",
			"pathsToChildComponents" : ["tabs>tab>components"],
			"customLabelDependencies" : ["loading"]
		},
		{
			"id" : "filterset",
			"pathsToChildComponents" : ["components"]
		},
		{
			"id" : "skuidheader",
			"pathsToChildComponents" : ["components"]
		},
		{
			"id" : "skuidfooter",
			"pathsToChildComponents" : ["components"]
		},
		{
			"id" : "wrapper",
			"pathsToChildComponents" : ["components"],
			"pathsToDataSourceAttributes": [
				"styles>styleitem:datasource"
			]
		},
		{
			"id" : "deck",
			"pathsToChildComponents" : ["components"],
			"customLabelDependencies" : [
				"select_cards", 
				"toggle_selected_rows_for_deletion",
				"item_selected",
				"items_selected"
			]
		},
		{
			"id" : "buttonset",
			"pathsToActions" : ["buttons>button>actions"]
		},
		{
			"id" : "navigation",
			"customLabelDependencies" : ["expand_collapse"]
		},
		{
			"id" : "themecomposer",
			"js" : [
			     { "path" : "themecomposer.js" }
			],
			"css" : [
			     { "path" : "themecomposercss/style.css" }
			]
		},
		{
			"id" : "themelist",
			"js" : [
			     { "path" : "themecomposer.js" }
			]
		}
	],
	"js" : [
		{ "path" : "core.js" },
		{ "path" : "salesforce.js"}
	]
}