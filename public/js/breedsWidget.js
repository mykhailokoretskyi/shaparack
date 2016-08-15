$(document).ready(function(){
    breedsWidget = restWidget.initialize(
        ".breedsWidget",
        {
            collectionOptions: {
                url: '/api/rest/service/breed',
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
                template: _.template($('#breedsWidget-itemTemplate').html())
            },
            addEditView: {
                template: _.template($('#breedsWidget-addEditItemDialog').html())
            },
            mainView: {
                template: _.template($('#breedsWidget-mainRestWidget').html())
            },
            cssFramework: 'bootstrap',
            mainDataset: pageData.breedList,
            searchFieldName: "label"
        }
    );
});
