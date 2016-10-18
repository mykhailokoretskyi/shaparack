//####################################
//   BaseRESTWidget
//####################################

restWidget = {
    _Model: webWidget.model.extend({}),
    _Collection: webWidget.collection.extend({}),
    _View: webWidget.view.extend({
        initialize: function () {
            this.init();
        },
        init: function () {

        }
    })
};
restWidget._WidgetView = restWidget._View.extend({

});
restWidget._ItemView = restWidget._View.extend({

});
restWidget._AddEditView = restWidget._View.extend({

});
restWidget.initialize = function(selector, options){
    var widget = this;
    if (!selector && typeof options !== 'object' && options)
        return;

    this.cssFramework = options.cssFramework || 'materialize';

    var modelOptions = {

    };
    this.Model = this._Model.extend(options.modelOptions ? extendOptions(modelOptions, options.modelOptions) : modelOptions);

    var collectionOptions = {
        model: this.Model
    };
    this.Collection = this._Collection.extend(options.collectionOptions ? extendOptions(collectionOptions, options.collectionOptions) : collectionOptions);
    this.collection = new this.Collection(options.mainDataset || {});

    var itemViewOptions = {
        el: selector + " .itemWidgetWrapper",
        events: {
            "click .removeItem": "removeItem",
            "click .editItem": "editItem"
        },
        initialize: function(){
            this.init();
        },
        render: function(options){
            var collection = options ? options.collection || widget.collection : widget.collection;
            this.$el.html(this.template({
                data: collection.toJSON()
            }));
            return this;
        },
        removeItem: function(e){
            var itemData = $(e.currentTarget).data();
            var item = widget.collection.get(itemData.id);
            item.destroy();
            e.preventDefault();
            return this;
        },
        editItem: function(e){
            e.preventDefault();
            var itemData = $(e.currentTarget).data();
            var item = widget.collection.get(itemData.id);
            widget.createAddEditItemView("update", item);
            return this;
        }
    };
    this.ItemView = this._ItemView.extend(options.itemView ? extendOptions(itemViewOptions, options.itemView) : itemViewOptions);

    var addEditViewOptions = {
        el: selector + " .addEditWidgetDialog",
        events: {
            "click .create" : "createItem",
            "click .update": "updateItem",
            "click .closeDialog": "closeDialog"
        },
        initialize: function(action, item){
            this.model = widget.collection.model;
            this.init();
            this.render(item || new widget.Model());
        },
        init: function(){},
        render: function(item){
            this.$el.html(this.template({
                data: item.toJSON()
            }));
            //this.fillFormWithData(springRepresentation);
            if (widget.cssFramework == "materialize")
                this.$el.find("select").material_select();
            this.$modalDialog = this.$el.find("div.modal");
            this.openDialog();
            return this;
        },
        createItem: function(e){
            var self = this;
            e.preventDefault();
            e.stopPropagation();
            var item = this.getDataFromForm();
            widget.collection.create(item,{
                success: function(model, response, options){
                    self.closeDialog();
                },
                error: this.errorHandler
            });
            return false;
        },
        updateItem: function(e){
            var self = this;
            e.preventDefault();
            e.stopPropagation();
            var data = this.getDataFromForm();
            if (typeof data != "undefined" && data.id) {
                var item = widget.collection.get(data.id);
                var newItem = new this.model(data);
                item.save(newItem, {
                    success: function () {
                        self.closeDialog();
                    },
                    error: function () {
                    }
                });
            }
            return false;
        },
        closeDialog: function(e){
            if (e) e.preventDefault();
            if (widget.addEditView) {
                if (widget.cssFramework == 'materialize') {
                    widget.addEditView.$modalDialog.closeModal();
                } else if (widget.cssFramework == "bootstrap") {
                    widget.addEditView.$modalDialog.modal('hide');
                }
                widget.addEditView.undelegateEvents();
                delete widget.addEditView;
            }
            return false;
        },
        openDialog: function(){
            if (widget.cssFramework == 'materialize') {
                this.$modalDialog.openModal();
            } else if (widget.cssFramework == "bootstrap") {
                this.$modalDialog.modal('show');
            }
        },
        getDataFromForm: function(){
            var model = new this.model();
            var data = model.formToObject(this.$el.find("form"));
            return data;
        },
        errorHandler: function(model, response, options){
            widget.collection.remove(model);
            if (widget.cssFramework == 'materialize')
                Materialize.toast('An ERROR!!!<br />Check your inputs and try again...', 5000);
        },
        fillFormWithData: function(json){
            js2form($(".restWidget .addEditWidgetDialog form")[0], json);
        }
    };
    this.AddEditView = this._AddEditView.extend(options.addEditView ? extendOptions(addEditViewOptions, options.addEditView) : addEditViewOptions);

    this.createAddEditItemView = function(action, item){
        if (this.addEditView) {
            this.addEditView.undelegateEvents();
            delete this.addEditView;
        }
        this.addEditView = new this.AddEditView(action, item)
    };

    this.addEditFormSelector = options.formSelector;

    var mainViewOptions = {
        el: selector + ".restWidget",
        events: {
            "click .widgetAddButton": "addItem",
            "focusin .widgetSearch": "bindSearchListeners",
            "focusout .widgetSearch": "unbindSearchListeners"
        },
        initialize: function(){
            this.$el.html(this.template({}));
            this.collection = widget.collection;
            this.listenTo(this.collection, "all", this.render);
            this.itemView = new widget.ItemView();
            this.$searchInput = this.$el.find(".widgetSearch");
            this.init();
            this.render();
            //this.collection.fetch();
        },
        render: function(){
            this.itemView.render();
            return this;
        },
        init: function(){

        },
        addItem: function(e){
            e.preventDefault();
            widget.createAddEditItemView("create");
            return false;
        },
        searchItems: function(e){
            var value = this.$searchInput.val();
            var matchedItems = this.collection.filter(function(model){
                var reg = new RegExp(value, "i");
                return reg.test(model.get(options.searchFieldName).replace(" ", ""));
            });
            var collection = new widget.Collection(matchedItems);
            this.itemView.render({
                collection: collection
            });
            return false;
        },
        bindSearchListeners: function(e){
            this.$searchInput.keyup($.proxy(this.searchItems, this));
        },
        unbindSearchListeners: function(e){
            this.$searchInput.unbind("keyup");
        }
    };
    this.WidgetView = this._WidgetView.extend(options.mainView ? extendOptions(mainViewOptions, options.mainView) : mainViewOptions);

    this.app = new this.WidgetView();

    return this;
};


function extendOptions (primary, secondary) {
    if (typeof primary !== "object" && typeof secondary !== "object")
        return;
    if (typeof primary.events == "object" && typeof secondary.events == "object") {
        primary.events = _.extend(primary.events, secondary.events);
        delete(secondary["events"])
    }
    return _.extend(primary, secondary);
}
