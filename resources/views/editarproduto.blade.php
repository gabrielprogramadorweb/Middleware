@extends('layout.app', ['current' => 'categorias'])

@section('title', 'Editar Produtos')

@section('body')
    <div class="card border">
        <div class="card-body">
            <form action="/produtos/{{$produto->id}}" method="post">
                @csrf
                @method('PUT') {{-- Adicione isso para indicar que é uma atualização --}}
                <div class="form-group">
                    <label for="nomeProduto">Nome do Produto</label>
                    <input type="text" class="form-control col-md-2" name="nomeProduto" value="{{$produto->nome}}" id="nomeProduto" placeholder="Produto">
                </div>
                <div class="form-group">
                    <label for="estoque">Estoque</label>
                    <input type="text" class="form-control col-md-2" name="estoque" value="{{$produto->estoque}}" id="estoque" placeholder="Estoque">
                </div>
                <div class="form-group">
                    <label for="preco">Preço</label>
                    <input type="text" class="form-control col-md-2" name="preco" value="{{$produto->preco}}" id="preco" placeholder="Preço">
                </div>
                @isset($categorias)
                    <div class="form-group">
                        <label for="categoria_id">Escolha a categoria</label>
                        <select class="form-control col-md-2" name="categoria_id" id="categoria_id">
                            @foreach ($categorias as $categoria)
                                <option value="{{ $categoria->id }}" @if($categoria->id == $produto->categoria_id) selected @endif>{{ $categoria->nome }}</option>
                            @endforeach
                        </select>
                    </div>
                @endisset
                <button type="submit" class="btn btn-primary btn-sm">Salvar</button>
                <a href="/produtos" class="btn btn-danger btn-sm">Cancelar</a>
            </form>
        </div>
    </div>
@endsection
