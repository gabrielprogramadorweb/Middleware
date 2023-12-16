$.ajaxSetup({
    headers: {
        "X-CSRF-TOKEN": "{{ csrf_token() }}",
    },
});

function novoProduto() {
    $("#id").val("");
    $("#nomeProduto").val("");
    $("#precoProduto").val("");
    $("#quantidadeProduto").val("");
    $("#dlgProdutos").modal("show");
}

function carregarCategorias() {
    $.getJSON("/api/categorias", function (data) {
        for (i = 0; i < data.length; i++) {
            opcao =
                '<option value ="' +
                data[i].id +
                '">' +
                data[i].nome +
                "</option>";
            $("#categoriaProduto").append(opcao);
        }
    });
}

function montarLinha(p) {
    var linha =
        "<tr>" +
        "<td>" +
        p.id +
        "</td>" +
        "<td>" +
        p.nome +
        "</td>" +
        "<td>" +
        p.estoque +
        "</td>" +
        "<td>" +
        p.preco +
        "</td>" +
        "<td>" +
        p.categoria.nome +
        "</td>" + // Alteração aqui para acessar o nome da categoria
        "<td>" +
        '<button class="btn btn-sm btn-primary" onclick="editar(' +
        p.id +
        ')"> Editar </button> ' +
        '<button class="btn btn-sm btn-danger" onclick="remover(' +
        p.id +
        ')"> Apagar </button> ' +
        "</td>" +
        "</tr>";
    return linha;
}

function editar(id) {
    $.getJSON("/api/produtos/" + id, function (data) {
        console.log(data);
        $("#id").val(data.id);
        $("#nomeProduto").val(data.nome);
        $("#precoProduto").val(data.preco);
        $("#quantidadeProduto").val(data.estoque);
        // Atualize o campo de seleção de categoria para o nome da categoria
        $("#categoriaProduto").val(data.categoria_id);
        $("#dlgProdutos").modal("show");
    });
}

function remover(id) {
    $.ajax({
        type: "DELETE",
        url: "/api/produtos/" + id,
        context: this,
        success: function () {
            console.log("Apagou OK");
            linhas = $("#tabelaProdutos>tbody>tr");
            e = linhas.filter(function (i, elemento) {
                return elemento.cells[0].textContent == id;
            });
            if (e) e.remove();
        },
        error: function (error) {
            console.log(error);
        },
    });
}

function carregarProdutos() {
    $.getJSON("/api/produtos", function (produtos) {
        for (i = 0; i < produtos.length; i++) {
            linha = montarLinha(produtos[i]);
            $("#tabelaProdutos>tbody").append(linha);
        }
    });
}

function criarProduto() {
    prod = {
        nome: $("#nomeProduto").val(),
        preco: $("#precoProduto").val(),
        estoque: $("#quantidadeProduto").val(),
        categoria_id: $("#categoriaProduto").val(),
    };
    $.post("/api/produtos", prod, function (data) {
        produto = JSON.parse(data);
        linha = montarLinha(produto);
        $("#tabelaProdutos>tbody").append(linha);
    });
}

function salvarProduto() {
    prod = {
        id: $("#id").val(),
        nome: $("#nomeProduto").val(),
        preco: $("#precoProduto").val(),
        estoque: $("#quantidadeProduto").val(),
        categoria_id: $("#categoriaProduto").val(),
    };
    $.ajax({
        type: "PUT",
        url: "/api/produtos/" + prod.id,
        context: this,
        data: prod,
        success: function (data) {
            prod = JSON.parse(data);
            linhas = $("#tabelaProdutos>tbody>tr");
            e = linhas.filter(function (i, e) {
                return e.cells[0].textContent == prod.id;
            });
            if (e) {
                e[0].cells[0].textContent = prod.id;
                e[0].cells[1].textContent = prod.nome;
                e[0].cells[2].textContent = prod.estoque;
                e[0].cells[3].textContent = prod.preco;
                e[0].cells[4].textContent = prod.categoria_id;
            }
        },
        error: function (error) {
            console.log(error);
        },
    });
}

$("#formProduto").submit(function (event) {
    event.preventDefault();
    if ($("#id").val() != "") salvarProduto();
    else criarProduto();

    $("#dlgProdutos").modal("hide");
});

$(function () {
    carregarCategorias();
    carregarProdutos();
});
