$(function() {
	$("#btnWyslij").click(async function(e) {
        e.preventDefault()

		const $frm = $("#formZapytanie")
		const resp = await $.post($frm.attr('action'), $frm.serializeArray());
        if(resp === 'ok') {
            alert("Dziękujemy za wysłanie zapytania.")
            $("textarea").val('')
            $('#modalZapytanie').modal('hide')
        } else {
            alert("Wystąpił błąd")
        }
		
		return false
	})


    $("#btnWyslijPdf").click(async function(e) {
        e.preventDefault()

        const $frm = $("#formZapytanieTwo")
        const resp = await $.post($frm.attr('action'), $frm.serializeArray());
        if(resp === 'ok') {
            alert("Dziękujemy za wysłanie zapytania.")
            $('#modalZapytanie').modal('hide')
        } else {
            alert("Wystąpił błąd")
        }

        return false
    })
})