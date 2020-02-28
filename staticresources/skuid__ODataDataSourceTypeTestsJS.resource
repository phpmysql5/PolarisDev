(function(skuid){
	
	var testing = skuid.testing,
		xhrMock = testing.xhrMock,
		ODATA_DATA_SOURCE_TYPE_NAME = "OData1-3",
		$ = skuid.$;
	
	testing.registerModule('odataDataSourceType',{
		setup : function(){

			var baseUrl = 'https://skuid-allswoll.azurewebsites.net',
				serviceUrl = baseUrl + '/dude3',
				loginEndpoint = '/login',
				sampleId1 = '1',
				sampleName1 = 'Ben Hubbard',
				sampleName2 = 'J Tingle',
				sampleUsername = 'benh',
				samplePassword = 'p455w0rd',
				sampleToken = '4cc355t0k3n!',
				sampleObjectName = 'SuperheroesV3',
				sampleQualifiedObjectName = 'Default.' + sampleObjectName;

			// A sample odata metadata response, taken from JD's AllsWoll Superheroes dataset
			var sampleMetadataResponse = '' +
				'<?xml version="1.0" encoding="utf-8"?>'+
				'<edmx:Edmx Version="1.0" xmlns:edmx="http://schemas.microsoft.com/ado/2007/06/edmx">'+
				'<edmx:DataServices m:DataServiceVersion="3.0" m:MaxDataServiceVersion="3.0" xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata">'+
				'<Schema Namespace="SkuidAllSwoll" xmlns="http://schemas.microsoft.com/ado/2009/11/edm">'+
				'<EntityType Name="Superhero">'+
				'<Key>'+
				'<PropertyRef Name="Id" />'+
				'</Key>'+
				'<Property Name="Id" Type="Edm.Int32" Nullable="false" />'+
				'<Property Name="Name" Type="Edm.String" />'+
				'<Property Name="ComicCount" Type="Edm.Int32" />'+
				'<Property Name="SeriesCount" Type="Edm.Int32" />'+
				'<Property Name="HourlyRate" Type="Edm.Decimal" />'+
				'<Property Name="PunchForce" Type="Edm.Int64" />'+
				'<Property Name="MaxSpeed" Type="Edm.Double" />'+
				'<Property Name="AvailableFrom" Type="Edm.Time" />'+
				'<Property Name="AvailableTo" Type="Edm.Time" />'+
				'<Property Name="Mugshot" Type="Edm.Binary" />'+
				'<Property Name="Assets" Type="Edm.String" />'+
				'<Property Name="HomeBase" Type="System.Data.Entity.Spatial.DbGeography" />'+
				'<NavigationProperty Name="EngagementAssignments" Relationship="SkuidAllSwoll.SkuidAllSwoll_Superhero_EngagementAssignments_SkuidAllSwoll_EngagementAssignment_EngagementAssignmentsPartner" ToRole="EngagementAssignments" FromRole="EngagementAssignmentsPartner" />'+
				'</EntityType>'+
				'<EntityType Name="Engagement">'+
				'<Key>'+
				'<PropertyRef Name="Id" />'+
				'</Key>'+
				'<Property Name="Id" Type="Edm.Int32" Nullable="false" />'+
				'<Property Name="Name" Type="Edm.String" />'+
				'<Property Name="Description" Type="Edm.String" />'+
				'<Property Name="Location" Type="System.Data.Entity.Spatial.DbGeography" />'+
				'<Property Name="EstimatedScrambleTime" Type="Edm.DateTimeOffset" />'+
				'<Property Name="EndDate" Type="Edm.DateTime" />'+
				'<Property Name="AccountId" Type="Edm.String" />'+
				'<Property Name="Accepted" Type="Edm.Boolean" Nullable="false" />'+
				'<Property Name="Active" Type="Edm.Boolean" Nullable="false" />'+
				'<Property Name="Completed" Type="Edm.Boolean" Nullable="false" />'+
				'<Property Name="EngageLocalLawEnforcement" Type="Edm.Boolean" Nullable="false" />'+
				'<NavigationProperty Name="EngagementAssignments" Relationship="SkuidAllSwoll.SkuidAllSwoll_Engagement_EngagementAssignments_SkuidAllSwoll_EngagementAssignment_EngagementAssignmentsPartner" ToRole="EngagementAssignments" FromRole="EngagementAssignmentsPartner" />'+
				'</EntityType>'+
				'<EntityType Name="EngagementAssignment">'+
				'<Key>'+
				'<PropertyRef Name="Id" />'+
				'</Key>'+
				'<Property Name="Id" Type="Edm.Int32" Nullable="false" />'+
				'<Property Name="EngagementId" Type="Edm.Int32" Nullable="false" />'+
				'<Property Name="SuperheroId" Type="Edm.Int32" Nullable="false" />'+
				'<Property Name="Notes" Type="Edm.String" />'+
				'<NavigationProperty Name="Engagement" Relationship="SkuidAllSwoll.SkuidAllSwoll_EngagementAssignment_Engagement_SkuidAllSwoll_Engagement_EngagementPartner" ToRole="Engagement" FromRole="EngagementPartner" />'+
				'<NavigationProperty Name="Superhero" Relationship="SkuidAllSwoll.SkuidAllSwoll_EngagementAssignment_Superhero_SkuidAllSwoll_Superhero_SuperheroPartner" ToRole="Superhero" FromRole="SuperheroPartner" />'+
				'</EntityType>'+
				'<Association Name="SkuidAllSwoll_Superhero_EngagementAssignments_SkuidAllSwoll_EngagementAssignment_EngagementAssignmentsPartner">'+
				'<End Type="SkuidAllSwoll.EngagementAssignment" Role="EngagementAssignments" Multiplicity="*" />'+
				'<End Type="SkuidAllSwoll.Superhero" Role="EngagementAssignmentsPartner" Multiplicity="0..1" />'+
				'</Association>'+
				'<Association Name="SkuidAllSwoll_Engagement_EngagementAssignments_SkuidAllSwoll_EngagementAssignment_EngagementAssignmentsPartner">'+
				'<End Type="SkuidAllSwoll.EngagementAssignment" Role="EngagementAssignments" Multiplicity="*" />'+
				'<End Type="SkuidAllSwoll.Engagement" Role="EngagementAssignmentsPartner" Multiplicity="0..1" />'+
				'</Association>'+
				'<Association Name="SkuidAllSwoll_EngagementAssignment_Engagement_SkuidAllSwoll_Engagement_EngagementPartner">'+
				'<End Type="SkuidAllSwoll.Engagement" Role="Engagement" Multiplicity="0..1" />'+
				'<End Type="SkuidAllSwoll.EngagementAssignment" Role="EngagementPartner" Multiplicity="0..1" />'+
				'<ReferentialConstraint>'+
				'<Principal Role="Engagement">'+
				'<PropertyRef Name="Id" />'+
				'</Principal>'+
				'<Dependent Role="EngagementPartner">'+
				'<PropertyRef Name="EngagementId" />'+
				'</Dependent>'+
				'</ReferentialConstraint>'+
				'</Association>'+
				'<Association Name="SkuidAllSwoll_EngagementAssignment_Superhero_SkuidAllSwoll_Superhero_SuperheroPartner">'+
				'<End Type="SkuidAllSwoll.Superhero" Role="Superhero" Multiplicity="0..1" />'+
				'<End Type="SkuidAllSwoll.EngagementAssignment" Role="SuperheroPartner" Multiplicity="0..1" />'+
				'<ReferentialConstraint>'+
				'<Principal Role="Superhero">'+
				'<PropertyRef Name="Id" />'+
				'</Principal>'+
				'<Dependent Role="SuperheroPartner">'+
				'<PropertyRef Name="SuperheroId" />'+
				'</Dependent>'+
				'</ReferentialConstraint>'+
				'</Association>'+
				'</Schema>'+
				'<Schema Namespace="System.Data.Entity.Spatial" xmlns="http://schemas.microsoft.com/ado/2009/11/edm">'+
				'<ComplexType Name="DbGeography">'+
				'<Property Name="WellKnownValue" Type="System.Data.Entity.Spatial.DbGeographyWellKnownValue" />'+
				'</ComplexType>'+
				'<ComplexType Name="DbGeographyWellKnownValue">'+
				'<Property Name="CoordinateSystemId" Type="Edm.Int32" />'+
				'<Property Name="WellKnownText" Type="Edm.String" />'+
				'<Property Name="WellKnownBinary" Type="Edm.Binary" />'+
				'</ComplexType>'+
				'</Schema>'+
				'<Schema Namespace="Default" xmlns="http://schemas.microsoft.com/ado/2009/11/edm">'+
				'<EntityContainer Name="Container" m:IsDefaultEntityContainer="true">'+
				'<EntitySet Name="SuperheroesV3" EntityType="SkuidAllSwoll.Superhero" />'+
				'<EntitySet Name="EngagementsV3" EntityType="SkuidAllSwoll.Engagement" />'+
				'<EntitySet Name="EngagementAssignmentsV3" EntityType="SkuidAllSwoll.EngagementAssignment" />'+
				'<AssociationSet Name="SkuidAllSwoll_Superhero_EngagementAssignments_SkuidAllSwoll_EngagementAssignment_EngagementAssignmentsPartnerSet" Association="SkuidAllSwoll.SkuidAllSwoll_Superhero_EngagementAssignments_SkuidAllSwoll_EngagementAssignment_EngagementAssignmentsPartner">'+
				'<End Role="EngagementAssignmentsPartner" EntitySet="SuperheroesV3" />'+
				'<End Role="EngagementAssignments" EntitySet="EngagementAssignmentsV3" />'+
				'</AssociationSet>'+
				'<AssociationSet Name="SkuidAllSwoll_Engagement_EngagementAssignments_SkuidAllSwoll_EngagementAssignment_EngagementAssignmentsPartnerSet" Association="SkuidAllSwoll.SkuidAllSwoll_Engagement_EngagementAssignments_SkuidAllSwoll_EngagementAssignment_EngagementAssignmentsPartner">'+
				'<End Role="EngagementAssignmentsPartner" EntitySet="EngagementsV3" />'+
				'<End Role="EngagementAssignments" EntitySet="EngagementAssignmentsV3" />'+
				'</AssociationSet>'+
				'<AssociationSet Name="SkuidAllSwoll_EngagementAssignment_Engagement_SkuidAllSwoll_Engagement_EngagementPartnerSet" Association="SkuidAllSwoll.SkuidAllSwoll_EngagementAssignment_Engagement_SkuidAllSwoll_Engagement_EngagementPartner">'+
				'<End Role="EngagementPartner" EntitySet="EngagementAssignmentsV3" />'+
				'<End Role="Engagement" EntitySet="EngagementsV3" />'+
				'</AssociationSet>'+
				'<AssociationSet Name="SkuidAllSwoll_EngagementAssignment_Superhero_SkuidAllSwoll_Superhero_SuperheroPartnerSet" Association="SkuidAllSwoll.SkuidAllSwoll_EngagementAssignment_Superhero_SkuidAllSwoll_Superhero_SuperheroPartner">'+
				'<End Role="SuperheroPartner" EntitySet="EngagementAssignmentsV3" />'+
				'<End Role="Superhero" EntitySet="SuperheroesV3" />'+
				'</AssociationSet>'+
				'</EntityContainer>'+
				'</Schema>'+
				'</edmx:DataServices>'+
				'</edmx:Edmx>';

			var sampleMetadataResponseHeaders = {
				'Cache-Control':"no-cache",
				'Content-Type':"application/xml; charset=utf-8",
				'DataServiceVersion':"3.0",
				'Expires':"-1",
				'Pragma':"no-cache"
			};

			var getSampleQueryResponseBody = function() {
				return {
					"odata.metadata":serviceUrl+"/$metadata#" + sampleObjectName + "&$select=Id,Name,ComicCount,SeriesCount,HourlyRate,PunchForce,MaxSpeed,AvailableFrom,AvailableTo",
					"value":[
						{ "odata.type":"SkuidAllSwoll.Superhero","odata.id":serviceUrl+"/" + sampleObjectName + "(1158)","Id":1158,"Name":"3-D Man","ComicCount":11,"SeriesCount":2,"HourlyRate@odata.type":"Edm.Decimal","HourlyRate":"250.0000","PunchForce@odata.type":"Edm.Int64","PunchForce":"2000","MaxSpeed":0.0,"AvailableFrom":null,"AvailableTo":null },
						{ "odata.type":"SkuidAllSwoll.Superhero","odata.id":serviceUrl+"/" + sampleObjectName + "(2)","Id":2,"Name":"Gorgon","ComicCount":40,"SeriesCount":24,"HourlyRate@odata.type":"Edm.Decimal","HourlyRate":"138.0000","PunchForce@odata.type":"Edm.Int64","PunchForce":"22","MaxSpeed":40.0,"AvailableFrom":null,"AvailableTo":null },
						{ "odata.type":"SkuidAllSwoll.Superhero","odata.id":serviceUrl+"/" + sampleObjectName + "(1409)","Id":1409,"Name":"Loki","ComicCount":187,"SeriesCount":77,"HourlyRate@odata.type":"Edm.Decimal","HourlyRate":"100.0000","PunchForce@odata.type":"Edm.Int64","PunchForce":"50","MaxSpeed":50000.0,"AvailableFrom":null,"AvailableTo":null },
						{ "odata.type":"SkuidAllSwoll.Superhero","odata.id":serviceUrl+"/" + sampleObjectName + "(231)","Id":231,"Name":"Shooting Star","ComicCount":2,"SeriesCount":2,"HourlyRate@odata.type":"Edm.Decimal","HourlyRate":"300.0000","PunchForce@odata.type":"Edm.Int64","PunchForce":"200","MaxSpeed":300.0,"AvailableFrom":null,"AvailableTo":null },
						{ "odata.type":"SkuidAllSwoll.Superhero","odata.id":serviceUrl+"/" + sampleObjectName + "(1)","Id":1,"Name":"Tempest","ComicCount":13,"SeriesCount":99,"HourlyRate@odata.type":"Edm.Decimal","HourlyRate":"121.0000","PunchForce@odata.type":"Edm.Int64","PunchForce":"104","MaxSpeed":992.0,"AvailableFrom":null,"AvailableTo":null }
					]
				};
			};

			var sampleQueryResponseHeaders = {
				"Cache-Control": "no-cache",
				"Content-Length": "2420",
				"Content-Type": "application/json; odata=fullmetadata; charset=utf-8",
				"DataServiceVersion": "3.0",
				"Expires": "-1",
				"Pragma": "no-cache"
			};

			var CRLF = "\r\n";

			var sampleInsertRecordId = 1485;

			var sampleInsertRecord = {
				"__metadata":{
					"id":serviceUrl+"/" + sampleObjectName + "(" + sampleInsertRecordId + ")",
					"uri":serviceUrl+"/" + sampleObjectName + "(" + sampleInsertRecordId + ")",
					"type":"SkuidAllSwoll.Superhero"
				},
				"EngagementAssignments":{
					"__deferred":{
						"uri":serviceUrl+"/" + sampleObjectName + "(" + sampleInsertRecordId + ")/EngagementAssignments"
					}
				},
				"Id":sampleInsertRecordId,
				"Name":"Christopher Nolan",
				"ComicCount":101,
				"SeriesCount":22,
				"HourlyRate":"123",
				"PunchForce":"1111",
				"MaxSpeed":4000,
				"AvailableFrom":null,
				"AvailableTo":null,
				"Mugshot":null,
				"Assets":null,
				"HomeBase":null
			};

			//
			// BATCH Responses
			//
			var sampleBatchBoundary = "batchresponse_ca1f418c-fdcf-4a60-999d-d06b3c30a138";
			var sampleChangesetBoundary = "changesetresponse_0671d453-bf87-4cf7-890c-ffdf090f188a";

			var sampleBatchPreamble = 
				"--" + sampleBatchBoundary + CRLF +
				"Content-Type: multipart/mixed; boundary=" + sampleChangesetBoundary + CRLF +
				CRLF +
				"--" + sampleChangesetBoundary + CRLF +
				"Content-Type: application/http" + CRLF +
				"Content-Transfer-Encoding: binary" + CRLF +
				CRLF;

			var sampleBatchPostamble = 
				CRLF +
				"--" + sampleChangesetBoundary + "--" + CRLF +
				"--" + sampleBatchBoundary + "--" + CRLF;

			var sampleBatchResponseHeaders = {
				"Cache-Control": "no-cache",
				"Content-Type": "multipart/mixed; boundary=" + sampleBatchBoundary,
				"DataServiceVersion": "3.0",
				"Expires": "-1",
				"Pragma": "no-cache"
			};

			var sampleInsertResponseBody = 
				sampleBatchPreamble +
				"HTTP/1.1 201 Created" + CRLF +
				"Location: "+serviceUrl+"/"+sampleObjectName+"("+sampleInsertRecord.Id+")" + CRLF +
				"Content-Type: application/json; odata=verbose; charset=utf-8" + CRLF +
				"DataServiceVersion: 3.0" + CRLF +
				CRLF +
				JSON.stringify({
					"d":sampleInsertRecord
				}) + sampleBatchPostamble;
			
			var sampleUpdateResponseBody = 
				sampleBatchPreamble + 
				"HTTP/1.1 204 No Content" + CRLF +
				sampleBatchPostamble;

			var sampleDeleteResponseBody =
				"--" + sampleBatchBoundary + CRLF +
				"Content-Type: multipart/mixed; boundary=" + sampleChangesetBoundary + CRLF +
				CRLF +
				"--" + sampleChangesetBoundary + CRLF +
				"Content-Type: application/http" + CRLF +
				"Content-Transfer-Encoding: binary" + CRLF +
				CRLF +
				"HTTP/1.1 204 No Content" + CRLF +
				CRLF +
				CRLF +
				"--" + sampleChangesetBoundary + CRLF +
				"Content-Type: application/http" + CRLF +
				"Content-Transfer-Encoding: binary" + CRLF +
				CRLF +
				"HTTP/1.1 204 No Content" + CRLF +
				CRLF +
				CRLF +
				"--" + sampleChangesetBoundary + "--" + CRLF +
				"--" + sampleBatchBoundary + "--" + CRLF;

			var dataSource_noauth = new skuid.dataSource.DataSource({
				name : 'test_odata_noauth',
				dataSourceTypeName : ODATA_DATA_SOURCE_TYPE_NAME,
				serviceUrl : serviceUrl,
				useApexProxy : false
			});
			
			var dataSource_httpauth = new skuid.dataSource.DataSource({
				name : 'test_odata_httpauth',
				dataSourceTypeName : ODATA_DATA_SOURCE_TYPE_NAME,
				serviceUrl : serviceUrl,
				useApexProxy : false,
				authentication : {
					method : 'basicauth',
					password : samplePassword,
					username : sampleUsername
				},
				requestHeaders : {}
			});
			
			var dataSource_separateurlauth = new skuid.dataSource.DataSource({
				name : 'test_odata_separateurlauth',
				dataSourceTypeName : ODATA_DATA_SOURCE_TYPE_NAME,
				serviceUrl : serviceUrl,
				useApexProxy : false,
				authentication : {
					method : 'separateurl',
					password : samplePassword,
					username : sampleUsername,
					requestBodyContentType : "application/json",
					requestBody : {
						"password" : "{{$Auth.Password}}",
						"email" : "{{$Auth.Username}}"
					},
					// Absolute url
					url : serviceUrl + loginEndpoint
				},
				requestHeaders : {
					'Authorization' : 'Bearer {{$Auth.Response.Headers.token}}'
				}
			});
			
			var getModelXML = function(options) {

				options = options || {};
				
				options = $.extend({
					dataSourceName : dataSource_noauth.name,
					objectName : sampleQualifiedObjectName,
					conditionsXML : '',
					fieldsXML : '<field id="Id"/><field id="Name"/>',
					orderBy : 'Name',
					doQuery : true,
					recordsLimit : 20
				},options);
				
				return '' + 
					'<model query="'+(options.doQuery?'true':'false')+'" createrowifnonefound="false'+
							'" datasourcetype="'+ ODATA_DATA_SOURCE_TYPE_NAME+
							'" processonclient="true" datasource="' + options.dataSourceName +
							'" sobject="' + options.objectName +
							'" orderby="' + options.orderBy +
							'" limit="' + options.recordsLimit +
							'">' +
						'<fields>' + options.fieldsXML + '</fields>' +
						'<conditions>' + options.conditionsXML + '</conditions>' +
						'<actions/>' +
					'</model>';
			};

			var sampleFieldsToRequest = [
				'Id',
				'Name',
				'ComicCount',
				'SeriesCount',
				'HourlyRate',
				'PunchForce',
				'MaxSpeed',
				'AvailableFrom',
				'AvailableTo'
			];
			
			//
			// Setup the metadata endpoint mock, which is used by all requests to this data source
			//
			// Mock OData metadata endpoint
			function setupMockMetadataEndpoint(assertionFunc) {
				xhrMock.get(serviceUrl + '/$metadata',function(req, res){
					// If we have any assertions we'd like to run, run them
					if (assertionFunc && typeof assertionFunc === "function") assertionFunc(req,res);
					return res
						.status(200)
						.headers(sampleMetadataResponseHeaders)
						.body(sampleMetadataResponse);
				});
			}

			return {
				dataSource_noauth: dataSource_noauth,
				dataSource_httpauth: dataSource_httpauth,
				dataSource_separateurlauth: dataSource_separateurlauth,
				serviceUrl: serviceUrl,
				loginEndpoint: loginEndpoint,
				getModelXML: getModelXML,
				sampleId1: sampleId1,
				sampleName1: sampleName1,
				sampleName2: sampleName2,
				sampleUsername: sampleUsername,
				samplePassword: samplePassword,
				sampleToken: sampleToken,
				sampleObjectName: sampleObjectName,
				sampleQualifiedObjectName: sampleQualifiedObjectName,
				sampleFieldsToRequest: sampleFieldsToRequest,
				sampleMetadataResponse: sampleMetadataResponse,
				sampleMetadataResponseHeaders: sampleMetadataResponseHeaders,
				getSampleQueryResponseBody: getSampleQueryResponseBody,
				sampleQueryResponseHeaders: sampleQueryResponseHeaders,
				sampleBatchResponseHeaders: sampleBatchResponseHeaders,
				sampleInsertRecord: sampleInsertRecord,
				sampleInsertResponseBody: sampleInsertResponseBody,
				sampleUpdateResponseBody: sampleUpdateResponseBody,
				sampleDeleteResponseBody: sampleDeleteResponseBody,
				setupMockMetadataEndpoint: setupMockMetadataEndpoint
			};
		},
		tests : {
			'odata_query_noauth' : function(test,scope) {

				var	done = test.async(),
					dataSource = scope.dataSource_noauth,
					fieldsToRequest = scope.sampleFieldsToRequest,
					recordsLimit = 20,
					orderBy = 'Name',
					modelXML = scope.getModelXML({
						fieldsXML: '<field id="' + fieldsToRequest.join('"/><field id="') + '"/>',
						recordsLimit: recordsLimit,
						orderBy: orderBy,
						conditionsXML: '<condition type="fieldvalue" value="100" enclosevalueinquotes="false" field="HourlyRate" operator="gte"/>'
					}),
					model = test.createModel(modelXML);
				
				// Verify that our dataSource and model are created and ready
				ok(skuid.dataSource.map().hasOwnProperty(dataSource.name),'DataSource was registered.');
				ok(skuid.model.map().hasOwnProperty(model.id),'Model created successfully.');

				// Setup our XHR mock, and setup our mock metadata endpoint.
				xhrMock.setup();
				scope.setupMockMetadataEndpoint();

				// Mock OData query endpoint
				var queryUrl = scope.serviceUrl + '/' + scope.sampleObjectName +
					'?$select=' + fieldsToRequest.join(',') +
					'&$orderby=' + orderBy + 
					'&$filter=HourlyRate%20ge%20100' +
					'&$top=' + (recordsLimit+1);
				
				xhrMock.get(queryUrl,function(req,res){
					return res
						.status(200)
						.headers(scope.sampleQueryResponseHeaders)
						.body(scope.getSampleQueryResponseBody());
				});
				
				// Request data from our dataSource
				model.load().then(function(){
					var sampleQueryResponseBody = scope.getSampleQueryResponseBody().value;
					strictEqual(
						model.getRows().length,
						sampleQueryResponseBody.length,
						'Number of rows returned from sample query'
					);
					$.each(model.getRows(),function(i,modelRow){
						var sampleRow = sampleQueryResponseBody[i];
						$.each(fieldsToRequest,function(j,field){
							var modelValue = model.getFieldValue(modelRow,field,true);
							var sampleValue = sampleRow[field];
							// Special type processing:
							// HourlyRate = Edm.Int64 ==> parse as integer
							if (field === 'HourlyRate') sampleValue = parseInt(sampleValue,10);
							// PunchForce = Edm.Decimal ==> parse as float
							else if (field === 'PunchForce') sampleValue = parseFloat(sampleValue);
							// Id ==> parse as string
							else if (field === 'Id') sampleValue = "" + sampleValue;
							strictEqual(sampleValue,modelValue,field + ' set correctly on Model row: ' + i);
						});
					});
					// Remove our mock
					xhrMock.teardown();
					// Finish our test
					done();
				});
				
			},

			'odata_query_noauth_pageLoadBehavior' : function(test,scope) {

				var	done = test.async(),
					dataSource = scope.dataSource_noauth,
					MODEL_NAME_INITIAL_LOAD_TRUE 
						= 'UnitTestOData_' + skuid.utils.generateUniqueId() + '_Load_True',
					MODEL_NAME_INITIAL_LOAD_FALSE 
						= 'UnitTestOData_' + skuid.utils.generateUniqueId() + '_Load_False',
					MODEL_NAME_INITIAL_LOAD_TRUE_DEFAULT_ROW 
						= 'UnitTestOData_' + skuid.utils.generateUniqueId() + '_Load_True_DefaultRow',
					MODEL_NAME_INITIAL_LOAD_FALSE_DEFAULT_ROW 
						= 'UnitTestOData_' + skuid.utils.generateUniqueId() + '_Load_False_DefaultRow',
					MODEL_NAME_INITIAL_LOAD_TRUE_DEFAULT_ROW_NO_RESULTS
						= 'UnitTestOData_' + skuid.utils.generateUniqueId() + '_Load_True_DefaultRow_NoResults',
					MODEL_NAME_INITIAL_LOAD_FALSE_DEFAULT_ROW_NO_RESULTS
						= 'UnitTestOData_' + skuid.utils.generateUniqueId() + '_Load_False_DefaultRow_NoResults';	

				// Verify that our dataSource was registered
				ok(skuid.dataSource.map().hasOwnProperty(dataSource.name),'DataSource was registered.');

				// Setup our XHR mock, 
				// and setup our mock metadata endpoint and query endpoint.

				xhrMock.setup();
				scope.setupMockMetadataEndpoint();

				// Setup mock OData query endpoints for the Models to be loaded on page load
				xhrMock.get(
					scope.serviceUrl + '/' + scope.sampleObjectName + '?$select=Id,Name,ComicCount&$top=11',
					function(req,res){
						return res
							.status(200)
							.headers(scope.sampleQueryResponseHeaders)
							.body(scope.getSampleQueryResponseBody());
					}
				);
				// This endpoint will return no data
				xhrMock.get(
					scope.serviceUrl + '/' + scope.sampleObjectName + '?$select=Id,Name,ComicCount&$top=2',
					function(req,res){
						var sampleBody = scope.getSampleQueryResponseBody();
						sampleBody.value = [];
						return res
							.status(200)
							.headers(scope.sampleQueryResponseHeaders)
							.body(sampleBody);
					}
				);

				var pageXML = 
					'<skuidpage unsavedchangeswarning="no" personalizationmode="client">' +
						'<models>' +
							'<model id="'+MODEL_NAME_INITIAL_LOAD_FALSE+'" limit="10" query="false" createrowifnonefound="false" '+
									'datasourcetype="OData1-3" datasource="'+dataSource.name+'" sobject="'+scope.sampleQualifiedObjectName+'">'+
								'<fields><field id="Id"/><field id="Name"/><field id="MaxSpeed"/></fields><conditions/>'+
							'</model>' +
							'<model id="'+MODEL_NAME_INITIAL_LOAD_TRUE+'" limit="10" query="true" createrowifnonefound="false" '+
									'datasourcetype="OData1-3" datasource="'+dataSource.name+'" sobject="'+scope.sampleQualifiedObjectName+'">'+
								'<fields><field id="Id"/><field id="Name"/><field id="ComicCount"/></fields><conditions/>'+
							'</model>' +
							'<model id="'+MODEL_NAME_INITIAL_LOAD_FALSE_DEFAULT_ROW+'" limit="10" query="false" createrowifnonefound="true" '+
									'dataSource="OData1-3" datasource="'+dataSource.name+'" sobject="'+scope.sampleQualifiedObjectName+'">'+
								'<fields><field id="Id"/><field id="Name"/><field id="MaxSpeed"/></fields><conditions/>'+
							'</model>' +
							'<model id="'+MODEL_NAME_INITIAL_LOAD_TRUE_DEFAULT_ROW+'" limit="10" query="true" createrowifnonefound="true" '+
									'dataSource="OData1-3" datasource="'+dataSource.name+'" sobject="'+scope.sampleQualifiedObjectName+'">'+
								'<fields><field id="Id"/><field id="Name"/><field id="ComicCount"/></fields><conditions/>'+
							'</model>' +
							'<model id="'+MODEL_NAME_INITIAL_LOAD_FALSE_DEFAULT_ROW_NO_RESULTS+'" limit="1" query="false" createrowifnonefound="true" '+
									'dataSource="OData1-3" datasource="'+dataSource.name+'" sobject="'+scope.sampleQualifiedObjectName+'">'+
								'<fields><field id="Id"/><field id="Name"/><field id="MaxSpeed"/></fields><conditions/>'+
							'</model>' +
							'<model id="'+MODEL_NAME_INITIAL_LOAD_TRUE_DEFAULT_ROW_NO_RESULTS+'" limit="1" query="true" createrowifnonefound="true" '+
									'dataSource="OData1-3" datasource="'+dataSource.name+'" sobject="'+scope.sampleQualifiedObjectName+'">'+
								'<fields><field id="Id"/><field id="Name"/><field id="ComicCount"/></fields><conditions/>'+
							'</model>' +
						'</models>' +
						'<components/>' +
					'</skuidpage>';

				test.subscribeToEvent('page.rendered',function(e){
					if (e.page === pageComponent) {
						// Make sure our Models were registered
						var modelQueryOnPageLoadTrue = skuid.$M(MODEL_NAME_INITIAL_LOAD_TRUE);
						var modelQueryOnPageLoadFalse = skuid.$M(MODEL_NAME_INITIAL_LOAD_FALSE);
						var modelQueryOnPageLoadTrueDefaultRow = skuid.$M(MODEL_NAME_INITIAL_LOAD_TRUE_DEFAULT_ROW);
						var modelQueryOnPageLoadFalseDefaultRow = skuid.$M(MODEL_NAME_INITIAL_LOAD_FALSE_DEFAULT_ROW);
						var modelQueryOnPageLoadTrueDefaultRowNoResults = skuid.$M(MODEL_NAME_INITIAL_LOAD_TRUE_DEFAULT_ROW_NO_RESULTS);
						var modelQueryOnPageLoadFalseDefaultRowNoResults = skuid.$M(MODEL_NAME_INITIAL_LOAD_FALSE_DEFAULT_ROW_NO_RESULTS);

						var allModels = [
							modelQueryOnPageLoadTrue,
							modelQueryOnPageLoadFalse,
							modelQueryOnPageLoadTrueDefaultRow,
							modelQueryOnPageLoadFalseDefaultRow,
							modelQueryOnPageLoadTrueDefaultRowNoResults,
							modelQueryOnPageLoadFalseDefaultRowNoResults
						];

						var loadTrueModels = [
							modelQueryOnPageLoadTrue,
							modelQueryOnPageLoadTrueDefaultRow,
							modelQueryOnPageLoadTrueDefaultRowNoResults
						];

						var loadFalseModels = [
							modelQueryOnPageLoadFalse,
							modelQueryOnPageLoadFalseDefaultRow,
							modelQueryOnPageLoadFalseDefaultRowNoResults
						];

						allModels.forEach(function(model){
							ok(model,'Model should have been registered: ' + model.id);
							strictEqual(true,model.processOnClient,'model should be set to process client side');
						});

						// Check data results
						var sampleQueryResponseBody = scope.getSampleQueryResponseBody().value;
						strictEqual(
							modelQueryOnPageLoadTrue.getRows().length,
							sampleQueryResponseBody.length,
							'Number of rows returned from sample query on Model that should have loaded on page load'
						);
						strictEqual(
							modelQueryOnPageLoadFalse.getRows().length,
							0,
							'Number of rows returned from sample query on Model that should NOT have loaded on page load'
						);
						strictEqual(
							modelQueryOnPageLoadTrueDefaultRow.getRows().length,
							sampleQueryResponseBody.length,
							'Number of rows returned from sample query on Model that should have loaded on page load ' +
							'and that should have created a default row only if none were found after first load attempt'
						);
						strictEqual(
							modelQueryOnPageLoadFalseDefaultRow.getRows().length,
							1,
							'Number of rows returned from sample query on Model that should NOT have loaded on page load ' + 
							'and that should have created a default row'
						);
						strictEqual(
							modelQueryOnPageLoadTrueDefaultRowNoResults.getRows().length,
							1,
							'Number of rows returned from sample query on Model that should have loaded on page load ' +
							'and that should have created a default row because none were found in the load'
						);
						strictEqual(
							modelQueryOnPageLoadFalseDefaultRowNoResults.getRows().length,
							1,
							'Number of rows returned from sample query on Model that should NOT have loaded on page load ' + 
							'and that should have created a default row'
						);
						strictEqual(
							true,
							modelQueryOnPageLoadFalseDefaultRow.isNewRow(
								modelQueryOnPageLoadFalseDefaultRow.getFirstRow()
							),
							'row in our Model should be a new, unsaved row'
						);
						strictEqual(
							true,
							modelQueryOnPageLoadTrueDefaultRowNoResults.isNewRow(
								modelQueryOnPageLoadTrueDefaultRowNoResults.getFirstRow()
							),
							'row in our Model should be a new, unsaved row'
						);
						strictEqual(
							true,
							modelQueryOnPageLoadFalseDefaultRowNoResults.isNewRow(
								modelQueryOnPageLoadFalseDefaultRowNoResults.getFirstRow()
							),
							'row in our Model should be a new, unsaved row'
						);

						//
						// Check metadata population
						//

						allModels.forEach(function(model){
							strictEqual(
								model.fields.length,3,
								'Number of fields in Model metadata fields ARRAY: ' + model.id
							);
							strictEqual(
								skuid.utils.size(model.fieldsMap),3,
								'Size of fields map in Model metadata: ' + model.id
							);
						});
						
						// Check field-specific metadata on each Model
						allModels.forEach(function(model){
							ok(model.getField('Id'),'Id field metadata should be present: ' + model.id);
							ok(model.getField('Name'),'Name field metadata should be present: ' + model.id);
						});
						loadTrueModels.forEach(function(model){
							ok(model.getField('ComicCount'),'ComicCount field metadata should be present: ' + model.id);
							strictEqual(
								'NUMBER',model.getField('ComicCount').displaytype,
								'displaytype of ComicCount field on Model: ' + model.id
							);
							notOk(model.getField('MaxSpeed'),
							'MaxSpeed field should NOT be present in Page Load TRUE Model: ' + model.id);
						});
						loadFalseModels.forEach(function(model){
							ok(model.getField('MaxSpeed'),'MaxSpeed field metadata should be present: ' + model.id);
							strictEqual(
								'NUMBER',model.getField('MaxSpeed').displaytype,
								'displaytype of MaxSpeed field on Model: ' + model.id
							);
							notOk(model.getField('ComicCount'),
							'ComicCount field should NOT be present in Page Load FALSE Model: ' + model.id);
						});

						// Now, call update data on our page load FALSE Models,
						// to actually load their data.

						// This endpoint will return some data
						xhrMock.get(
							scope.serviceUrl + '/' + scope.sampleObjectName + '?$select=Id,Name,MaxSpeed&$top=11',
							function(req,res){
								return res
									.status(200)
									.headers(scope.sampleQueryResponseHeaders)
									.body(scope.getSampleQueryResponseBody());
							}
						);

						// Request data from our dataSource
						skuid.model.updateData([
							modelQueryOnPageLoadFalse
						])
						.then(function(){
							strictEqual(
								modelQueryOnPageLoadFalse.getRows().length,
								sampleQueryResponseBody.length,
								'should now have rows in our model that we initially did NOT query initially but just did'
							);
							// Remove our mock
							xhrMock.teardown();
							// Finish our test
							done();
						});
					}
				});

				// Verify that our page component got created
				var numPageComponentsBefore = skuid.component.getByType('skuidpage').length;				

				// Now that we've setup our event subscription, actually create our page
				var pageComponent = test.createComponent({
					definition: pageXML
				});
				strictEqual(
					skuid.component.getByType('skuidpage').length,
					numPageComponentsBefore+1,
					'should be 1 more page component created now'
				);
			},
			
			'odata_insert_noauth' : function(test,scope) {
				
				var	done = test.async(),
					dataSource = scope.dataSource_noauth,
					fieldsToRequest = scope.sampleFieldsToRequest,
					recordsLimit = 20,
					orderBy = 'Name',
					modelXML = scope.getModelXML({
						fieldsXML: '<field id="' + fieldsToRequest.join('"/><field id="') + '"/>',
						recordsLimit: recordsLimit,
						orderBy: orderBy
					}),
					model = test.createModel(modelXML);

				// Don't query for records initially
				model.doQuery = false;
				
				// Verify that our dataSource and model are created and ready
				ok(skuid.dataSource.map().hasOwnProperty(dataSource.name),'DataSource was registered.');
				ok(skuid.model.map().hasOwnProperty(model.id),'Model created successfully.');
				
				// Setup our XHR mock, and setup our mock metadata endpoint
				xhrMock.setup();
				scope.setupMockMetadataEndpoint();

				// Mock OData insert endpoint
				xhrMock.post(scope.serviceUrl + '/$batch',function(req,res){
					return res
						.status(202)
						.headers(scope.sampleBatchResponseHeaders)
						.body(scope.sampleInsertResponseBody);
				});
				
				// Load our model to force the metadata call to succeed
				model.load().then(function(){
					strictEqual(0,model.getRows().length,'Should be no rows retrieved by query');
					// Create a row
					var row = model.createRow();
					model.updateRow(row,{
						"Name":"Christopher Nolan",
						"ComicCount":101,
						"SeriesCount":22,
						"HourlyRate":"123",
						"PunchForce":"1111",
						"MaxSpeed":4000
					});
					// Our model should have a temporary "new id"
					var tempId = model.getFieldValue(row,'Id');
					strictTrue(model.isNewId(tempId),"New row should have a temporary Id");
					strictEqual(model.getFieldValue(row,'Name',true),scope.sampleInsertRecord.Name,'Name set correctly');
					// Save our Model
					return model.save();
				})
				// Process save
				.then(function(){
					strictFalse(model.hasChanged,"model should not have any changes anymore");
					strictEqual(model.getRows().length,1,"Model should still have one row");
					var row = model.getFirstRow();
					strictFalse(model.isNewId(model.getFieldValue(row,'Id')),"Model should be a real Id not a temporary Id");
					var sampleRow = scope.sampleInsertRecord;
					$.each(fieldsToRequest,function(j,field){
						var modelValue = model.getFieldValue(row,field,true);
						var sampleValue = sampleRow[field];
						// Special type processing:
						// HourlyRate = Edm.Int64 ==> parse as integer
						if (field === 'HourlyRate') sampleValue = parseInt(sampleValue,10);
						// PunchForce = Edm.Decimal ==> parse as float
						else if (field === 'PunchForce') sampleValue = parseFloat(sampleValue);
						// Id ==> parse as string
						else if (field === 'Id') sampleValue = "" + sampleValue;
						strictEqual(sampleValue,modelValue,field + ' set correctly on Model row');
					});
					// Remove our mock
					xhrMock.teardown();
					// Finish our test
					done();
				});
			},
			'odata_update_noauth' : function(test,scope) {
				
				var	done = test.async(),
					dataSource = scope.dataSource_noauth,
					fieldsToRequest = scope.sampleFieldsToRequest,
					recordsLimit = 20,
					orderBy = 'Name',
					modelXML = scope.getModelXML({
						fieldsXML: '<field id="' + fieldsToRequest.join('"/><field id="') + '"/>',
						recordsLimit: recordsLimit,
						orderBy: orderBy
					}),
					model = test.createModel(modelXML);

				// Don't query for records initially
				model.doQuery = false;
				
				// Verify that our dataSource and model are created and ready
				ok(skuid.dataSource.map().hasOwnProperty(dataSource.name),'DataSource was registered.');
				ok(skuid.model.map().hasOwnProperty(model.id),'Model created successfully.');

				strictEqual(model.getRows().length,0,'To start, model should have NO rows in it');

				// Setup our XHR mock, and setup our mock metadata endpoint
				xhrMock.setup();
				scope.setupMockMetadataEndpoint();
				
				var rowUpdates;

				// Load our model to force the metadata call to succeed
				model.load().then(function(){
					strictEqual(0,model.getRows().length,'Should be no rows retrieved by query');
				
					// Adopt 2 rows into our Model initially
					var sampleRow1 = $.extend({},scope.sampleInsertRecord,{ Id: "1111", Name: "Batman" });
					var sampleRow2 = $.extend({},scope.sampleInsertRecord,{ Id: "2222", Name: "Spiderman" });
					model.adoptRows([sampleRow1,sampleRow2],{notify: false});

					strictEqual(model.getRows().length,2,'AFTER Adopting Rows, model should now have 2 rows in it');

					// Now, update both rows
					rowUpdates = {
						"1111": {
							"Name" : "Batwoman",
							"ComicCount": 202,
							"SeriesCount" : 44,
							"HourlyRate" : "246",
							"PunchForce" : "2222",
							"MaxSpeed" : 8000
						},
						"2222": {
							"Name" : "Spiderwoman",
							"ComicCount": 303,
							"SeriesCount" : 88,
							"HourlyRate" : "492",
							"PunchForce" : "4444",
							"MaxSpeed" : 16000
						}
					};
					model.updateRows(rowUpdates);

					// Make sure our updates worked
					strictEqual(model.getFieldValue(sampleRow1,"Name",true),"Batwoman","Batman should now be Batwoman");
					strictEqual(model.getFieldValue(sampleRow2,"Name",true),"Spiderwoman","Spiderman should now be Spiderwoman");

					// Setup our XHR mock, and setup our mock metadata endpoint
					xhrMock.setup();
					scope.setupMockMetadataEndpoint();

					// Mock OData update endpoint
					xhrMock.post(scope.serviceUrl + '/$batch',function(req,res){
						return res
							.status(202)
							.headers(scope.sampleBatchResponseHeaders)
							.body(scope.sampleUpdateResponseBody);
					});

					// Save our Model
					return model.save();
				})
				// Process save
				.then(function(){
					strictFalse(model.hasChanged,"model should not have any changes anymore");
					$.each(rowUpdates,function(rowId,updates){
						var row = model.getRowById(rowId);
						$.each(updates,function(field,value){
							strictEqual(value,model.getFieldValue(row,field,true),field + ' set correctly on Model row');
						});
					});
					// Remove our mock
					xhrMock.teardown();
					// Finish our test
					done();
				});
				
			},
			'odata_getkey' : function(test,scope) {
				//Verify that the string keys get wrapped in quotes
				var key = 231;
				var keyWithQuotes = '\''+key+'\'';
				var keyWithoutQuotes = key+'';
				var fakeItem = {
					"__metadata": {
						"type": "SkuidAllSwoll.SuperheroWithStringKey",
						"properties": {
							"Id": {
								"type": "Edm.String"
							},
							"Name": {
								"type": "Edm.String"
							},
						},
						"id": "https://skuid-allswoll.azurewebsites.net/dude3/SuperheroesV3Second('231')"
					},
					"Id": 231,
					"Name": "Shooting Star",
				};
				var fakeEntity  = {
					"name": "SuperheroWithStringKey",
					"key": {
						"propertyRef": [
							{
								"name": "Id"
							}
						]
					},
					"property": [
						{
							"name": "Id",
							"type": "Edm.String",
							"nullable": "false"
						},
						{
							"name": "Name",
							"type": "Edm.String"
						},
						
					],
					"__namespace": "SkuidAllSwoll"
				};
				var fakeDataService = {};
				var fakeModel = {
					fieldsMap: {
						"Id": {
							"id": "Id",
							"accessible": true,
							"createable": true,
							"editable": true,
							"sortable": true,
							"label": "Id",
							"displaytype": "NUMBER",
							"edmtype": "Edm.String",
						},
						"Name": {
							"id": "Name",
							"accessible": true,
							"createable": true,
							"editable": true,
							"sortable": true,
							"label": "Name",
							"displaytype": "STRING",
							"edmtype": "Edm.String",
							"filterable": true
						}
					}
				};
				
				var dataSource = scope.dataSource_noauth;
				var generatedKey;
				
				var typeHasQuotes =  {//true is indicative of has quotes or not
					'Edm.Decimal':true,'Edm.Guid':true,'Edm.Int64':true,'Edm.String':true,
				};
				var types = ['Edm.Boolean','Edm.Byte','Edm.Double','Edm.Int16','Edm.Int32','Edm.SByte','Edm.Single','Edm.Decimal','Edm.Guid','Edm.Int64','Edm.String'];
				
				$.each(types, function(i,v){
					fakeModel.fieldsMap.Id.edmtype = v;
					generatedKey  = dataSource.dataSourceType.getKey(fakeItem, fakeEntity, fakeDataService,fakeModel.fieldsMap);
					if(typeHasQuotes[v]){
						strictEqual(generatedKey,keyWithQuotes, v +' had quotes wrapped around it! :D');
					}
					else {
						strictEqual(generatedKey,keyWithoutQuotes, v +' DID NOT have quotes wrapped around it! :D');
					}
				});
				
				//Now try Odata 2.0
				var typeWithWeirdFormat = {
					'Edm.Guid':'guid\''+key+'\'',
					'Edm.Binary':'X\''+window.btoa(key)+'\''
				};
				types.push('Edm.Binary');
				fakeDataService = {dataServices:{dataServiceVersion:'2.0'}};
				$.each(types, function(i,v){
					fakeModel.fieldsMap.Id.edmtype = v;
					generatedKey  = dataSource.dataSourceType.getKey(fakeItem, fakeEntity, fakeDataService,fakeModel.fieldsMap);
					if(typeWithWeirdFormat[v]) {
						strictEqual(generatedKey,typeWithWeirdFormat[v], v +' Worked with weird OData2 formatting! :D');
					}
					else if(typeHasQuotes[v]){
						strictEqual(generatedKey,keyWithQuotes, v +' had quotes wrapped around it! :D');
					}
					else {
						strictEqual(generatedKey,keyWithoutQuotes, v +' DID NOT have quotes wrapped around it! :D');
					}
				});
				
				
			},
			
			'odata_delete_noauth' : function(test,scope) {
				var	done = test.async(),
					dataSource = scope.dataSource_noauth,
					fieldsToRequest = scope.sampleFieldsToRequest,
					recordsLimit = 20,
					orderBy = 'Name',
					modelXML = scope.getModelXML({
						fieldsXML: '<field id="' + fieldsToRequest.join('"/><field id="') + '"/>',
						recordsLimit: recordsLimit,
						orderBy: orderBy
					}),
					model = test.createModel(modelXML);

				// Don't query for records initially
				model.doQuery = false;
				
				// Verify that our dataSource and model are created and ready
				ok(skuid.dataSource.map().hasOwnProperty(dataSource.name),'DataSource was registered.');
				ok(skuid.model.map().hasOwnProperty(model.id),'Model created successfully.');

				strictEqual(model.getRows().length,0,'To start, model should have NO rows in it');

				// Setup our XHR mock, and setup our mock metadata endpoint
				xhrMock.setup();
				scope.setupMockMetadataEndpoint();

				// Load our model to force the metadata call to succeed
				model.load().then(function(){
					strictEqual(0,model.getRows().length,'Should be no rows retrieved by query');
				
					// Adopt 3 rows into our Model initially
					var sampleRow1 = $.extend({},scope.sampleInsertRecord,{ Id: "1111", Name: "Batman" });
					var sampleRow2 = $.extend({},scope.sampleInsertRecord,{ Id: "2222", Name: "Spiderman" });
					var sampleRow3 = $.extend({},scope.sampleInsertRecord,{ Id: "3333", Name: "Luigi Vampa" });
					model.adoptRows([sampleRow1,sampleRow2,sampleRow3],{notify: false});

					strictEqual(model.getRows().length,3,'AFTER Adopting Rows, model should now have 3 rows in it');

					// Now delete the 1st and 2nd row
					model.deleteRows([0,2]);

					// Setup our XHR mock, and setup our mock metadata endpoint
					xhrMock.setup();
					scope.setupMockMetadataEndpoint();

					// Mock OData update endpoint
					xhrMock.post(scope.serviceUrl + '/$batch',function(req,res){
						return res
							.status(202)
							.headers(scope.sampleBatchResponseHeaders)
							.body(scope.sampleDeleteResponseBody);
					});

					// Save our Model
					return model.save();
				})
				// Process save
				.then(function(){
					strictFalse(model.hasChanged,"model should not have any changes anymore");
					strictEqual(model.getRows().length,1,'there should only be one row left');
					strictEqual(model.getFirstRow().Name,"Spiderman","Remaining row should be Spiderman");
					// Remove our mock
					xhrMock.teardown();
					// Finish our test
					done();
				});
			},
			
			'odata_query_basichttp_auth' : function(test,scope) {

				var done = test.async(),
					fieldsToRequest = scope.sampleFieldsToRequest,
					recordsLimit = 20,
					orderBy = 'Name',
					dataSource = scope.dataSource_httpauth,
					modelXML = scope.getModelXML({
						dataSourceName : dataSource.name,
						fieldsXML: '<field id="' + fieldsToRequest.join('"/><field id="') + '"/>',
						recordsLimit: recordsLimit,
						orderBy: orderBy,
						conditionsXML: '<condition type="fieldvalue" value="100" enclosevalueinquotes="false" field="HourlyRate" operator="gte"/>'
					}),
					model = test.createModel(modelXML);
				
				// Verify that our dataSource and model are created and ready
				ok(skuid.dataSource.map().hasOwnProperty(dataSource.name),'DataSource was registered.');
				ok(skuid.model.map().hasOwnProperty(model.id),'Model created successfully.');

				// Setup our XHR mock, and setup our mock metadata endpoint
				xhrMock.setup();
				scope.setupMockMetadataEndpoint();

				// Mock OData query endpoint
				var queryUrl = scope.serviceUrl + '/' + scope.sampleObjectName +
					'?$select=' + fieldsToRequest.join(',') +
					'&$orderby=' + orderBy + 
					'&$filter=HourlyRate%20ge%20100' +
					'&$top=' + (recordsLimit+1);

				xhrMock.get(queryUrl,function(req,res){
					strictEqual(
						req.header('Authorization'),
						'Basic YmVuaDpwNDU1dzByZA==',
						'Authorization header should be set in query requests to Basic HTTP Auth'
					);
					return res
						.status(200)
						.headers(scope.sampleQueryResponseHeaders)
						.body(scope.getSampleQueryResponseBody());
				});
				
				// Request data from our dataSource
				model.load().then(function(){
					var sampleQueryResponseBody = scope.getSampleQueryResponseBody().value;
					strictEqual(
						model.getRows().length,
						sampleQueryResponseBody.length,
						'Number of rows returned from sample query'
					);
					// Remove our mock
					xhrMock.teardown();
					// Finish our test
					done();
				});
				
			},
			'odata_query_separateurl_auth' : function(test,scope) {

				var done = test.async(),
					fieldsToRequest = scope.sampleFieldsToRequest,
					recordsLimit = 20,
					orderBy = 'Name',
					dataSource = scope.dataSource_separateurlauth,
					modelXML = scope.getModelXML({
						dataSourceName : dataSource.name,
						fieldsXML: '<field id="' + fieldsToRequest.join('"/><field id="') + '"/>',
						recordsLimit: recordsLimit,
						orderBy: orderBy,
						conditionsXML: '<condition type="fieldvalue" value="100" enclosevalueinquotes="false" field="HourlyRate" operator="gte"/>'
					}),
					model = test.createModel(modelXML);
				
				// Verify that our dataSource and model are created and ready
				ok(skuid.dataSource.map().hasOwnProperty(dataSource.name),'DataSource was registered.');
				ok(skuid.model.map().hasOwnProperty(model.id),'Model created successfully.');

				// Setup our XHR mock, and setup our mock metadata endpoint
				xhrMock.setup();
				scope.setupMockMetadataEndpoint();

				// Mock the authorization endpoint
				xhrMock.post(scope.serviceUrl + scope.loginEndpoint,function(req,res){
					strictEqual(
						req.body(),
						'{"password":"' + scope.samplePassword + '","email":"' + scope.sampleUsername + '"}',
						'The payload was populated successfully!'
					);
					return res
						.status(200)
						.headers({
							token : scope.sampleToken
						})
						.body(JSON.stringify({
							token : scope.sampleToken
						}));
				});

				// Mock OData query endpoint
				var queryUrl = scope.serviceUrl + '/' + scope.sampleObjectName +
					'?$select=' + fieldsToRequest.join(',') +
					'&$orderby=' + orderBy + 
					'&$filter=HourlyRate%20ge%20100' +
					'&$top=' + (recordsLimit+1);

				xhrMock.get(queryUrl,function(req,res){
					// Verify that our dataSource has the authorization info we expect
					var s = model.getDataSource();
					strictTrue(s.isAuthenticated(),'model dataSource should be authenticated');
					strictEqual(
						req.header('Authorization'),
						'Bearer ' + scope.sampleToken,
						'Authorization header should be set in query requests to token retrieved from separate auth url'
					);
					return res
						.status(200)
						.headers(scope.sampleQueryResponseHeaders)
						.body(scope.getSampleQueryResponseBody());
				});
				
				// Request data from our dataSource
				model.load().then(function(){
					var sampleQueryResponseBody = scope.getSampleQueryResponseBody().value;
					strictEqual(
						model.getRows().length,
						sampleQueryResponseBody.length,
						'Number of rows returned from sample query'
					);
					// Remove our mock
					xhrMock.teardown();
					// Finish our test
					done();
				});

			},
			// Tests OData error handling when a Model has no object name specified,
			// (which is possible from the Page Composer)
			'SKUID-1928_ErrorHandlingWhenModelHasNoObjectName' : function(test,scope) {

				var	done = test.async(),
					dataSource = scope.dataSource_noauth,
					// Create an OData Model with no object name specified
					modelXML = 
						'<model datasourcetype="'+ODATA_DATA_SOURCE_TYPE_NAME+'" datasource="'+dataSource.name+
						'" processonclient="true" query="true" limit="10" orderby="Name" createrowifnonefound="false">' +
							'<fields><field id="Id"/><field id="Name"/></fields>' +
						'</model>',
					model = test.createModel(modelXML);
				
				// Verify that our dataSource and model are created and ready
				ok(skuid.dataSource.map().hasOwnProperty(dataSource.name),'DataSource was registered.');
				ok(skuid.model.map().hasOwnProperty(model.id),'Model created successfully.');
				strictEqual(dataSource.name,model.getDataSource().name,'make sure model was associated to the correct dataSource');
				strictEqual(model.objectName,undefined,'model should have no object name specified');

				// Setup our XHR mock, and setup our mock metadata endpoint
				xhrMock.setup();
				scope.setupMockMetadataEndpoint();
				
				var numPageProblemsBefore = skuid.page.getAllProblems().length;

				// Request data from our dataSource
				model.load().fail(function(){
					strictEqual(model.getRows().length,0,'No rows should be retrieved');
					// Test that a page problem was added
					var allProblems =skuid.page.getAllProblems();
					strictEqual(allProblems.length,numPageProblemsBefore+1,'Should be one additional page problem');
					var expectedMessage = "There was a problem with an OData Query: No object name specified for Model: " + model.id;
					var problem = allProblems[allProblems.length-1];
					strictEqual(problem.message,expectedMessage,"page problem message");
					// Remove our page problem
					skuid.component.getByType('skuidpage')[0].removeProblem(problem);
					// Rebuild list of problems
					skuid.page.rebuildPageProblems();
					strictEqual(skuid.page.getAllProblems().length,numPageProblemsBefore,'problem should be gone');
					// Remove our mock
					xhrMock.teardown();
					// Finish our test
					done();
				});
				
			},
			//	Tests around condition construction
			//
			//	Issue(s) Verified:
			//
			//		1. Inactive conditions are not properly being ignored when building request (SKUID-2230)
			'conditions' : function(test,scope) {
				var	done = test.async(),
					dataSource = scope.dataSource_noauth,
					fieldsToRequest = scope.sampleFieldsToRequest,
					recordsLimit = 20,
					orderBy = 'Name',
					modelXML = scope.getModelXML({
						fieldsXML: '<field id="' + fieldsToRequest.join('"/><field id="') + '"/>',
						recordsLimit: recordsLimit,
						orderBy: orderBy,
						conditionsXML:
							'<condition type="fieldvalue" value="Person" enclosevalueinquotes="true" field="Name" operator="!=" state="off" inactive="true"/>' +
							'<condition type="fieldvalue" value="Other Person" enclosevalueinquotes="true" field="Name" operator="!=" state="off" inactive="true"/>' 
					}),
					model = test.createModel(modelXML);
				
				// Verify that our dataSource and model are created and ready
				ok(skuid.dataSource.map().hasOwnProperty(dataSource.name),'DataSource was registered.');
				ok(skuid.model.map().hasOwnProperty(model.id),'Model created successfully.');

				// Setup our XHR mock, and setup our mock metadata endpoint
				xhrMock.setup();
				scope.setupMockMetadataEndpoint();

				// Mock OData query endpoint
				var queryUrl = scope.serviceUrl + '/' + scope.sampleObjectName +
					'?$select=' + fieldsToRequest.join(',') +
					'&$orderby=' + orderBy + 
					'&$top=' + (recordsLimit+1);

				xhrMock.get(queryUrl,function(req,res){
					return res
						.status(200)
						.headers(scope.sampleQueryResponseHeaders)
						.body(scope.getSampleQueryResponseBody());
				});
				
				// Request data from our dataSource
				model.load().then(function(){
					//	We don't actually care about the data, just check the conditions
					strictEqual(model.conditions.length,2,'SHOULD have TWO conditions');

					model.conditions.forEach(function(condition){
						strictTrue(condition.inactive,'Condition SHOULD be inactive');
					});

					// Remove our mock
					xhrMock.teardown();
					// Finish our test
					done();
				});
			},
			
			// This tests that model conditions are also automatically added to
			// the model's `fields` property when processed client-side (this
			// was previously only happening during server-side processing).
			// 
			// Issues verified:
			// 
			//     1. Client-side model conditions (SKUID-1564)
			//
			//
			'processClientSide.modelConditions': function (test, scope) {
				var	done = test.async(),
					fieldsToRequest = [
						'Id',
						'Name',
						'ComicCount',
						'SeriesCount',
						'HourlyRate',
						'AvailableFrom',
						'AvailableTo'
					],
					fieldCount = fieldsToRequest.length,
					recordsLimit = 20,
					orderBy = 'Name',
					activeConditionFieldId = 'PunchForce',
					conditions = [
						'<condition type="fieldvalue" value="Person" enclosevalueinquotes="true" field="Name" operator="!=" state="off" inactive="true"/>',
						'<condition type="fieldvalue" value="Other Person" enclosevalueinquotes="true" field="Name" operator="!=" state="off" inactive="true"/>',
						'<condition type="fieldvalue" value="5" enclosevalueinquotes="true" field="MaxSpeed" operator="gte" state="off" inactive="true"/>',
						'<condition type="fieldvalue" value="5" enclosevalueinquotes="false" field="' + activeConditionFieldId + '" operator="gte" state="on" inactive="false"/>' 	
					],
					model = test.createModel(scope.getModelXML({
						fieldsXML: '<field id="' + fieldsToRequest.join('"/><field id="') + '"/>',
						recordsLimit: recordsLimit,
						orderBy: orderBy,
						conditionsXML: conditions.join()
					}));
				
				xhrMock.setup();
				scope.setupMockMetadataEndpoint();			
				
				// Mock OData query endpoint
				var queryUrl = scope.serviceUrl + '/' + scope.sampleObjectName +
					'?$select=' + fieldsToRequest.join(',') +
					'&$orderby=' + orderBy + 
					'&$filter=' + activeConditionFieldId + '%20ge%205' +
					'&$top=' + (recordsLimit + 1);

				xhrMock.get(queryUrl, function (req, res) {
					return res
						.status(200)
						.headers(scope.sampleQueryResponseHeaders)
						.body(scope.getSampleQueryResponseBody());
				});
	
				model.load().then(function () {
					
					// The expected field count for this test is the number of
					// fields the model currently contains (7) plus however many
					// conditions have been specified that are not duplicates.
					var expectedCondCount = conditions.length,
						expectedFieldCount = fieldCount + (model.conditions.length - 2);
					
					strictEqual(model.conditions.length, expectedCondCount, 'There should be 4 model conditions');
					strictEqual(model.fields.length, expectedFieldCount, 'There should be 9 model fields');
					
					// If duplicates had been added there would be a total of 11
					// fields since 'Name' is referenced as a condition twice.
					notStrictEqual(model.fields.length, expectedFieldCount + 2, 'There are two conditions that should be excluded');
					
					// Make sure that we don't get data from our active condition's field
					strictFalse(skuid.utils.hasObjectProperty(model.getFirstRow(),activeConditionFieldId),'Data row should NOT contain the active condition field');
					xhrMock.teardown();
					done();
				});
			}
		}
	});
	
})(skuid);