 xquery version "3.1";

declare variable $selectSet external := $selectSet;

delete node //boss[@id=$selectSet]


