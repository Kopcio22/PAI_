$(function() {
	$(".aDodajDoKoszyka").click(function() {
		const $link = $(this);
		const url = $(this).attr('href');
		const dodano = '<i class="fas fa-check-circle text-success"></i>';
		
		$.post(url, function(resp) {
			if (resp === 'ok') {
				$link.replaceWith(dodano);
				location.reload();
			} else {
				alert('Wystąpił błąd');
			}
		});
		return false;
	});
});