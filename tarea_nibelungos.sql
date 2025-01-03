PGDMP  8                
    |            nibelungosnegocios    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16391    nibelungosnegocios    DATABASE     �   CREATE DATABASE nibelungosnegocios WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Venezuela.1252';
 "   DROP DATABASE nibelungosnegocios;
                     postgres    false            �            1259    16393    clientes    TABLE     �   CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nombre text,
    especie text,
    "afilación" text,
    historial_compras text,
    preferencias text,
    presupuesto integer,
    nivel_satisfaccion integer
);
    DROP TABLE public.clientes;
       public         heap r       postgres    false            �            1259    16413    eventos    TABLE     }   CREATE TABLE public.eventos (
    id_evento integer,
    nombre text,
    fecha date,
    tipo text,
    descripcion text
);
    DROP TABLE public.eventos;
       public         heap r       postgres    false            �            1259    16398 	   productos    TABLE     �   CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre text,
    rareza text,
    "poder_mágico" text,
    "condición" text,
    precio integer
);
    DROP TABLE public.productos;
       public         heap r       postgres    false            �            1259    16408    ventas    TABLE     �   CREATE TABLE public.ventas (
    id_venta integer,
    id_cliente integer,
    fecha_venta integer,
    monto_total integer,
    metodo_pago text
);
    DROP TABLE public.ventas;
       public         heap r       postgres    false            �            1259    16427    view_dataclientes    VIEW     b   CREATE VIEW public.view_dataclientes AS
 SELECT nombre,
    preferencias
   FROM public.clientes;
 $   DROP VIEW public.view_dataclientes;
       public       v       postgres    false    217    217            �            1259    16422    vista_productos_disponibles    VIEW     �   CREATE VIEW public.vista_productos_disponibles AS
 SELECT nombre,
    precio,
    rareza
   FROM public.productos p
  WHERE ("condición" = 'Nuevo'::text);
 .   DROP VIEW public.vista_productos_disponibles;
       public       v       postgres    false    218    218    218    218            �            1259    16418    vista_ventas_clientes    VIEW     �   CREATE VIEW public.vista_ventas_clientes AS
 SELECT v.id_venta,
    c.nombre AS nombre_cliente,
    v.fecha_venta,
    v.monto_total
   FROM (public.ventas v
     JOIN public.clientes c ON ((v.id_cliente = c.id_cliente)));
 (   DROP VIEW public.vista_ventas_clientes;
       public       v       postgres    false    219    217    217    219    219    219            �          0    16393    clientes 
   TABLE DATA           �   COPY public.clientes (id_cliente, nombre, especie, "afilación", historial_compras, preferencias, presupuesto, nivel_satisfaccion) FROM stdin;
    public               postgres    false    217          �          0    16413    eventos 
   TABLE DATA           N   COPY public.eventos (id_evento, nombre, fecha, tipo, descripcion) FROM stdin;
    public               postgres    false    220   *       �          0    16398 	   productos 
   TABLE DATA           g   COPY public.productos (id_producto, nombre, rareza, "poder_mágico", "condición", precio) FROM stdin;
    public               postgres    false    218   G       �          0    16408    ventas 
   TABLE DATA           ]   COPY public.ventas (id_venta, id_cliente, fecha_venta, monto_total, metodo_pago) FROM stdin;
    public               postgres    false    219   d       �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     