var sitemapHistory = {
    stack: new Array(),
    temp: null,
    //takes an element and saves it's position in the sitemap.
    //note: doesn't commit the save until commit() is called!
    //this is because we might decide to cancel the move
    saveState: function(item) {
        sitemapHistory.temp = { item: $(item), itemParent: $(item).parent(), itemAfter: $(item).prev() };
    },
    commit: function() {
        if (sitemapHistory.temp != null) sitemapHistory.stack.push(sitemapHistory.temp);
    },
    //restores the state of the last moved item.
    restoreState: function() {
        var h = sitemapHistory.stack.pop();
        if (h == null) return;
        if (h.itemAfter.length > 0) {
            h.itemAfter.after(h.item);
        }
        else {
            h.itemParent.prepend(h.item);
        }
		//checks the classes on the lists
		$('#category li.cate_li').not(':has(li)').removeClass('cate_li');
		$('#category li:has(ul li):not(.btn_liClosed)').addClass('cate_li');
    }
}

//init functions
$(function() {
    $('#category li').prepend('<div class="dropzone"></div>');

    $('#category dl, #category .dropzone').droppable({
        accept: '#category li',
        tolerance: 'pointer',
        drop: function(e, ui) {
            var li = $(this).parent();
            var child = !$(this).hasClass('dropzone');
            if (child && li.children('ul').length == 0) {
                li.append('<ul/>');
            }
            if (child) {
                li.addClass('cate_li').removeClass('btn_liClosed').children('ul').append(ui.draggable);
            }
            else {
                li.before(ui.draggable);
            }
			$('#category li.cate_li').not(':has(li:not(.ui-draggable-dragging))').removeClass('cate_li');
            li.find('dl,.dropzone').css({ backgroundColor: '', borderColor: '', borderRadius:'3px'});
            sitemapHistory.commit();
        },
        over: function() {
            $(this).filter('dl').css({ backgroundColor: '#f5f5f5' });
            $(this).filter('.dropzone').css({ borderColor: '#f44336' });
        },
        out: function() {
            $(this).filter('dl').css({ backgroundColor: '' });
            $(this).filter('.dropzone').css({ borderColor: '' });
        }
    });
    $('#category li').draggable({
        handle: ' > dl',
        opacity: .8,
        addClasses: false,
        helper: 'clone',
        zIndex: 100,
        start: function(e, ui) {
            sitemapHistory.saveState(this);
        }
    });
    $('.sitemap_undo').click(sitemapHistory.restoreState);
    $(document).bind('keypress', function(e) {
        if (e.ctrlKey && (e.which == 122 || e.which == 26))
            sitemapHistory.restoreState();
    });
	$('.dl_info').live('click', function() {
		$(this).parent().parent().toggleClass('cate_li').toggleClass('btn_liClosed');
		return false;
	});
});
