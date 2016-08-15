catsImageWidget = {
    _Model: webWidget.model.extend({

    }),
    _View: webWidget.view.extend({
        initialize: function () {
            this.init();
        },
        init: function () {

        }
    })
};
catsImageWidget._Collection = webWidget.collection.extend({
    url: "",
    model: catsImageWidget._Model
});
catsImageWidget.AddedImagesView = catsImageWidget._View.extend({
    el: ".addedImages",
    template: _.template($("#imageList").html()),
    initialize: function(images){
        //this.render(images);
        return this;
    },
    render: function(images){

        this.$el.html(this.template({
            data: {
                images: images,
                mode: 'added'
            }
        }));
        return this;
    }
});

catsImageWidget.OtherImagesView = catsImageWidget._View.extend({
    el: ".otherImages",
    template: _.template($("#imageList").html()),
    initialize: function(images){
        //this.render(images);
        return this;
    },
    render: function(images){

        this.$el.html(this.template({
            data: {
                images: images,
                mode: 'other'
            }
        }));
        return this;
    }
});

catsImageWidget.CatsImageView = catsImageWidget._View.extend({
    el: ".catsImageWidget",
    template: _.template($("#catsImageDialog").html()),
    events: {
        "click .closeCatsImageDialog": "closeDialog",
        "click .addImageToCat": "addImageToCat",
        "click .removeImageFromCat": "removeImageFromCat"
    },
    initialize: function(id){
        this.collection = new catsImageWidget._Collection(pageData.imageList);
        this.catId = id;
        this.render();

        var collection = this.collection.clone();
        var itemImages = catsWidget.collection.get(id).get("images");
        collection.remove(itemImages);
        var imageList = collection.toJSON();
        this.addedImagesView = new catsImageWidget.AddedImagesView();
        this.otherImagesView = new catsImageWidget.OtherImagesView();
        this.addedImagesView.render(itemImages);
        this.otherImagesView.render(imageList);
        this.$dialog = $(this.$el).find('.modal');
        this.showDialog();
    },
    render: function(){
        var id = this.catId;

        this.$el.html(this.template());

        return this;
    },
    showDialog: function(){
        var self = this;

        this.$dialog.on('hidden.bs.modal', function (e) {
            e.preventDefault();
            e.stopPropagation();
            var app = catsWidget.catsImageApp;
            if (app) app.undelegateEvents();
            delete catsWidget.catsImageApp;
        });
        this.$dialog.modal('show');
    },
    closeDialog: function(e){

        e.preventDefault();
        var app = catsWidget.catsImageApp;
        app.$dialog.modal('hide');
    },
    addImageToCat: function(e){
        var self = this;
        e.preventDefault();
        e.stopPropagation();

        var imageId = e.currentTarget.dataset.id;
        var url = "/tools/cats/edit/" + this.catId + "/addImage/" + imageId;

        $.ajax(url, {
            success: function(){
                var image = self.collection.get(imageId).toJSON();
                var cat = catsWidget.collection.get(self.catId);
                var catImages = cat.get("images");
                catImages.push(image);
                cat.set({
                    images: catImages
                });
                catsWidget.collection.add(cat, {merge: true});
                self.addedImagesView.render(catImages);
                var tempCollection = self.collection.clone();
                tempCollection.remove(catImages);
                self.otherImagesView.render(tempCollection.toJSON());

            },
            error: function(){

            }
        });
        return false;
    },
    removeImageFromCat: function(e){
        var self = this;
        e.preventDefault();
        e.stopPropagation();
        var imageId = e.currentTarget.dataset.id;
        var url = "/tools/cats/edit/" + this.catId + "/removeImage/" + imageId;
        $.ajax(url, {
            success: function(){
                var image = self.collection.get(imageId).toJSON();
                var cat = catsWidget.collection.get(self.catId);
                var catImages = cat.get("images");
                var newImages = [];
                _.each(catImages, function(item){
                    if (image.id != item.id)
                        newImages.push(item);
                });
                cat.set({
                    images: newImages
                });
                catsWidget.collection.add(cat, {merge: true});
                self.addedImagesView.render(newImages);
                var tempCollection = self.collection.clone();
                tempCollection.remove(catImages);
                self.otherImagesView.render(tempCollection.toJSON());
            },
            error: function(){
            }
        });
        return false;
    }
});
