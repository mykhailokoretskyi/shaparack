$(document).ready(function(){
    catsWidget = restWidget.initialize(
        ".catsWidget",
        {
            collectionOptions: {
                url: '/api/rest/service/cat',
                comparator: function(item){
                    var name = item.get('name');
                    return name ? name.toUpperCase() : name;
                }
            },
            modelOptions: {
                defaults: function(){
                    return {
                        id: null,
                        name: null,
                        title: null,
                        hidden: 'y'
                    };
                }
            },
            itemView: {
                template: _.template($('#catsWidget-itemTemplate').html()),
                events: {
                    "click .editPictures": "editPictures"
                },
                editPictures: function(e){
                    var id;
                    if (typeof e !== "undefined" && e) {
                        e.preventDefault();
                        e.stopPropagation();
                        id = e.currentTarget.dataset.id;
                    }
                    catsWidget.catsImageApp = new catsImageWidget.CatsImageView(id);
                    var item = catsWidget.collection.get(id);
                    var images = item.get("images");
                    return false;
                }
            },
            addEditView: {
                template: _.template($('#catsWidget-addEditItemDialog').html())
            },
            mainView: {
                template: _.template($('#catsWidget-mainRestWidget').html())
            },
            cssFramework: 'bootstrap',
            mainDataset: pageData.catList,
            searchFieldName: "name"
        }
    );
});