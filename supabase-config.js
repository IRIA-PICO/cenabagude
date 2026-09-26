// ============================================================
// CONFIGURACIÓN DE SUPABASE — CENA BAGUDE
// ============================================================
// Rellena estos dos valores con los de TU proyecto de Supabase:
// Supabase → Project Settings → API
//
// - CENA_SUPABASE_URL   → "Project URL"
// - CENA_SUPABASE_ANON_KEY → "anon public" key
//
// Estas dos claves son PÚBLICAS a propósito (se ven en el navegador
// de cualquier cliente). La seguridad real la dan las políticas RLS
// definidas en supabase-schema.sql: con la anon key solo se puede
// CREAR pedidos, nunca leerlos ni modificarlos. Para eso hace falta
// iniciar sesión como administrador (ver admin.html).
// ============================================================

window.CENA_SUPABASE_URL = "https://pqqirodppxjuuuiksduo.supabase.co/rest/v1/";
window.CENA_SUPABASE_ANON_KEY = "sb_publishable_c-SnRIbpJHKtmFhmARSQfw_zZrgJlj-";
