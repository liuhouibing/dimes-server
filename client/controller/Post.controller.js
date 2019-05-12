sap.ui.define([
	'./BaseController',
	'sap/ui/model/json/JSONModel',
	'../model/formatter',
	"sap/m/MessageToast",
	"sap/m/MessageBox"], function (BaseController, JSONModel, formatter, MessageToast, MessageBox) {
	"use strict";

	return BaseController.extend("sap.ui.demo.bulletinboard.controller.Post", {

		formatter: formatter,

		/* =========================================================== */
		/* lifecycle methods                                           */
		/* =========================================================== */

		/**
		 * Called when the worklist controller is instantiated.
		 * @public
		 */
		onInit: function () {
			// Model used to manipulate control states. The chosen values make sure,
			// detail page is busy indication immediately so there is no break in
			// between the busy indication for loading the view's meta data
			var oViewModel = new JSONModel({
				busy: false
			});

			this.getRouter().getRoute("post").attachPatternMatched(this._onPostMatched, this);
			this.setModel(oViewModel, "postView");
		},

		/* =========================================================== */
		/* event handlers                                              */
		/* =========================================================== */

		/**
		 * Navigates back to the worklist
		 * @function
		 */
		onNavBack: function () {
			this.myNavBack("worklist");
		},
 
		handleToggleButtonPress: function(oEvent){
			var oData =  oEvent.getSource().getBindingContext().getObject();
			//console.log(oEvent.getSource().data("PostID"));
			var oDataModel = this.getModel();
			var msg = "记录标记删除后将不计入总数?"

			if (oData.Flagged == true) {
				oData.Flagged = "1"	;
			} else {
				msg = "取消删除记录标记";
				oData.Flagged = "0";
			}

			MessageBox.show(
				msg, {
					icon: MessageBox.Icon.INFORMATION,
					title: "确认",
					actions: [MessageBox.Action.YES, MessageBox.Action.NO],
					onClose: function(oAction) { 
						if(oAction =='NO') return;	
						
						$.ajax({
							url: "/api/Posts/" + oData.PostID +"?access_token=" + jQuery.sap.getUriParameters().get("access_token"),
							type:"PUT",
							data: JSON.stringify(oData),
							contentType:"application/json",
							success:function() {
								MessageToast.show("记录状态跟新成功");													
							}.bind(this),
							error:function(err) {
								MessageToast.show("记录状态更新失败", err);
							}
						}); 
					}
				}
			);
			
		},
		/* =========================================================== */
		/* internal methods                                            */
		/* =========================================================== */

		/**
		 * Binds the view to the post path.
		 *
		 * @function
		 * @param {sap.ui.base.Event} oEvent pattern match event in route 'object'
		 * @private
		 */
		_onPostMatched: function (oEvent) {
			var oViewModel = this.getModel("postView"),
				oDataModel = this.getModel();

			this.getView().bindElement({
				path: "/Posts('" + oEvent.getParameter("arguments").postId + "')",
				events: {
					dataRequested: function () {
						oDataModel.metadataLoaded().then(function () {
							// Busy indicator on view should only be set if metadata is loaded,
							// otherwise there may be two busy indications next to each other on the
							// screen. This happens because route matched handler already calls '_bindView'
							// while metadata is loaded.
							oViewModel.setProperty("/busy", true);
						});
					},
					dataReceived: function () {
						oViewModel.setProperty("/busy", false);
					}
				}
			});

			var title = '';
			Object.values(oDataModel.oData).forEach(element => {				
				if (element.PostID == oEvent.getParameter("arguments").postId) {
					title = element.Title;
				}
			});
			
			if (title != '') {				
				var token = jQuery.sap.getUriParameters().get("access_token"); 				
				var headers = {"Authorization" : token};
				var subTableModel = new sap.ui.model.json.JSONModel();
				
				subTableModel.loadData(
					oDataModel.sServiceUrl + "/Posts?$filter=Title eq '" + title +"'",
					null, true, "GET", false, true, headers
					);

				this.getView().setModel(subTableModel,"subTableModel");	
			}
		}

	});

});
