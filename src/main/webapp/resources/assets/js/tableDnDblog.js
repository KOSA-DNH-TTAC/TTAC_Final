function inline_sprintlist_ondrop(table, row) {
    var result = $(table).parent().find('.result'),
        pre = $('<pre class="prettyprint">');
    result.html(pre.text($.tableDnD.jsonize(true)));
    prettyPrint();
    //            pre.text($(table).tableDnD.jsonize())
    //        return true;
    //// '<div class="indent">&nbsp;</div>',
}

$(document).ready(function () {
    // Initialise the first table (as before)
    $("#dragtable").tableDnD();
    // Make a nice striped effect on the table
    table_2 = $("#table-2");
    table_2.find("tr:even").addClass("alt");
    // Initialise the second table specifying a dragClass and an onDrop function that will display an alert
    table_2.tableDnD({
        onDragClass: "myDragClass",
        onDrop: function (table, row) {
            var rows = table.tBodies[0].rows;
            var debugStr = "Row dropped was " + row.id + ". New order: ";
            for (var i = 0; i < rows.length; i++) {
                debugStr += rows[i].id + " ";
            }
            $(table).parent().find('.result').text(debugStr);
        },
        onDragStart: function (table, row) {
            $(table).parent().find('.result').text("Started dragging row " + row.id);
        }
    });
    $('#table-3').tableDnD({
        onDragStart: function (table, row) {
            $(table).parent().find('.result').text('');
        },
        onDrop: function (table, row) {
            $('#AjaxResult').load("server/ajaxTest.php?" + $.tableDnD.serialize())
                .parent().find('.result').html($('<p>').append('Result of $.tableDnD.serialize() is url encoded: ')
                .append($('<pre class="prettyprint">').text($.tableDnD.serialize()))
                .append(' Which looks like this when decoded (decodeURI): ')
                .append($('<pre class="prettyprint">').text(decodeURI($.tableDnD.serialize()))));
        }
    });
    $('#table-4').tableDnD(); // no options currently
    $('#table-5').tableDnD({
        onDragStart: function (table, row) {
            $(table).parent().find('.result').text('');
        },
        onDrop: function (table, row) {
            var data = $(table).tableDnDSerialize();
            $(table).parent().find('.result').append(
            $('<strong>').text('The urlencoded serialized string:'))
                .append($('<pre class="prettyprint">').text(data))
                .append($('<strong>').text('Which looks like this through decodeURIComponent:'))
                .append($('<pre class="prettyprint">').text(decodeURIComponent(data)));
        },
        dragHandle: ".dragHandle"
    });
    $("#dragtable ").find("tr").hover(function () {
        $(this.cells[0]).addClass('showDragHandle');
    }, function () {
        $(this.cells[0]).removeClass('showDragHandle');
    });
    $('#table-7').tableDnD({
        hierarchyLevel: 4,
        onDragStart: function (table, row) {
            $(table).parent().find('.result').text('');
        },
        onDrop: function (table, row) {
            $(table).parent().find('.result').append(
            $('<strong>').text('JSON.stringify result of $.tableDnD.tableData()'))
                .append($('<pre class="prettyprint">').text($.tableDnD.jsonize(true)));
            $.post("server/ajaxJSONTest.php", $.tableDnD.jsonize(), function (data) {
                $('#table-7-response').html('<br>' + data);
            });
        }
    });
    $('.toggle-json6').toggle(function () {
        $(this).text('Show JSON');
        $('json6').hide();
        return false;
    },

    function () {
        $(this).text('Hide JSON');
        $('json6').show();
        return false;
    });
    $('.toggle-json7').toggle(function () {
        $(this).text('Show JSON');
        $('json7').hide();
        return false;
    },

    function () {
        $(this).text('Hide JSON');
        $('json7').show();
        return false;
    });
    $('#radio-button-test').tableDnD();
});