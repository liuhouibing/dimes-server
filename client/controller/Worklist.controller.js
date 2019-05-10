sap.ui.define([
	'./BaseController',
	'sap/ui/model/json/JSONModel',
	'../model/formatter',
	'../model/FlaggedType',
	"sap/ui/model/Filter",
	"sap/ui/model/FilterOperator",
	'sap/m/library',
	"sap/m/MessageToast",
	"sap/m/MessageBox"
], function (BaseController, JSONModel, formatter, FlaggedType, Filter, FilterOperator, mobileLibrary, MessageToast, MessageBox) {
	"use strict";

	return BaseController.extend("sap.ui.demo.bulletinboard.controller.Worklist", {
		types : {
			flagged: new FlaggedType()
		},

		formatter: formatter,

		/* =========================================================== */
		/* lifecycle methods                                           */
		/* =========================================================== */

		/**
		 * Called when the worklist controller is instantiated.
		 * @public
		 */
		onInit: function () {
			var oViewModel,
				iOriginalBusyDelay,
				oTable = this.byId("table");

			// Put down worklist table's original value for busy indicator delay,
			// so it can be restored later on. Busy handling on the table is
			// taken care of by the table itself.
			iOriginalBusyDelay = oTable.getBusyIndicatorDelay();

			// Model used to manipulate control states
			oViewModel = new JSONModel({
				worklistTableTitle: this.getResourceBundle().getText("worklistTableTitle"),
				shareSendEmailSubject: this.getResourceBundle().getText("shareSendEmailWorklistSubject"),
				shareSendEmailMessage: this.getResourceBundle().getText("shareSendEmailWorklistMessage", [window.location.href]),
				tableBusyDelay: 0
			});
			this.setModel(oViewModel, "worklistView");

			// Make sure, busy indication is showing immediately so there is no
			// break after the busy indication for loading the view's meta data is
			// ended (see promise 'oWhenMetadataIsLoaded' in AppController)
			oTable.attachEventOnce("updateFinished", function () {
				// Restore original busy indicator delay for worklist's table
				oViewModel.setProperty("/tableBusyDelay", iOriginalBusyDelay);
			});


		//---DIMES added
		if (!this.getView()._oDialog) {
			this.getView()._oDialog = sap.ui.xmlfragment("sap.ui.demo.bulletinboard.view.PostForm", this);
			this.getView().addDependent(this.getView()._oDialog);			
			jQuery.sap.syncStyleClass("sapUiSizeCompact", this.getView(), this.getView()._oDialog);
		}

		if (!this.getView()._oCategoryDialog) {
			this.getView()._oCategoryDialog = sap.ui.xmlfragment("sap.ui.demo.bulletinboard.view.Category", this);
			this.getView().addDependent(this.getView()._oCategoryDialog);			
			jQuery.sap.syncStyleClass("sapUiSizeCompact", this.getView(), this.getView()._oCategoryDialog);
		}

		if (!this.getView()._oSumDialog) {
			this.getView()._oSumDialog = sap.ui.xmlfragment("sap.ui.demo.bulletinboard.view.Sum", this);
			this.getView().addDependent(this.getView()._oSumDialog);			
			jQuery.sap.syncStyleClass("sapUiSizeCompact", this.getView(), this.getView()._oSumDialog);
		}

	},

		handlePressOpenMenu: function(oEvent) {
			var oButton = oEvent.getSource();

			// create menu only once
			if (!this._menu) {
				this._menu = sap.ui.xmlfragment(
					"sap.ui.demo.bulletinboard.view.Menu", this
				);
				this.getView().addDependent(this._menu);
			}

			var eDock = sap.ui.core.Popup.Dock;
			this._menu.open(this._bKeyboard, oButton, eDock.BeginTop, eDock.BeginBottom, oButton);
		},


		handleMenuItemPress: function(oEvent){
			var oData =
			{	
				CategoryID: '3',				
				Name: '老人过寿',
				EventDate: ""
			};

			var oButton = oEvent.getParameters("item");
						
			if (oButton.item.sId == "createCategory") {				
				var documentModel = new sap.ui.model.json.JSONModel();
				documentModel.setData(oData);	
				this.getView().setModel(documentModel, "oCategoryModel");
				this.getView()._oCategoryDialog.open();
			} else if (oButton.item.sId == "listCategories") {
				var oDataModel = this.getModel();
				var token = jQuery.sap.getUriParameters().get("access_token"); 				
				var headers = {"Authorization" : token};
					
				var subTableModel = new sap.ui.model.json.JSONModel();
				subTableModel.loadData(
					oDataModel.sServiceUrl + "/postsums?$select=Category,EventDate,Price&$orderby=EventDate",
					null, true, "GET", false, true, headers
					);
				this.getView().setModel(subTableModel,"oSumModel");	
				this.getView()._oSumDialog.open();
			}else if (oButton.item.sId == "logout") {
				window.location.replace("/logout?access_token=" + jQuery.sap.getUriParameters().get("access_token"));
			}else if (oButton.item.sId == "changePassword") {
				window.location.replace("/password-change" 
				+ "?access_token=" + jQuery.sap.getUriParameters().get("access_token") 				
				+ "&userId=" + jQuery.sap.getUriParameters().get("userId")
				+ "&email="  + jQuery.sap.getUriParameters().get("email") );
			}
			
		},

		handleRadioButtonGroup: function(oEvent){			
			var oLabelPrice = sap.ui.getCore().byId("LabelPrice"); 
			if(oEvent.getSource().getSelectedIndex() == 0 ){				
				oLabelPrice.setText("收到金额");
			}else{
				oLabelPrice.setText("支出金额 ( - )");
			};
		},


		onPostForm: function(oEvent) {
			var oData =
			{	Currency: "",
				Title: '李四',
				Description: '李四送礼',
				Category: '',
				Contact: '1329929299',
				Price: '100.00'
			};

			//Cache the last category selection.
			var oLastModel = this.getView().getModel("oModel");			
			if (oLastModel) {
				oData.Category = oLastModel.getData().Category;
			}
		
			var documentModel = new sap.ui.model.json.JSONModel();
			documentModel.setData(oData);

			this.getView().setModel(documentModel, "oModel");
			this.getView()._oDialog.open();
		}, 

		onPostFormCancel: function(oEvent) {			
				this.getView()._oDialog.close();
		}, 

		onCategoryCancel: function(oEvent) {			
			this.getView()._oCategoryDialog.close();
		}, 
	
		onSumCancel: function(oEvent) {			
			this.getView()._oSumDialog.close();
		}, 
	
		onPostFormSave: function(oEvent) {			
			var oData = this.getView().getModel("oModel").getData();			
			var oRadioGroupIncomeExpense = sap.ui.getCore().byId("RadioGroupIncomeExpense"); 
			var oInputTitle = sap.ui.getCore().byId("InputTitle"); 
			var oInputPrice = sap.ui.getCore().byId("InputPrice"); 
			var oComboBoxCategory = sap.ui.getCore().byId("ComboBoxCategory"); 

			var error = false;
			
			if (oData.Title.trim() == '') {				
				oInputTitle.setValueState(sap.ui.core.ValueState.Error);				
				var error = true;
			} else{
				oInputTitle.setValueState(sap.ui.core.ValueState.Success);
			};
			
			if(oData.Price <= 0 ) {			
				oInputPrice.setValueState(sap.ui.core.ValueState.Error);
				var error = true;
			}else{
				oInputPrice.setValueState(sap.ui.core.ValueState.Success);				
			};
			
			if(oData.Category == ''){				
				oComboBoxCategory.setValueState(sap.ui.core.ValueState.Error);
				var error = true;
			}else{
				oComboBoxCategory.setValueState(sap.ui.core.ValueState.Success);
			};

			if(oRadioGroupIncomeExpense.getSelectedIndex() == 0 ){				
				oData.Price = Math.abs(oData.Price).toString();
			}else{
				oData.Price = (oData.Price * -1).toString();
			};

			if (error) {
				return;
			}
			
			oData.UserID = jQuery.sap.getUriParameters().get("userId");
			//var OdataModel = this.getOwnerComponent().getModel();
			//oData.PostID = Date.now().toString();
			 function  getTime() {
				var date = new Date();
			
				var month = date.getMonth() + 1;
				var day = date.getDate();
				var hour = date.getHours();
				var min = date.getMinutes();
				var sec = date.getSeconds();
			
				month = (month < 10 ? "0" : "") + month;
				day = (day < 10 ? "0" : "") + day;
				hour = (hour < 10 ? "0" : "") + hour;
				min = (min < 10 ? "0" : "") + min;
				sec = (sec < 10 ? "0" : "") + sec;
			
				var str = date.getFullYear()  + month + day + " " +  hour + ":" + min + ":" + sec;
			
					return str;
			};

			oData.Timestamp = getTime();  

			$.ajax({
				url: "/api/Posts?access_token=" + jQuery.sap.getUriParameters().get("access_token"),
				type:"POST",
				data: JSON.stringify(oData),
				contentType:"application/json",
				success:function() {
					MessageToast.show("记录保存成功");	
					this.getOwnerComponent().getModel().refresh(true);		
					this.getView()._oDialog.close();	
				}.bind(this),
				error:function(err) {
					MessageToast.show("记录保存失败", err);
				}
			}); 

			// OdataModel.create("/Posts", oData, {success: function(){
			// 	MessageToast.show("记录保存成功");			
			// 	this.getView()._oDialog.close();				
			// }.bind(this), error: function(){
			// 	MessageToast.show("记录保存失败");
			// }});

		
		}, 

		
		onCategorySave: function(oEvent) {			
			var oData = this.getView().getModel("oCategoryModel").getData();			
			var oInputName = sap.ui.getCore().byId("InputName"); 
			var oInputEventDate = sap.ui.getCore().byId("InputEventDate"); 

			var error = false;
 			 		 
			if(oData.Name == ''){				
				oInputName.setValueState(sap.ui.core.ValueState.Error);
				var error = true;
			}else{
				oInputName.setValueState(sap.ui.core.ValueState.Success);
			};
			
			if(oData.EventDate == ''){				
				oInputEventDate.setValueState(sap.ui.core.ValueState.Error);
				var error = true;
			}else{
				oInputEventDate.setValueState(sap.ui.core.ValueState.Success);
			};

			if (error) {
				return;
			}

			//var OdataModel = this.getOwnerComponent().getModel();
			oData.CategoryID = oData.Name; //Date.now().toString();
			oData.UserID = jQuery.sap.getUriParameters().get("userId");

			$.ajax({
				url: "/api/Categorys" +"?access_token=" + jQuery.sap.getUriParameters().get("access_token"),
				type:"POST",
				data: JSON.stringify(oData),
				contentType:"application/json",
				success:function() {
					MessageToast.show("事件创建成功");			
					this.getView()._oCategoryDialog.close();
					this.getOwnerComponent().getModel().refresh(true);				
					console.log(this.getOwnerComponent().getModel());
					
				}.bind(this),
				error:function(err) {
					MessageToast.show("事件创建失败", err);
				}
			}); 
 
		
		}, 

		handleSelectCategory: function (oEvent) {
			var sQuery =  oEvent.getSource().data("Category");
		
			// build filter array
			var aFilters = [];			
			var oTable = this.byId("table");
			var oBinding = oTable.getBinding("items");
		
			if (sQuery) {				
				aFilters.push(new Filter("Category", FilterOperator.EQ, sQuery));				
				oBinding.filter(aFilters);
			}else{
				oBinding.filter(null);
			}
			
			this.getView()._oSumDialog.close();
		},
		/* =========================================================== */
		/* event handlers                                              */
		/* =========================================================== */

		/**
		 * Triggered by the table's 'updateFinished' event: after new table
		 * data is available, this handler method updates the table counter.
		 * This should only happen if the update was successful, which is
		 * why this handler is attached to 'updateFinished' and not to the
		 * table's list binding's 'dataReceived' method.
		 *
		 * @param {sap.ui.base.Event} oEvent the update finished event
		 * @public
		 */
		onUpdateFinished: function (oEvent) {
			// update the worklist's object counter after the table update
			var sTitle,
				oTable = oEvent.getSource(),
				iTotalItems = oEvent.getParameter("total");
			// only update the counter if the length is final and
			// the table is not empty
			if (iTotalItems && oTable.getBinding("items").isLengthFinal()) {
				sTitle = this.getResourceBundle().getText("worklistTableTitleCount", [iTotalItems]);
			} else {
				sTitle = this.getResourceBundle().getText("worklistTableTitle");
			}
			this.getModel("worklistView").setProperty("/worklistTableTitle", sTitle);

			var sUser = this.getResourceBundle().getText("worklistCurrentUser", jQuery.sap.getUriParameters().get("userId"));
			this.getModel("worklistView").setProperty("/worklistCurrentUser", sUser);
		},

		/**
		 * Triggered by the SearchFields's 'search' event
		 * @param {sap.ui.base.Event} oEvent SearchFields's search event
		 * @public
		 */
		onFilterPosts: function (oEvent) {

			// build filter array
			var aFilters = [];
			var sQuery = oEvent.getParameter("query");
			var oTable = this.byId("table");
			var oBinding = oTable.getBinding("items");
	
			if (sQuery) {
				aFilters.push(new Filter("Title", FilterOperator.EQ, sQuery));
				aFilters.push(new Filter("Category", FilterOperator.EQ, sQuery));
				var oFilterToSetOnTheTable = new Filter({
					filters: aFilters,
					and: false  //OR
				});
				// filter binding
				oBinding.filter(oFilterToSetOnTheTable);
			}else{
				oBinding.filter(null);
			}
			
		
		},

		/**
		 * Event handler when a table item gets pressed
		 * @param {sap.ui.base.Event} oEvent the table selectionChange event
		 * @public
		 */
		onPress: function (oEvent) {
			
			this.getRouter().navTo("post", {
				// The source is the list item that got pressed
				postId: oEvent.getSource().getBindingContext().getProperty("PostID"),
				title: oEvent.getSource().getBindingContext().getProperty("Title")
			});

		},

		/* =========================================================== */
		/* internal methods                                            */
		/* =========================================================== */

		/**
		 * Sets the item count on the worklist view header
		 * @param {int} iTotalItems the total number of items in the table
		 * @private
		 */
		_updateListItemCount: function (iTotalItems) {
			var sTitle;
			// only update the counter if the length is final
			if (this._oTable.getBinding("items").isLengthFinal()) {
				sTitle = this.getResourceBundle().getText("worklistTableTitleCount", [iTotalItems]);
				this.oViewModel.setProperty("/worklistTableTitle", sTitle);
			}
		},

		/**
		 * Event handler when the share by E-Mail button has been clicked
		 * @public
		 */
		onShareEmailPress: function () {
			var oViewModel = this.getModel("worklistView");
			mobileLibrary.URLHelper.triggerEmail(
				null,
				oViewModel.getProperty("/shareSendEmailSubject"),
				oViewModel.getProperty("/shareSendEmailMessage")
			);
		}
	});

});
