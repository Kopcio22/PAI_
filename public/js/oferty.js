$(function() {
	$(".aDodajDoKoszyka").click(function() {
		const $link = $(this);
		const url = $(this).attr('href');
		const dodano = '<i class="fas fa-check-circle text-success"></i>';

		$.post(url, function(resp) {
			if (resp === 'ok') {
				$link.replaceWith(dodano);
			} else {
				alert('Wystąpił błąd');
			}
		});

		return false;
	});
});

/*
$(function() {
	$(".aDodajDoKoszyka").click(async (e) => {
	    e.preventDefault()

        const $link = $(e.currentTarget);
        const url = $link.attr('href');
        const dodano = '<i class="fas fa-check-circle text-success"></i>';

        const wynik = await $.post(url)
        if (wynik === 'ok') {
            $link.replaceWith(dodano);
        } else {
            alert('Wystąpił błąd');
        }
    });
});
 */