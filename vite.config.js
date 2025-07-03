import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'],
            refresh: true,
        }),
        tailwindcss(),
    ],
    server: {
        host: '0.0.0.0', // Permite conexiones desde cualquier IP
        port: 5173,      // Puerto de Vite
        strictPort: true,
        watch: {
            usePolling: true, // Necesario para Docker en algunos sistemas
            interval: 1000,   // Intervalo de polling para mejor rendimiento
        },
        hmr: {
            host: 'localhost', // Host para HMR (Hot Module Replacement)
            port: 5173,
        },
    },
});
