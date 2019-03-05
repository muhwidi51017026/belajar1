{ Nama           : kevin lorenzo
  NIM            : 52017017
  Nama File      : 52017017.PAS
  Hari / Tanggal : Rabu / 19 Desember 2018
  soal : a}

program FINAL;
uses crt;
type tumpukan=^data;
data=record
info:char;
berikut:tumpukan;
end;
var
atas:tumpukan;
x:char;
p:byte;

procedure inisialisasi (var atas : tumpukan);
begin
new (atas);
atas^.berikut := nil;
end;

procedure push(var atas:tumpukan;x:char);
var baru :tumpukan;
begin
new(baru);
baru^.info:=x;
if atas^.berikut = nil then
begin
atas^.berikut:=baru;
end
else
begin
baru^.berikut :=atas^.berikut;
atas^.berikut :=baru;
end;
writeln('data berhasil ditambahkan ke dalam stack');
readln;
end;

procedure pop(var atas :tumpukan);
var bantu : tumpukan;x:char;
begin
if atas^.berikut =nil then
writeln('tumpukan kosong!')
else
begin
x:= atas^.berikut^.info;
bantu:=atas^.berikut;
atas^.berikut:=bantu^.berikut;
dispose(bantu);
writeln('data berhasil dihapus dari tumpukan');
readln;
end;
end;

procedure input(var atas : tumpukan);
var x :char;
begin
clrscr;
writeln('masukkan data : ');readln(x);
writeln;
push (atas,x);
end;

procedure hapus(var atas : tumpukan);
begin
clrscr;
writeln('penghapusan data dalam stack');
writeln;
writeln;
pop(atas);
end;

procedure lihat(var atas : tumpukan);
var bantu:tumpukan;
begin
clrscr;
writeln('lihat data dalam stack');
writeln;
if atas^.berikut <>nil then
begin
bantu:=atas^.berikut;
repeat
write(bantu^.info:2);
bantu :=bantu^.berikut;
until bantu=nil;
end
else
writeln('tumpukan kosong!');
readln;
end;

{program utama}
begin
inisialisasi (atas);
repeat
clrscr;
writeln('PROGRAM FINAL');
writeln;
writeln('1. INPUT');
writeln('2. HAPUS');
writeln('3. LIHAT');
writeln('4. KELUAR');
writeln;
write('pilih :');readln(p);
case p of
1 :input(atas);
2 :hapus(atas);
3 :lihat(atas);
end;
until p=4;
readln;
end.