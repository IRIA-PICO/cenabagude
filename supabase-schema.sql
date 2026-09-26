-- ============================================================
-- CENA BAGUDE — Esquema de pedidos para Supabase
-- Pega y ejecuta todo este archivo en:
-- Supabase → SQL Editor → New query → Run
-- ============================================================

-- 1) Tabla de pedidos
create table if not exists public.orders (
  id            uuid primary key default gen_random_uuid(),
  created_at    timestamptz not null default now(),
  name          text not null,
  instagram     text not null,
  size          text not null,
  quantity      integer not null check (quantity > 0),
  address       text not null,
  payment_method text not null check (payment_method in ('Efectivo', 'Bizum')),
  comments      text,
  paid          boolean not null default false,
  prepared      boolean not null default false,
  delivered     boolean not null default false
);

-- 2) Activar seguridad a nivel de fila (RLS)
alter table public.orders enable row level security;

-- 3) Cualquier visitante (rol "anon") puede CREAR un pedido...
drop policy if exists "Cualquiera puede crear pedidos" on public.orders;
create policy "Cualquiera puede crear pedidos"
  on public.orders
  for insert
  to anon
  with check (true);

-- 4) ...pero NADIE sin sesión puede leer ni modificar pedidos.
--    Solo un usuario autenticado (el/la encargado/a que inicia sesión
--    en admin.html) puede ver y actualizar los pedidos.
drop policy if exists "Solo administradores leen pedidos" on public.orders;
create policy "Solo administradores leen pedidos"
  on public.orders
  for select
  to authenticated
  using (true);

drop policy if exists "Solo administradores actualizan pedidos" on public.orders;
create policy "Solo administradores actualizan pedidos"
  on public.orders
  for update
  to authenticated
  using (true)
  with check (true);

-- ============================================================
-- 5) CREAR EL USUARIO ADMINISTRADOR (encargados de Cena Bagude)
-- ============================================================
-- Esto NO se hace por SQL. Ve a:
-- Supabase → Authentication → Users → Add user → Create new user
-- Introduce un email y una contraseña (las que usaréis para entrar
-- en /admin.html). Podéis crear uno por cada encargado si queréis.
-- ============================================================

-- ============================================================
-- 6) (Opcional, para más adelante) NOTIFICACIONES POR EMAIL
-- ============================================================
-- Cuando queráis activar el aviso automático al recibir un pedido:
-- Supabase → Database → Webhooks → crea un webhook en "orders" (INSERT)
-- que llame a una Edge Function o a un servicio como Resend/Zapier
-- para enviaros un email. No hace falta tocar nada del código actual
-- para añadir esto más adelante.
-- ============================================================
