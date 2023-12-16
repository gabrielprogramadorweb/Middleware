<?php

namespace App\Http\Middleware;

use Closure;
use Log;
class TerceiroMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next, $nome)
    {
        Log::debug("Passou pelo terceiroMiddleware [ nome = $nome ]");
        return $next($request);
    }
    
}
