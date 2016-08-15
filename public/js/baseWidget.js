//####################################
//   BaseWidget
//####################################

webWidget = {};

webWidget.model = Backbone.Model.extend({
    defaults: function(){
        return {};
    },
    getSpringFormRepresentation: function(){
        var springRepresentation = {};
        var jsonItem = this.toJSON();
        jsonItem.birthDate = jsonItem.birthDate ? this.convertDateForForm(jsonItem.birthDate) : null;
        this._toSpringForm(jsonItem, false, springRepresentation);
        return springRepresentation;
    },
    convertDateForForm: function(timestamp){
        var date = new Date(timestamp);
        var array = [date.getFullYear(), date.getMonth() + 1, date.getDate()];
        return array.join('-');
    },
    _toSpringForm: function(json, nestedObject, destinationObject){
        var self = this;
        $.each(json, function(key, value){
            newNodes = nestedObject ? nestedObject.slice() : [];
            newNodes.push(key);

            if (typeof(value)=="object" && value != null)
                self._toSpringForm(value, newNodes, destinationObject);
            else
                destinationObject[newNodes.join('.')] = value;
        });
    },
    formToObject: function(selector){
        var data = $(selector).toObject({mode: "all"});
        return data.shift();
    }
});

webWidget.collection = Backbone.Collection.extend({

});

webWidget.view = Backbone.View.extend({

});