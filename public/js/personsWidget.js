$(document).ready(function(){
    personsWidget = restWidget.initialize(
        ".personsWidget",
        {
            collectionOptions: {
                url: '/api/rest/service/person',
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
                template: _.template($('#personsWidget-itemTemplate').html())
            },
            addEditView: {
                template: _.template($('#personsWidget-addEditItemDialog').html())
            },
            mainView: {
                template: _.template($('#personsWidget-mainRestWidget').html())
            },
            cssFramework: 'bootstrap',
            mainDataset: pageData.personList,
            searchFieldName: "lastName"
        }
    );
});
