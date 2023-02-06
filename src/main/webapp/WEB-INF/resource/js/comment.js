/**
 * 
 */

console.log("Comment Module...");

var commentService = (function() {
	
	function add(comment, callback, error) {
		console.log("add Comment.........");
		
		$.ajax({
			type : 'POST',
			url : '/comment/new',
			data : JSON.stringify(comment),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		})
	}
	
	function getList(param, callback, error) {
		var review_no = param.review_no;
		var page = param.page || 1;
		
		$.getJSON("/comment/pages/" + review_no + "/" + page + ".json",
				function(data) {
					if(callback) {
						callback(data);
					}
				}).fail(function(xhr, status, err) {
					if(error) {
						error();
					}
				});
	}
	
	function remove(comment_no, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/comment/' + comment_no,
			success : function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	function get(comment_no, callback, error) {
		$.get("/comment/" + comment_no + ".json", function(result) {
			if(callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	
	return {
		add : add,
		getList : getList,
		remove : remove,
		get : get
	};
	
})();