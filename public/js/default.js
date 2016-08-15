/*
	REST
*/

var REST = function(action){
	this.action = action;
};

REST.prototype.get = function(id, callback){
    var url = this.action + '/' + id;
    jQuery.ajax(
        {
            url: url,
            async: true,
            method: 'GET',
            success: callback
        }
    );
};

REST.prototype.getAll = function(callback){
    jQuery.ajax(
        {
            url: this.action,
            async: true,
            method: 'GET',
            success: callback
        }
    );
};

REST.prototype.post = function(data, callback) {
    jQuery.ajax({
        url: this.action,
        async: true,
        method: 'POST',
        data: data,
        success: callback
    });
};

REST.prototype.update = function(id, data, callback) {
    if (!id) return;
    var url = this.action + '/' + id;
    jQuery.ajax({
        url: url,
        async: true,
        method: 'PUT',
        data: data,
        success: callback
    });
};

REST.prototype.delete = function(id, callback) {
    if (!id) return;
    var url = this.action + '/' + id;
    jQuery.ajax({
        url: url,
        async: true,
        method: 'DELETE',
        success: callback
    });
};

/*
    Images 
*/

var Images = function(container) {
    REST.call(this, '/rest/image');
    this.container = container;
    this.init();
};

Images.prototype = Object.create(REST.prototype);

Images.prototype.get = function(id) {
    var self = this;
    REST.prototype.get.call(this, id, function(data, status){
                self.data = data;
                self.updateDropdown();
    });
};

Images.prototype.getAll = function() {
    var self = this;
    REST.prototype.getAll.call(this, function(data, status){
                self.data = data;
                self.render();
    });
};

Images.prototype.post = function() {
    var self = this;
    REST.prototype.post.call(
                this,
                {
                        code: self.uIElements.codeInput.val(),
                        label: self.uIElements.labelInput.val()
                },
                function(data, status){
                        self.getAll();
                }
    );
};

Images.prototype.update = function(id) {
    if (!id) return;
    var self = this;
    REST.prototype.update.call(
                this,
                id,
                {
                        code: self.uIElements.codeInput.val(),
                        label: self.uIElements.labelInput.val(),
                        id: self.uIElements.dropdown.val()
                },
                function(data, status){
                        self.getAll();
                }
    )
};

Images.prototype.delete = function(id) {
    if (!id) return;
    var self = this;
    REST.prototype.delete.call(
                this,
                id,
                function(data, status){
                        self.getAll();
                }
    )
};

Images.prototype.init = function() {
    var result = this.getAll();
    if (result) {
        this.data = result;
        this.render();
    }
};

Images.prototype.render = function() {
    var self = this;
    var element = jQuery(this.container);
    element.empty();
    for (var i in this.data) {
        var checked = (self.isGaleria(this.data[i].id)) ? ' checked="checked"' : '';
        element.append('<div class="media"><div class="media-left"><img class="media-object" src="/' +
            this.data[i].dir + '/thumb/' + this.data[i].file_name +
            '" alt="' + this.data[i].file_name + '"></div><div class="media-body"><h4 class="media-heading">' +
            this.data[i].file_name + '</h4><a href="#" class="btn btn-error" data-id="' +
            this.data[i].id + '">Удалить</a><br /><input type="checkbox" class="btn btn-info" data-id="' +
            this.data[i].id + '"' + checked + '> Привязана к галерее</div></div>');
    }
    element.find('a.btn-error').bind('click', function(event){
        event.preventDefault();
        self.delete(jQuery(this).attr('data-id'));
    });
    element.find('input[type=checkbox]').bind('click', function(event){
        if (jQuery(this).prop('checked')) {
            self.addToGaleria(jQuery(this).attr('data-id'));
        }
        else {
            self.removeFromGaleria(jQuery(this).attr('data-id'));
        }
    });
};

Images.prototype.addToGaleria = function(id) {
    jQuery.ajax(
        {
            url: '/rest/galeriaImages/' + id,
            async: true,
            method: 'POST',
            success: function(data){
                console.log(data);
            }
        }
    );
};

Images.prototype.removeFromGaleria = function(id) {
    jQuery.ajax(
        {
            url: '/rest/galeriaImages/' + id,
            async: true,
            method: 'DELETE',
            success: function(data){
                console.log(data);
            }
        }
    );
};

Images.prototype.getAllGaleriaImages = function() {
    var self = this;
    jQuery.ajax(
        {
            url: '/rest/galeriaImages/',
            async: false,
            method: 'GET',
            success: function(data){
                console.log("DONE");
                self.galeriaImages = data;
            }
        }
    );
};

Images.prototype.isGaleria = function(id) {
    console.log(this.galeriaImages);

    for (var i in this.galeriaImages) {
        console.log(this.galeriaImages[i].image_id);
        console.log(i);
        if (this.galeriaImages[i].image_id == id)
            return true;
    }
    return false;
};
