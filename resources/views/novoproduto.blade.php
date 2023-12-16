@extends('layout.app', ['current' => 'categorias'])
@section('title', 'Cadastrar Produtos')

@section('body')
    <div class="card border">
        <div class="card-body">
            <form action="/produtos" method="post" id="produtoForm">
                @csrf
                <div class="form-group">
                    <label for="nomeProduto">Inserir dados do novo produto.</label>
                    <input type="text" class="form-control col-md-2" name="nomeProduto" id="nomeProduto" placeholder="Nome" required>
                    <span id="nomeProdutoError" class="text-danger"></span>

                    <input type="number" class="form-control col-md-2" name="estoque" id="estoque" placeholder="Quantidade em estoque" required>
                    <span id="estoqueError" class="text-danger"></span>

                    <input type="number" class="form-control col-md-2" name="preco" id="preco" placeholder="Preço" required>
                    <span id="precoError" class="text-danger"></span>

                    @isset($categorias)
                        <label for="categoria_id">Escolha a categoria</label>
                        <select class="form-control col-md-2" name="categoria_id" id="categoria_id" required>
                            <option value="" disabled selected>Selecione uma categoria</option>
                            @foreach ($categorias as $categoria)
                                <option value="{{ $categoria->id }}">{{ $categoria->nome }}</option>
                            @endforeach
                        </select>
                        <span id="categoria_idError" class="text-danger"></span>
                    @endisset
                </div>

                <button type="button" class="btn btn-primary btn-sm" onclick="validarForm()">Salvar</button>
                <button type="button" class="btn btn-danger btn-sm">Cancelar</button>
            </form>
        </div>
    </div>

    <!-- Script para verificar se os campos estão definidos antes de enviar -->
    <script src="{{ asset('js/validacaoFormulario.js') }}" defer></script>

@endsection
