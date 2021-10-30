function downloadPDF(titulo)
{
    var img = new Image(),
        canvas = document.createElement("canvas"),
        ctx = canvas.getContext("2d");
    img.src = 'images/escudo_epn.png';

    img.onload = function () {
        ctx.drawImage(img, 0, 0);
        var imgData = canvas.toDataURL('image/png');

        var doc = new jsPDF();
        doc.text(titulo, 20, 40);
        doc.addImage(imgData, 'PNG', 15, 5, 40, 20);
        doc.setFont("times", "bold");
        doc.text("ESCUELA POLITÉCNICA NACIONAL", 105, 10, null, null, "center");
        doc.setFontSize(12);
        doc.setFont("times", "normal");
        doc.text("Campus Politécnico \"J. Rubén Orellana\"", 105, 15, null, null, "center");
        doc.line(40, 16.5, 170, 16.5);
        doc.line(20, 45, 190, 45);
        doc.text("Dirección: Av. Ladrón de Guevara E11-253, Quito - Ecuador", 105, 20, null, null, "center");
        var elementHTML = $('#contenido').html();
        var specialElementHandlers = {
            '#elementH': function (element, renderer) {
                return true;
            }
        };
        doc.fromHTML(elementHTML, 20, 50, {
            'width': 160,
            'elementHandlers': specialElementHandlers
        });

        // Save the PDF
        doc.save('sample-document.pdf');
    }
}

function hideBack() {
    $("#myModal").modal("hide");
}

function validateEmail(emailAddr) {
    var boton = document.getElementsByClassName("btnEnviar")[0];
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(emailAddr.value)) {
        console.log("ok");
        boton.disabled = false;
    }
    else {
        boton.disabled = true;
    }
}