<nav class="navbar navbar-expand w-100% navbar-light bg-light shadow mb-2">
    <div class="container">
        <a class="navbar-brand" href="/">Estoque</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item <?php echo request()->is('/') ? 'active' : ''; ?>">
                    <a class="nav-link" href="/">Home</a>
                </li>
                <li class="nav-item <?php echo request()->is('produtos') ? 'active' : ''; ?>">
                    <a class="nav-link" href="/produtos">Produtos</a>
                </li>
                <li class="nav-item <?php echo request()->is('categorias') ? 'active' : ''; ?>">
                    <a class="nav-link" href="/categorias">Categorias</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
