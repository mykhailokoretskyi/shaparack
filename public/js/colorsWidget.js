$(document).ready(function(){
    colorsWidget = restWidget.initialize(
        ".colorsWidget",
        {
            collectionOptions: {
                url: '/api/rest/service/color',
                comparator: function(item){
                    var label = item.get('label');
                    return label ? label.toUpperCase() : label;
                }
            },
            modelOptions: {
                defaults: function(){
                    return {
                        id: null,
                        code: null,
                        label: null
                    };
                }
            },
            itemView: {
                template: _.template($('#colorsWidget-itemTemplate').html())
            },
            addEditView: {
                template: _.template($('#colorsWidget-addEditItemDialog').html())
            },
            mainView: {
                template: _.template($('#colorsWidget-mainRestWidget').html())
            },
            cssFramework: 'bootstrap',
            mainDataset: pageData.colorList,
            searchFieldName: "label"
        }
    );
});
