xquery version "3.1";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";

declare variable $juego external := $juego;
declare variable $nombre external := $nombre;
declare variable $genero external := $genero; 
declare variable $lore external := $lore; 
declare variable $arma1 external := $arma1; 
declare variable $arma2 external := $arma2; 
declare variable $localizacion external := $localizacion;
declare variable $bossId external := $bossId;


let $imagen := //boss[@id=$bossId]/imagen

let $boss :=
    <boss id="{$bossId}" juego="{$juego}">
        <nombre>{$nombre}</nombre>
        <genero>{$genero}</genero>
        <descripcion>{$lore}</descripcion>
        <armas>
            <arma>{$arma1}</arma>
            <arma>{$arma2}</arma>
        </armas>
        <imagen>{$imagen}</imagen>
        <localizacion>{$localizacion}</localizacion>
    </boss>

return
    replace node //boss[@id = $bossId] with $boss
