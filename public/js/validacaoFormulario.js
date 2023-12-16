function validarForm() {
    // Limpa mensagens de erro
    document.getElementById('nomeProdutoError').innerText = '';
    document.getElementById('estoqueError').innerText = '';
    document.getElementById('precoError').innerText = '';
    document.getElementById('categoria_idError').innerText = '';

    // Verifica se todos os campos obrigatórios foram preenchidos
    if (document.getElementById('nomeProduto').checkValidity() &&
        document.getElementById('estoque').checkValidity() &&
        document.getElementById('preco').checkValidity() &&
        document.getElementById('categoria_id').checkValidity()) {
        // Se todos os campos estão preenchidos, submit o formulário
        document.getElementById('produtoForm').submit();
    } else {
        // Se algum campo está vazio, atualiza as mensagens de erro
        if (!document.getElementById('nomeProduto').checkValidity()) {
            document.getElementById('nomeProdutoError').innerText = 'Campo obrigatório.';
        }

        if (!document.getElementById('estoque').checkValidity()) {
            document.getElementById('estoqueError').innerText = 'Campo obrigatório.';
        }

        if (!document.getElementById('preco').checkValidity()) {
            document.getElementById('precoError').innerText = 'Campo obrigatório.';
        }

        if (!document.getElementById('categoria_id').checkValidity()) {
            document.getElementById('categoria_idError').innerText = 'Escolha uma categoria.';
        }
    }
}